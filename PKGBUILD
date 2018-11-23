# Maintainer : Christian Hesse <mail@eworm.de>
# Maintainer : Ronald van Haren <ronald.archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_IA32_EFI_IN_ARCH_X64="1"

## "1" to enable EMU build, "0" to disable
_GRUB_EMU_BUILD="0"

_GRUB_EXTRAS_COMMIT="f2a079441939eee7251bf141986cdd78946e1d20"

_UNIFONT_VER="11.0.02"

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="i386"

[[ "${CARCH}" == "x86_64" ]] && _EMU_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EMU_ARCH="i386"

pkgname='grub'
pkgdesc='GNU GRand Unified Bootloader (2)'
pkgver=2.02
pkgrel=8
epoch=2
url='https://www.gnu.org/software/grub/'
arch=('x86_64')
license=('GPL3')
backup=('etc/default/grub'
        'etc/grub.d/40_custom')
install="${pkgname}.install"
options=('!makeflags')

conflicts=('grub-common' 'grub-bios' 'grub-emu' "grub-efi-${_EFI_ARCH}" 'grub-legacy')
replaces=('grub-common' 'grub-bios' 'grub-emu' "grub-efi-${_EFI_ARCH}")
provides=('grub-common' 'grub-bios' 'grub-emu' "grub-efi-${_EFI_ARCH}")

makedepends=('git' 'rsync' 'xz' 'freetype2' 'ttf-dejavu' 'python' 'autogen'
             'texinfo' 'help2man' 'gettext' 'device-mapper' 'fuse2')
depends=('sh' 'xz' 'gettext' 'device-mapper')
optdepends=('freetype2: For grub-mkfont usage'
            'fuse2: For grub-mount usage'
            'dosfstools: For grub-mkrescue FAT FS and EFI support'
            'efibootmgr: For grub-install EFI support'
            'libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue'
            'os-prober: To detect other OSes when generating grub.cfg in BIOS systems'
            'mtools: For grub-mkrescue FAT FS support')

if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
    makedepends+=('libusbx' 'sdl')
    optdepends+=('libusbx: For grub-emu USB support'
                 'sdl: For grub-emu SDL support')
fi

validpgpkeys=('E53D497F3FA42AD8C9B4D1E835A93B74E82E4209'  # Vladimir 'phcoder' Serbinenko <phcoder@gmail.com>
              '95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig}
        "https://git.savannah.nongnu.org/cgit/grub-extras.git/snapshot/grub-extras-${_GRUB_EXTRAS_COMMIT}.tar.gz"
        "https://ftp.gnu.org/gnu/unifont/unifont-${_UNIFONT_VER}/unifont-${_UNIFONT_VER}.bdf.gz"{,.sig}
        '0003-10_linux-detect-archlinux-initramfs.patch'
        '0004-add-GRUB_COLOR_variables.patch'
        '0005-Allow_GRUB_to_mount_ext234_filesystems_that_have_the_encryption_feature.patch'
        '0006-tsc-Change-default-tsc-calibration-method-to-pmtimer-on-EFI-systems.patch'
        '0007-grub-mkconfig_10_linux_Support_multiple_early_initrd_images.patch'
        '0008-Fix-packed-not-aligned-error-on-GCC-8.patch'
        '0009-xfs-Accept-filesystem-with-sparse-inodes.patch'
        '0010-relocation.patch'
        'grub.default')

sha256sums=('810b3798d316394f94096ec2797909dbf23c858e48f7b3830826b8daa06b7b0f'
            'SKIP'
            '2844601914cea6b1231eca0104853a93c4d67a5209933a0766f1475953300646'
            'a7ea9ca4f6dcb59377d978194835ede669457069256184f86d46ab5b863c56e6'
            'SKIP'
            'b41e4438319136b5e74e0abdfcb64ae115393e4e15207490272c425f54026dd3'
            'a5198267ceb04dceb6d2ea7800281a42b3f91fd02da55d2cc9ea20d47273ca29'
            '535422c510a050d41efe7720dbe54de29e04bdb8f86fd5aea5feb0b24f7abe46'
            'c38f2b2caae33008b35a37d8293d8bf13bf6fd779a4504925da1837fd007aeb5'
            'e43566c4fe3b1b87e677167323d4716b82ac0810410a9d8dc7fbf415c8db2b8a'
            'e84b8de569c7e6b73263758c35cf95c6516fde85d4ed451991427864f6a4e5a8'
            'fcd5a626d4af33665d041ce42df813f1f198d8230ea186481b155a5b676f3b87'
            '51562fa1016c54567dbf42a86c0cfc902372ab579bbee17879a81aff09b76b99'
            '74e5dd2090a153c10a7b9599b73bb09e70fddc6a019dd41641b0f10b9d773d82')
		
