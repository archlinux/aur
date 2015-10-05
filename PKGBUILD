# Maintainer: Matt Parnell/ilikenwf <parwok@gmail.com>
# Original PKGBUILD Contributor: Patrick Bartels <p4ddy.b@gmail.com>
# Thanks to Bregol
pkgname="linux-zen-grsec"
pkgver=4.1.7+521027+g32876e2
pkgdesc="Featureful kernel including grsecurity, new features and optimizations to better suit desk/laptops"
url="https://github.com/damentz/linux-zen-grsec"
license=("GPL2")
makedepends=("git")
true && pkgbase="linux-zen-grsec"
true && pkgname=("linux-zen-grsec" "linux-zen-grsec-headers")
arch=("i686" "x86_64")
conflicts=("linux-zen linux-zen-git")
provides=("linux-zen linux-zen-git linux")
pkgrel=2
options=("!strip")
source=("linux-zen.conf"
        "linux-zen.preset"
        'git://github.com/ilikenwf/linux-zen-grsec.git#branch=4.1/master')
sha256sums=('33da66bdbf3e14b9795f743029bbdcb0d2d8dba2bab7cc18d1d88870d900b9df'
            '18fe6b2664a9a740544c4cb990efe5ec933d6e64caf9e5d0a6ced92af0027c2d'
            'SKIP')
_CORES=1

# compress the modules or not
_compress="y"

# don't compress the package - we're just going to uncompress during install in a moment
PKGEXT='.pkg.tar'

prepare() {
	cd "${srcdir}/linux-zen-grsec"
	
	# Number of CPU Cores
	_CORES=$(cat /proc/cpuinfo|grep processor|wc -l)
	if [ $_CORES -lt 1 ]; then
		_CORES=2
	fi
}

pkgver() {
	cd "${srcdir}/linux-zen-grsec"	
	eval $(grep -o "^\(VERSION\|PATCHLEVEL\|SUBLEVEL\) = [0-9a-zA-Z_-]\+" Makefile | tr -d \ )
	printf "%s.%s.%s+%s+g%s" $VERSION $PATCHLEVEL $SUBLEVEL "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/linux-zen-grsec"
		
	# don't run depmod on 'make install'. We'll do this ourselves in packaging
	sed -i '2iexit 0' scripts/depmod.sh

	if [ -e "${srcdir}/build/.config" ]; then
		msg2 "Using existing config found in build environment..."
	else
		if [ ! -d "${srcdir}/build" ]; then
			msg2 "Creating build directory..."
			mkdir -p "${srcdir}/build"
		fi

		msg2 "Creating default config..." # also initializes the output directory
		make -C "${srcdir}/linux-zen-grsec/" O="${srcdir}/build" defconfig > /dev/null

		warning "This package does not ship a kernel config."

		plain   ""
		warning "Thus it is up to you to create a one that fits your needs."
		warning "Navigate to '${srcdir}/build'"
		warning "and either run 'make menuconfig' or if you want to use an existing config,"
		warning "save it as '.config' and run 'make oldconfig' in order to update it."
		warning "Having done that you can run 'makepkg' again."
		plain   ""

		return 1
	fi

	msg2 "Updating output directory Makefile..."
	make -C "${srcdir}/linux-zen-grsec/" O="${srcdir}/build" outputmakefile

	warning "Press ENTER if you want to build the kernel or CTRL+C to abort..."
	read

	cd "${srcdir}/build"
	msg2 "Building kernel..."; make -j $_CORES bzImage
	msg2 "Building modules..."; make -j $_CORES modules
}

