# Maintainer: Simao Gomes Viana <xdevs23@outlook.com>
# Original Maintainer: Matt Parnell/ilikenwf <parwok@gmail.com>
# Original PKGBUILD Contributor: Patrick Bartels <p4ddy.b@gmail.com>
# Thanks to Bregol
pkgname="linux-nitrous-git"
pkgver=5.3.8
pkgdesc="Modified linux-nitrous kernel optimized for Haswell (and newer) compiled using clang"
url="https://gitlab.com/xdevs23/linux-nitrous"
license=("GPL2")
makedepends=("git" "coreutils")
true && pkgbase="linux-nitrous-git"
true && pkgname=("linux-nitrous-git" "linux-nitrous-git-headers")
arch=("x86_64")
pkgrel=1
options=("!strip")
source=("linux-nitrous.conf"
        "linux-nitrous.preset"
        'git+https://gitlab.com/xdevs23/linux-nitrous#branch=v5.3+')
sha256sums=('6373073ad943e068478ef1373be4eb2a7e473da8743d946f1f50cd364685ab87'
            '54bc90a27bb2f42aff4a460c26f88f44e2a2f6c19ec51e7fcac83c4cd1fb9968'
            'SKIP')
_CORES=$(nproc --all)

# compress the modules or not
_compress="y"

# don't compress the package - we're just going to uncompress during install in a moment
PKGEXT='.pkg.tar'

prepare() {
	cd "${srcdir}/linux-nitrous"
	
	# Number of CPU Cores
	if [ $_CORES -lt 1 ]; then
		_CORES=2
	fi
	
	git reset --hard
}

pkgver() {
	cd "${srcdir}/linux-nitrous"
	eval $(grep -o "^\(VERSION\|PATCHLEVEL\|SUBLEVEL\) = [0-9a-zA-Z_-]\+" Makefile | tr -d \ )
	printf "%s.%s.%s" $VERSION $PATCHLEVEL $SUBLEVEL
}

build() {
	cd "${srcdir}/linux-nitrous"
		
	# don't run depmod on 'make install'. We'll do this ourselves in packaging
	sed -i '2iexit 0' scripts/depmod.sh

	if [ ! -d "${srcdir}/build" ]; then
		msg2 "Creating build directory..."
		mkdir -p "${srcdir}/build"
	else
		if [ -f "${srcdir}/build/.config" ]; then
			msg "Cleaning build directory"
			
			rm -rf "${srcdir}/build"
						
			cd "${srcdir}/linux-nitrous"
			make clean &> /dev/null
			make mrproper &> /dev/null
			
                        msg "Generating new config"
			make -C "${srcdir}/linux-nitrous/" O="${srcdir}/build" CC=clang nitrous_defconfig > /dev/null
		fi
	fi

	if [ ! -f "${srcdir}/build/.config" ]; then
      		msg2 "Generating config..."
		make -C "${srcdir}/linux-nitrous/" O="${srcdir}/build" CC=clang nitrous_defconfig > /dev/null
	fi

	msg2 "Updating output directory Makefile..."
	make -C "${srcdir}/linux-nitrous/" O="${srcdir}/build" CC=clang outputmakefile

	warning "Press ENTER if you want to build the kernel or CTRL+C to abort..."
	read
	
	cd "${srcdir}/build"

	msg2 "Building kernel..."; make -j$_CORES CC=clang bzImage
	msg2 "Building modules..."; make -j$_CORES CC=clang modules
}

package_linux-nitrous-git() {
	depends=("coreutils" "linux-firmware" "kmod" "mkinitcpio>=0.5.20")
	provides=("linux-nitrous" "linux-nitrous-git")
	optdepends=("linux-nitrous-git-headers: to build third party modules such as NVIDIA drivers or OSSv4"
	            "crda: to set the correct wireless channels of your country")
	backup=(etc/mkinitcpio.d/linux-nitrous.conf)
	install=linux-nitrous.install

	msg2 "Determining kernel name..."
	cd "${srcdir}/build"
	_kernver="$(make kernelrelease -s)"
	msg2 "Kernel release name is: $_kernver"

	cd "${srcdir}/build"
	mkdir -p "$pkgdir/usr/lib"

	cd "${srcdir}/build"

	msg2 "Installing kernel image..."
	install -D -m644 "arch/x86/boot/bzImage" "$pkgdir/boot/vmlinuz-linux-nitrous"

	msg2 "Installing modules (and firmware files)..."
	make INSTALL_MOD_PATH="$pkgdir" modules_install

	if [ -d "$pkgdir/lib/firmware" ]; then
		msg2 "Removing firmware files..."
		rm -r "$pkgdir/lib/firmware"
	fi
	
	if [ $_compress = "y" ]; then
		msg2 "Compressing kernel modules with gzip..."
		find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
	fi
	
	# make room for external modules
	if [ -d "${pkgdir}/usr/lib/modules/extramodules-*" ]; then
		rmdir "${pkgdir}/usr/lib/modules/extramodules-*" &> /dev/null
	fi

	# add real version for building modules and running depmod from post_install/upgrade
	mkdir -p "${pkgdir}/usr/lib/modules/extramodules-${_kernver}"
	echo "${_kernver}" > "${pkgdir}/usr/lib/modules/extramodules-${_kernver}/version"
	
	# symlink extra
	mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}"
	cd "${pkgdir}/usr/lib/modules/${_kernver}"
	ln -s "../extramodules-${_kernver}" "./extramodules"

	cd "${srcdir}/build"

	msg2 "Removing links to source and build directory..."
	rm "$pkgdir/lib/modules/$_kernver/"{build,source}

	msg2 "Updating kernel version in install script..."
	sed -i "s/_kernel_version=.*/_kernel_version=$_kernver/" \
		"$startdir/linux-nitrous.install"

	msg2 "Installing files for mkinitcpio..."
	install -D -m644 "${srcdir}/linux-nitrous.conf" \
		"$pkgdir/etc/mkinitcpio.d/linux-nitrous.conf"
	
	install -D -m644 "${srcdir}/linux-nitrous.preset" \
		"$pkgdir/etc/mkinitcpio.d/linux-nitrous.preset"
	sed -i "s/^ALL_kver=.*$/ALL_kver=$_kernver/" \
		"$pkgdir/etc/mkinitcpio.d/linux-nitrous.preset"

	# Now we call depmod...
	depmod -b "$pkgdir" -F System.map "$_kernver"
	
	# move module tree /lib -> /usr/lib
	cp -a "$pkgdir/lib" "$pkgdir/usr/"
	
	rm -rf "$pkgdir/lib"
	find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

