# Maintainer: Matt Parnell/ilikenwf <parwok@gmail.com>
# Original PKGBUILD Contributor: Patrick Bartels <p4ddy.b@gmail.com>
# Thanks to Bregol
pkgname="linux-zen-git"
pkgver=4.19.12+785325+g3762990b5595
_kernver=4.19.0+783746+g54d1f99f63e9
pkgdesc="Featureful kernel including various new features, code and optimizations to better suit desktops"
url="https://github.com/damentz/zen-kernel"
license=("GPL2")
makedepends=("git")
true && pkgbase="linux-zen-git"
true && pkgname=("linux-zen-git" "linux-zen-git-headers")
arch=("i686" "x86_64")
conflicts=("linux-zen")
provides=("linux-zen")
pkgrel=1
options=("!strip")
source=("linux-zen.conf"
        "linux-zen.preset"
        'git://github.com/damentz/zen-kernel.git#branch=4.19/master')
sha256sums=('6373073ad943e068478ef1373be4eb2a7e473da8743d946f1f50cd364685ab87'
            '18fe6b2664a9a740544c4cb990efe5ec933d6e64caf9e5d0a6ced92af0027c2d'
            'SKIP')
_CORES=1

# compress the modules or not
_compress="y"

# don't compress the package - we're just going to uncompress during install in a moment
PKGEXT='.pkg.tar'

prepare() {
	cd "${srcdir}/zen-kernel"
	
	# Number of CPU Cores
	_CORES=$(cat /proc/cpuinfo|grep processor|wc -l)
	if [ $_CORES -lt 1 ]; then
		_CORES=2
	fi
	
	git reset --hard
}

pkgver() {
	cd "${srcdir}/zen-kernel"	
	eval $(grep -o "^\(VERSION\|PATCHLEVEL\|SUBLEVEL\) = [0-9a-zA-Z_-]\+" Makefile | tr -d \ )
	printf "%s.%s.%s+%s+g%s" $VERSION $PATCHLEVEL $SUBLEVEL "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/zen-kernel"
		
	# don't run depmod on 'make install'. We'll do this ourselves in packaging
	sed -i '2iexit 0' scripts/depmod.sh

	if [ ! -d "${srcdir}/build" ]; then
		msg2 "Creating build directory..."
		mkdir -p "${srcdir}/build"
	else
		if [ -f "${srcdir}/build/.config" ]; then
			msg "Cleaning build directory, and backing up kernel config to srcdir/zen-config-bak..."
			
			cp "${srcdir}/build/.config" "${srcdir}/zen-config-bak"
			
			rm -rf "${srcdir}/build"
						
			cd "${srcdir}/zen-kernel"
			make clean &> /dev/null
			make mrproper &> /dev/null
			
			make -C "${srcdir}/zen-kernel/" O="${srcdir}/build" defconfig > /dev/null
						
			msg "Using backed up config from previous build directory."
			cp "${srcdir}/zen-config-bak" "${srcdir}/build/.config"
		fi
	fi

	if [ ! -f "${srcdir}/build/.config" ]; then
		if [ ! -f "${srcdir}/../zen-config" ]; then
			msg2 "Creating default config..."
			make -C "${srcdir}/zen-kernel/" O="${srcdir}/build" defconfig > /dev/null

			warning "This package does not ship a kernel config."

			plain   ""
			warning "Thus it is up to you to create a one that fits your needs."
			warning "Navigate to '${srcdir}/build'"
			warning "and either run 'make menuconfig' or if you want to use an existing config,"
			warning "save it as '.config' and run 'make oldconfig' in order to update it."
			warning "Having done that you can run 'makepkg' again."
			plain   ""

			return 1
		else
			msg "Using saved zen-config file in build root."
			cp "${srcdir}/../zen-config" "${srcdir}/build/.config"
		fi
	fi

	msg2 "Updating output directory Makefile..."
	make -C "${srcdir}/zen-kernel/" O="${srcdir}/build" outputmakefile

	warning "Press ENTER if you want to build the kernel or CTRL+C to abort..."
	read
	
	cd "${srcdir}/build"

	msg2 "Building kernel..."; make -j $_CORES bzImage
	msg2 "Building modules..."; make -j $_CORES modules
}