package_linux-zen-grsec() {
	depends=("coreutils" "linux-firmware" "kmod" "mkinitcpio>=0.5.20")
	provides=("linux-zen" "linux-zen-grsec")
	optdepends=("linux-zen-grsec-headers: to build third party modules such as NVIDIA drivers or OSSv4"
	            "crda: to set the correct wireless channels of your country")
	backup=(etc/mkinitcpio.d/linux-zen.conf)
	install=linux-zen.install

	msg2 "Determining kernel name..."
	cd "${srcdir}/linux-zen-grsec"
	cp "${srcdir}/build/.config" "./"
	_kernver="$(make kernelrelease -s)"
	msg2 "Kernel release name is: $_kernver"

	cd "${srcdir}/build"
	mkdir -p "$pkgdir/usr/lib"

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
	ln -s "../{pkgdir}/usr/lib/modules/extramodules-${_kernver}" "${pkgdir}/lib/modules/${_kernver}/extramodules"

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
		
	# add grsecurity gcc plugins
	msg "Adding grsecurity gcc plugins..."
	mkdir -p "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc"
	install -m644 "$srcdir/linux-zen-grsec/tools/gcc/gcc-common.h" "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc"
	install -m644 "$srcdir/linux-zen-grsec/tools/gcc/Makefile" "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc"
	install -m644 "$srcdir/build/tools/gcc/colorize_plugin.so" "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc"
	install -m644 "$srcdir/build/tools/gcc/kernexec_plugin.so" "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc"
	install -m644 "$srcdir/build/tools/gcc/constify_plugin.so" "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc"
	install -m644 "$srcdir/build/tools/gcc/stackleak_plugin.so" "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc"
	install -m644 "$srcdir/build/tools/gcc/initify_plugin.so" "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc"
	install -m644 "$srcdir/build/tools/gcc/structleak_plugin.so" "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc"
	
	mkdir -p "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc/size_overflow_plugin"
	install -m644 "$srcdir/linux-zen-grsec/tools/gcc/size_overflow_plugin/Makefile" "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc/size_overflow_plugin"
	install -m644 "$srcdir/build/tools/gcc/size_overflow_plugin/size_overflow_plugin.so" "$pkgdir/usr/lib/modules/${_kernver}/build/tools/gcc/size_overflow_plugin"

	# Now we call depmod...
	depmod -b "$pkgdir" -F System.map "$_kernver"
	
	# move module tree /lib -> /usr/lib
	cp -a "$pkgdir/lib" "$pkgdir/usr/"
	
	rm -rf "$pkgdir/lib"
	find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}

package_linux-zen-grsec-headers() {
	# AUR workaround
	true && pkgdesc="Header files and scripts for building modules for linux-zen"
	true && depends=("linux-zen-grsec")
	true && conflicts=("linux-zen-headers linux-zen-git-headers")
	true && provides=("linux-headers linux-zen-grsec-headers linux-zen-headers linux-zen-grsec-headers")

	_srcdir="/usr/src/linux-$_kernver"

	msg2 "Installing files necessary for 3rd party modules such as NVIDIA drivers or OSSv4..."
	mkdir -p "${pkgdir}/usr/src/linux-$_kernver/"{arch/x86,include}
	
	install -D -m644 "${srcdir}/linux-zen-grsec/Makefile" "${pkgdir}/usr/src/linux-$_kernver/Makefile"
	install -D -m644 "${srcdir}/linux-zen-grsec/kernel/Makefile" "${pkgdir}/usr/src/linux-$_kernver/kernel/Makefile"
	install -D -m644 "${srcdir}/build/.config" "${pkgdir}/usr/src/linux-$_kernver/.config"
	install -D -m644 "${srcdir}/build/Module.symvers" "${pkgdir}/usr/src/linux-$_kernver/Module.symvers"
	install -D -m644 "${srcdir}/build/include/generated/uapi/linux/version.h" "${pkgdir}/usr/src/linux-$_kernver/include/linux/version.h"
	install -D -m644 "${srcdir}/build/arch/x86/kernel/asm-offsets.s" "${pkgdir}/usr/src/linux-$_kernver/arch/x86/kernel/asm-offsets.s"
	install -D -m644 "${srcdir}/linux-zen-grsec/arch/x86/Makefile" "${pkgdir}/usr/src/linux-$_kernver/arch/x86/Makefile"

	if [ "$CARCH" = "i686" ]; then
		install -D -m644 "${srcdir}/linux-zen-grsec/arch/x86/Makefile_32.cpu" "${pkgdir}/usr/src/linux-$_kernver/arch/x86/Makefile_32.cpu"
	fi

	cp -a "${srcdir}/linux-zen-grsec/scripts" "${pkgdir}/usr/src/linux-$_kernver"
	cp -a "${srcdir}/build/scripts" "${pkgdir}/usr/src/linux-$_kernver"
	cp -a "${srcdir}/linux-zen-grsec/include" "${pkgdir}/usr/src/linux-$_kernver"
	cp -a "${srcdir}/build/include/"{generated,config} "${pkgdir}/usr/src/linux-$_kernver/include"
	cp -a "${srcdir}/linux-zen-grsec/arch/x86/include" "${pkgdir}/usr/src/linux-$_kernver/arch/x86"
	cp -a "${srcdir}/build/arch/x86/include" "${pkgdir}/usr/src/linux-$_kernver/arch/x86"

	cd "${srcdir}/linux-zen-grsec"
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