_configure_options=(
	FREETYPE="pkg-config freetype2"
	BUILD_FREETYPE="pkg-config freetype2"
	--enable-mm-debug
	--enable-nls
	--enable-device-mapper
	--enable-cache-stats
	--enable-grub-mkfont
	--enable-grub-mount
	--prefix="/usr"
	--bindir="/usr/bin"
	--sbindir="/usr/bin"
	--mandir="/usr/share/man"
	--infodir="/usr/share/info"
	--datarootdir="/usr/share"
	--sysconfdir="/etc"
	--program-prefix=""
	--with-bootdir="/boot"
	--with-grubdir="grub"
	--disable-silent-rules
	--disable-werror
)

prepare() {
	cd "${srcdir}/grub-${pkgver}/"

	echo "Patch to detect of Arch Linux initramfs images by grub-mkconfig..."
	patch -Np1 -i "${srcdir}/0003-10_linux-detect-archlinux-initramfs.patch"

	echo "Patch to enable GRUB_COLOR_* variables in grub-mkconfig..."
	## Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
	patch -Np1 -i "${srcdir}/0004-add-GRUB_COLOR_variables.patch"

	echo "Patch to allow GRUB to mount ext2/3/4 filesystems that have the encryption feature..."
	patch -Np1 -i "${srcdir}/0005-Allow_GRUB_to_mount_ext234_filesystems_that_have_the_encryption_feature.patch"

	echo "Patch to change default tsc calibration method to pmtimer on EFI systems..."
	patch -Np1 -i "${srcdir}/0006-tsc-Change-default-tsc-calibration-method-to-pmtimer-on-EFI-systems.patch"

	echo "Patch to Support multiple early initrd images..."
	patch -Np1 -i "${srcdir}/0007-grub-mkconfig_10_linux_Support_multiple_early_initrd_images.patch"

	echo "Patch to fix packed-not-aligned error on GCC 8..."
	patch -Np1 -i "${srcdir}/0008-Fix-packed-not-aligned-error-on-GCC-8.patch"

	echo "Patch xfs: Accept filesystem with sparse inodes..."
	patch -Np1 -i "${srcdir}/0009-xfs-Accept-filesystem-with-sparse-inodes.patch"

	echo "Patch x86-64: Treat R_X86_64_PLT32 as R_X86_64_PC32..."
	patch -Np1 -i "${srcdir}/0010-relocation.patch"

	echo "Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme..."
	sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "configure.ac"

	echo "Fix mkinitcpio 'rw' FS#36275..."
	sed 's| ro | rw |g' -i "util/grub.d/10_linux.in"

	echo "Fix OS naming FS#33393..."
	sed 's|GNU/Linux|Linux|' -i "util/grub.d/10_linux.in"

	echo "Pull in latest language files..."
	./linguas.sh

	echo "Remove not working langs which need LC_ALL=C.UTF-8..."
	sed -e 's#en@cyrillic en@greek##g' -i "po/LINGUAS"

	echo "Avoid problem with unifont during compile of grub..."
	# http://savannah.gnu.org/bugs/?40330 and https://bugs.archlinux.org/task/37847
	cp "${srcdir}/unifont-${_UNIFONT_VER}.bdf" "unifont.bdf"
	
	echo "Run autogen.sh..."
	./autogen.sh
}