package_linux-zen-git() {
	depends=("coreutils" "linux-firmware" "kmod" "mkinitcpio>=0.5.20")
	provides=("linux-zen" "linux-zen-git")
	optdepends=("linux-zen-git-headers: to build third party modules such as NVIDIA drivers or OSSv4"
	            "crda: to set the correct wireless channels of your country")
	backup=(etc/mkinitcpio.d/linux-zen.conf)
	install=linux-zen.install

	msg2 "Determining kernel name..."
	cd "${srcdir}/build"
	_kernver="$(make kernelrelease -s)"
	msg2 "Kernel release name is: $_kernver"

	cd "${srcdir}/build"
	mkdir -p "$pkgdir/usr/lib"

	cd "${srcdir}/build"

	msg2 "Installing kernel image..."
	install -D -m644 "arch/x86/boot/bzImage" "$pkgdir/boot/vmlinuz-linux-zen"

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
		"$startdir/linux-zen.install"

	msg2 "Installing files for mkinitcpio..."
	install -D -m644 "${srcdir}/linux-zen.conf" \
		"$pkgdir/etc/mkinitcpio.d/linux-zen.conf"
	
	install -D -m644 "${srcdir}/linux-zen.preset" \
		"$pkgdir/etc/mkinitcpio.d/linux-zen.preset"
	sed -i "s/^ALL_kver=.*$/ALL_kver=$_kernver/" \
		"$pkgdir/etc/mkinitcpio.d/linux-zen.preset"

	# Now we call depmod...
	depmod -b "$pkgdir" -F System.map "$_kernver"
	
	# move module tree /lib -> /usr/lib
	cp -a "$pkgdir/lib" "$pkgdir/usr/"
	
	rm -rf "$pkgdir/lib"
	find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

package_linux-zen-git-headers() {
	# AUR workaround
	true && pkgdesc="Header files and scripts for building modules for linux-zen"
	true && depends=("linux-zen-git")
	true && conflicts=("linux-zen-headers")
	true && provides=("linux-headers linux-zen-git-headers linux-zen-headers")

	_srcdir="/usr/src/linux-$_kernver"

	msg2 "Installing files necessary for 3rd party modules such as NVIDIA drivers or OSSv4..."
	mkdir -p "${pkgdir}/usr/src/linux-$_kernver/"{arch/x86,include,tools/objtool}

	install -D -m755 "${srcdir}/build/tools/objtool/objtool" "${pkgdir}/usr/src/linux-$_kernver/tools/objtool/objtool"	
	install -D -m644 "${srcdir}/zen-kernel/Makefile" "${pkgdir}/usr/src/linux-$_kernver/Makefile"
	install -D -m644 "${srcdir}/zen-kernel/kernel/Makefile" "${pkgdir}/usr/src/linux-$_kernver/kernel/Makefile"
	install -D -m644 "${srcdir}/build/.config" "${pkgdir}/usr/src/linux-$_kernver/.config"
	install -D -m644 "${srcdir}/build/Module.symvers" "${pkgdir}/usr/src/linux-$_kernver/Module.symvers"
	install -D -m644 "${srcdir}/build/include/generated/uapi/linux/version.h" "${pkgdir}/usr/src/linux-$_kernver/include/linux/version.h"
	install -D -m644 "${srcdir}/build/arch/x86/kernel/asm-offsets.s" "${pkgdir}/usr/src/linux-$_kernver/arch/x86/kernel/asm-offsets.s"
	install -D -m644 "${srcdir}/zen-kernel/arch/x86/Makefile" "${pkgdir}/usr/src/linux-$_kernver/arch/x86/Makefile"

	if [ "$CARCH" = "i686" ]; then
		install -D -m644 "${srcdir}/zen-kernel/arch/x86/Makefile_32.cpu" "${pkgdir}/usr/src/linux-$_kernver/arch/x86/Makefile_32.cpu"
	fi

	cp -a "${srcdir}/zen-kernel/scripts" "${pkgdir}/usr/src/linux-$_kernver"
	cp -a "${srcdir}/build/scripts" "${pkgdir}/usr/src/linux-$_kernver"
	cp -a "${srcdir}/zen-kernel/include" "${pkgdir}/usr/src/linux-$_kernver"
	cp -a "${srcdir}/build/include/"{generated,config} "${pkgdir}/usr/src/linux-$_kernver/include"
	cp -a "${srcdir}/zen-kernel/arch/x86/include" "${pkgdir}/usr/src/linux-$_kernver/arch/x86"
	cp -a "${srcdir}/build/arch/x86/include" "${pkgdir}/usr/src/linux-$_kernver/arch/x86"

	cd "${srcdir}/zen-kernel"
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