package_linux-nitrous-git-headers() {
	# AUR workaround
	true && pkgdesc="Header files and scripts for building modules for linux-nitrous"
	true && depends=("linux-nitrous-git")
	true && conflicts=("linux-nitrous-headers")
	true && provides=("linux-headers linux-nitrous-git-headers linux-nitrous-headers")

	_srcdir="/usr/src/linux-$_kernver"

	msg2 "Installing files necessary for 3rd party modules such as NVIDIA drivers or OSSv4..."
	mkdir -p "${pkgdir}/usr/src/linux-$_kernver/"{arch/x86,include,tools/objtool}

	install -D -m755 "${srcdir}/build/tools/objtool/objtool" "${pkgdir}/usr/src/linux-$_kernver/tools/objtool/objtool"	
	install -D -m644 "${srcdir}/linux-nitrous/Makefile" "${pkgdir}/usr/src/linux-$_kernver/Makefile"
	install -D -m644 "${srcdir}/linux-nitrous/kernel/Makefile" "${pkgdir}/usr/src/linux-$_kernver/kernel/Makefile"
	install -D -m644 "${srcdir}/build/.config" "${pkgdir}/usr/src/linux-$_kernver/.config"
	install -D -m644 "${srcdir}/build/Module.symvers" "${pkgdir}/usr/src/linux-$_kernver/Module.symvers"
	install -D -m644 "${srcdir}/build/include/generated/uapi/linux/version.h" "${pkgdir}/usr/src/linux-$_kernver/include/linux/version.h"
	install -D -m644 "${srcdir}/build/arch/x86/kernel/asm-offsets.s" "${pkgdir}/usr/src/linux-$_kernver/arch/x86/kernel/asm-offsets.s"
	install -D -m644 "${srcdir}/linux-nitrous/arch/x86/Makefile" "${pkgdir}/usr/src/linux-$_kernver/arch/x86/Makefile"

	if [ "$CARCH" = "i686" ]; then
		install -D -m644 "${srcdir}/linux-nitrous/arch/x86/Makefile_32.cpu" "${pkgdir}/usr/src/linux-$_kernver/arch/x86/Makefile_32.cpu"
	fi

	cp -a "${srcdir}/linux-nitrous/scripts" "${pkgdir}/usr/src/linux-$_kernver"
	cp -a "${srcdir}/build/scripts" "${pkgdir}/usr/src/linux-$_kernver"
	cp -a "${srcdir}/linux-nitrous/include" "${pkgdir}/usr/src/linux-$_kernver"
	cp -a "${srcdir}/build/include/"{generated,config} "${pkgdir}/usr/src/linux-$_kernver/include"
	cp -a "${srcdir}/linux-nitrous/arch/x86/include" "${pkgdir}/usr/src/linux-$_kernver/arch/x86"
	cp -a "${srcdir}/build/arch/x86/include" "${pkgdir}/usr/src/linux-$_kernver/arch/x86"

	cd "${srcdir}/linux-nitrous"
	{
		find drivers -type f -name "*.h";
		find . -type f -name "Kconfig*";
	} | while read file; do
		install -D -m644 "$file" "${pkgdir}/usr/src/linux-$_kernver/$file"
	done

	msg2 "Fixing permissions on scripts directory..."
	chmod og-w -R "${pkgdir}/usr/src/linux-$_kernver/scripts"

	msg2 "Creating symlinks..."
	mkdir -p "${pkgdir}/usr/lib/modules/$_kernver/"
	ln -s "/usr/src/linux-$_kernver" "${pkgdir}/usr/lib/modules/$_kernver/build"
	ln -s "/usr/src/linux-$_kernver" "${pkgdir}/usr/lib/modules/$_kernver/source"
	
	find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