_build_grub-common_and_bios() {
	echo "Set ARCH dependent variables for bios build..."
	if [[ "${CARCH}" == 'x86_64' ]]; then
		_EFIEMU="--enable-efiemu"
	else
		_EFIEMU="--disable-efiemu"
	fi

	echo "Copy the source for building the bios part..."
	cp -r "${srcdir}/grub-${pkgver}" "${srcdir}/grub-${pkgver}-bios"
	cd "${srcdir}/grub-${pkgver}-bios/"

	echo "Add the grub-extra sources for bios build..."
	install -d "${srcdir}/grub-${pkgver}-bios/grub-extras"
	cp -r "${srcdir}/grub-extras-${_GRUB_EXTRAS_COMMIT}/915resolution" \
		"${srcdir}/grub-${pkgver}-bios/grub-extras/915resolution"
	export GRUB_CONTRIB="${srcdir}/grub-${pkgver}-bios/grub-extras/"

	echo "Unset all compiler FLAGS for bios build..."
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS

	echo "Run ./configure for bios build..."
	./configure \
		--with-platform="pc" \
		--target="i386" \
		"${_EFIEMU}" \
		--enable-boot-time \
		"${_configure_options[@]}"

	echo "Run make for bios build..."
	make
}

_build_grub-efi() {
	echo "Copy the source for building the ${_EFI_ARCH} efi part..."
	cp -r "${srcdir}/grub-${pkgver}" "${srcdir}/grub-${pkgver}-efi-${_EFI_ARCH}"
	cd "${srcdir}/grub-${pkgver}-efi-${_EFI_ARCH}/"

	echo "Unset all compiler FLAGS for ${_EFI_ARCH} efi build..."
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS

	echo "Run ./configure for ${_EFI_ARCH} efi build..."
	./configure \
		--with-platform="efi" \
		--target="${_EFI_ARCH}" \
		--disable-efiemu \
		--enable-boot-time \
		"${_configure_options[@]}"

	echo "Run make for ${_EFI_ARCH} efi build..."
	make
}

_build_grub-emu() {
	echo "Copy the source for building the emu part..."
	cp -r "${srcdir}/grub-${pkgver}/" "${srcdir}/grub-${pkgver}-emu/"
	cd "${srcdir}/grub-${pkgver}-emu/"

	echo "Unset all compiler FLAGS for emu build..."
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS

	echo "Run ./configure for emu build..."
	./configure \
		--with-platform="emu" \
		--target="${_EMU_ARCH}" \
		--enable-grub-emu-usb=no \
		--enable-grub-emu-sdl=no \
		--disable-grub-emu-pci \
		"${_configure_options[@]}"

	echo "Run make for emu build..."
	make
}

build() {
	cd "${srcdir}/grub-${pkgver}/"

	echo "Build grub bios stuff..."
	_build_grub-common_and_bios

	echo "Build grub ${_EFI_ARCH} efi stuff..."
	_build_grub-efi

	if [[ "${CARCH}" == "x86_64" ]] && [[ "${_IA32_EFI_IN_ARCH_X64}" == "1" ]]; then
		echo "Build grub i386 efi stuff..."
		_EFI_ARCH="i386" _build_grub-efi
	fi

	if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
		echo "Build grub emu stuff..."
		_build_grub-emu
	fi
}

_package_grub-common_and_bios() {
	cd "${srcdir}/grub-${pkgver}-bios/"

	echo "Run make install for bios build..."
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install

	echo "Remove gdb debugging related files for bios build..."
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/{kernel.exec,gdb_grub,gmodule.pl} || true

	echo "Install /etc/default/grub (used by grub-mkconfig)..."
	install -D -m0644 "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"
}

_package_grub-efi() {
	cd "${srcdir}/grub-${pkgver}-efi-${_EFI_ARCH}/"

	echo "Run make install for ${_EFI_ARCH} efi build..."
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install

	echo "Remove gdb debugging related files for ${_EFI_ARCH} efi build..."
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/{kernel.exec,gdb_grub,gmodule.pl} || true
}

_package_grub-emu() {
	cd "${srcdir}/grub-${pkgver}-emu/"

	echo "Run make install for emu build..."
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install

	echo "Remove gdb debugging related files for emu build..."
	rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/{kernel.exec,gdb_grub,gmodule.pl} || true
}

package() {
	cd "${srcdir}/grub-${pkgver}/"

	echo "Package grub ${_EFI_ARCH} efi stuff..."
	_package_grub-efi

	if [[ "${CARCH}" == "x86_64" ]] && [[ "${_IA32_EFI_IN_ARCH_X64}" == "1" ]]; then
		echo "Package grub i386 efi stuff..."
		_EFI_ARCH="i386" _package_grub-efi
	fi

	if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
		echo "Package grub emu stuff..."
		_package_grub-emu
	fi

	echo "Package grub bios stuff..."
	_package_grub-common_and_bios
}
