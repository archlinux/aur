# Maintainer : Martin Villagra <possum@archlinux.org>
# Contributor : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Derived from official Arch Lnux grub package
# Maintainer : Christian Hesse <mail@eworm.de>
# Maintainer : Ronald van Haren <ronald.archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_IA32_EFI_IN_ARCH_X64="1"

## "1" to enable EMU build, "0" to disable
_GRUB_EMU_BUILD="0"

_GRUB_EXTRAS_COMMIT="f2a079441939eee7251bf141986cdd78946e1d20"

_UNIFONT_VER="10.0.06"

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="i386"

[[ "${CARCH}" == "x86_64" ]] && _EMU_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EMU_ARCH="i386"

pkgname="grub-silent"
pkgdesc="GNU GRand Unified Bootloader (2) [without welcome and kernel messages]"
pkgver=2.02
pkgrel=1
url="https://www.gnu.org/software/grub/"
arch=('x86_64' 'i686')
license=('GPL3')
backup=('etc/grub.d/40_custom')
install="${pkgname%-*}.install"
options=('!makeflags')

conflicts=('grub' 'grub-common' 'grub-bios' 'grub-emu' "grub-efi-${_EFI_ARCH}" 'grub-legacy' 'grub-git')
replaces=('grub' 'grub-common' 'grub-bios' 'grub-emu' "grub-efi-${_EFI_ARCH}")
provides=('grub' 'grub-common' 'grub-bios' 'grub-emu' "grub-efi-${_EFI_ARCH}")

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

source=("https://ftp.gnu.org/gnu/${pkgname%-*}/${pkgname%-*}-${pkgver}.tar.xz"
        "https://git.savannah.nongnu.org/cgit/grub-extras.git/snapshot/grub-extras-${_GRUB_EXTRAS_COMMIT}.tar.gz"
        "https://ftp.gnu.org/gnu/unifont/unifont-${_UNIFONT_VER}/unifont-${_UNIFONT_VER}.bdf.gz"
        '01-intel-ucode.patch'
        '02-10_linux-detect-archlinux-initramfs.patch'
        '03-add-GRUB_COLOR_variables.patch'
        '04-ext4_feature_encrypt.patch'
        '05-gettext_quiet.patch'
        '06-sleep_shift.patch'
        '07-maybe_quiet.patch'
        '08-quick_boot.patch'
        '09-Fix-packed-not-aligned-error-on-GCC-8.patch'
        '10-relocation.patch'
        'grub.silent')

sha256sums=('810b3798d316394f94096ec2797909dbf23c858e48f7b3830826b8daa06b7b0f'
            '2844601914cea6b1231eca0104853a93c4d67a5209933a0766f1475953300646'
            '0d81571fc519573057b7641d26a31ead55cc0b02a931589fb346a3a534c3dcc1'
            '37adb95049f6cdcbdbf60ed6b6440c5be99a4cd307a0f96c3c3837b6c2e07f3c'
            'b41e4438319136b5e74e0abdfcb64ae115393e4e15207490272c425f54026dd3'
            'a5198267ceb04dceb6d2ea7800281a42b3f91fd02da55d2cc9ea20d47273ca29'
            '82b9e3fc8547c496cd28f39e75d8224d83c40481df3bfa33ae8169f7c7861362'
            '39d7843dfe1e10ead912a81be370813b8621794a7967b3cc5e4d4188b5bf7264'
            '4b189e00a8c97ec09903e9588e02fc78b4bb114ee4822fcce13811aca00c8884'
            'b7489c7facc4fb3dad4426c9c00079b64908640a2bec2409e22194daa3f72af4'
            '057f076ddca241d92a094bc05828e3eb18d3439bf4d2f3d8ca8fa1c51b5b1b2b'
            'e84b8de569c7e6b73263758c35cf95c6516fde85d4ed451991427864f6a4e5a8'
            '51562fa1016c54567dbf42a86c0cfc902372ab579bbee17879a81aff09b76b99'
            '764844ca8ee0869761cc1a7ed76b5c729ea560664ba26afc339ba4c5d5c7b2e3')

prepare() {
	cd "${srcdir}/grub-${pkgver}/"

	msg "Patch to load Intel microcode"
	patch -Np1 -i "${srcdir}/01-intel-ucode.patch"
	echo

	msg "Patch to detect of Arch Linux initramfs images by grub-mkconfig"
	patch -Np1 -i "${srcdir}/02-10_linux-detect-archlinux-initramfs.patch"
	echo

	msg "Patch to enable GRUB_COLOR_* variables in grub-mkconfig"
	## Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
	patch -Np1 -i "${srcdir}/03-add-GRUB_COLOR_variables.patch"
	echo

	msg "Patch to allow GRUB to mount ext2/3/4 filesystems that have the encryption feature"
	patch -Np1 -i "${srcdir}/04-ext4_feature_encrypt.patch"
	echo

	msg "Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme"
	sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "configure.ac"

	msg "Fix mkinitcpio 'rw' FS#36275"
	sed 's| ro | rw |g' -i "util/grub.d/10_linux.in"

	msg "Fix OS naming FS#33393"
	sed 's|GNU/Linux|Linux|' -i "util/grub.d/10_linux.in"

	msg "Appling Ubuntu patches for making GRUB silent"
	patch -Np1 -i "${srcdir}/05-gettext_quiet.patch"
	patch -Np1 -i "${srcdir}/06-sleep_shift.patch"
	patch -Np1 -i "${srcdir}/07-maybe_quiet.patch"
	patch -Np1 -i "${srcdir}/08-quick_boot.patch"
	echo

	msg "Appling fix for packed not aligned error on GCC-8"
	patch -Np1 -i "${srcdir}/09-Fix-packed-not-aligned-error-on-GCC-8.patch"
	echo

	msg "Applying fix for relocation error 0x4"
	patch -Np1 -i "${srcdir}/10-relocation.patch"
	echo

	msg "Pull in latest language files"
	./linguas.sh
	echo

	msg "Remove not working langs which need LC_ALL=C.UTF-8"
	sed -e 's#en@cyrillic en@greek##g' -i "po/LINGUAS"

	msg "Avoid problem with unifont during compile of grub"
	# http://savannah.gnu.org/bugs/?40330 and https://bugs.archlinux.org/task/37847
	cp "${srcdir}/unifont-${_UNIFONT_VER}.bdf.gz" "unifont.bdf.gz"
}

_build_grub-common_and_bios() {
	msg "Set ARCH dependent variables for bios build"
	if [[ "${CARCH}" == 'x86_64' ]]; then
		_EFIEMU="--enable-efiemu"
	else
		_EFIEMU="--disable-efiemu"
	fi

	msg "Copy the source for building the bios part"
	cp -r "${srcdir}/grub-${pkgver}" "${srcdir}/grub-${pkgver}-bios"
	cd "${srcdir}/grub-${pkgver}-bios/"

	msg "Add the grub-extra sources for bios build"
	install -d "${srcdir}/grub-${pkgver}-bios/grub-extras"
	cp -r "${srcdir}/grub-extras-${_GRUB_EXTRAS_COMMIT}/915resolution" \
		"${srcdir}/grub-${pkgver}-bios/grub-extras/915resolution"
	export GRUB_CONTRIB="${srcdir}/grub-${pkgver}-bios/grub-extras/"

	msg "Unset all compiler FLAGS for bios build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS

	msg "Run autogen.sh for bios build"
	./autogen.sh
	echo

	msg "Run ./configure for bios build"
	./configure \
		--with-platform="pc" \
		--target="i386" \
		"${_EFIEMU}" \
		--enable-mm-debug \
		--enable-nls \
		--enable-device-mapper \
		--enable-cache-stats \
		--enable-boot-time \
		--enable-grub-mount \
		--prefix="/usr" \
		--bindir="/usr/bin" \
		--sbindir="/usr/bin" \
		--mandir="/usr/share/man" \
		--infodir="/usr/share/info" \
		--datarootdir="/usr/share" \
		--sysconfdir="/etc" \
	 	--program-prefix="" \
		--with-bootdir="/boot" \
		--with-grubdir="grub" \
		--enable-quiet-boot \
		--enable-quick-boot \
		--disable-silent-rules \
		--disable-werror
	echo

	msg "Run make for bios build"
	make
	echo
}

_build_grub-efi() {
	msg "Copy the source for building the ${_EFI_ARCH} efi part"
	cp -r "${srcdir}/grub-${pkgver}" "${srcdir}/grub-${pkgver}-efi-${_EFI_ARCH}"
	cd "${srcdir}/grub-${pkgver}-efi-${_EFI_ARCH}/"

	msg "Unset all compiler FLAGS for ${_EFI_ARCH} efi build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS

	msg "Run autogen.sh for ${_EFI_ARCH} efi build"
	./autogen.sh
	echo

	msg "Run ./configure for ${_EFI_ARCH} efi build"
	./configure \
		--with-platform="efi" \
		--target="${_EFI_ARCH}" \
		--disable-efiemu \
		--enable-mm-debug \
		--enable-nls \
		--enable-device-mapper \
		--enable-cache-stats \
		--enable-boot-time \
		--enable-grub-mount \
		--prefix="/usr" \
		--bindir="/usr/bin" \
		--sbindir="/usr/bin" \
		--mandir="/usr/share/man" \
		--infodir="/usr/share/info" \
		--datarootdir="/usr/share" \
		--sysconfdir="/etc" \
		--program-prefix="" \
		--with-bootdir="/boot" \
		--with-grubdir="grub" \
		--enable-quiet-boot \
		--enable-quick-boot \
		--disable-silent-rules \
		--disable-werror
	echo

	msg "Run make for ${_EFI_ARCH} efi build"
	make
	echo
}

_build_grub-emu() {
	msg "Copy the source for building the emu part"
	cp -r "${srcdir}/grub-${pkgver}/" "${srcdir}/grub-${pkgver}-emu/"
	cd "${srcdir}/grub-${pkgver}-emu/"

	msg "Unset all compiler FLAGS for emu build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS

	msg "Run autogen.sh for emu build"
	./autogen.sh
	echo

	msg "Run ./configure for emu build"
	./configure \
		--with-platform="emu" \
		--target="${_EMU_ARCH}" \
		--enable-mm-debug \
		--enable-nls \
		--enable-device-mapper \
		--enable-cache-stats \
		--enable-grub-mount \
		--enable-grub-emu-usb=no \
		--enable-grub-emu-sdl=no \
		--disable-grub-emu-pci \
		--prefix="/usr" \
		--bindir="/usr/bin" \
		--sbindir="/usr/bin" \
		--mandir="/usr/share/man" \
		--infodir="/usr/share/info" \
		--datarootdir="/usr/share" \
		--sysconfdir="/etc" \
		--program-prefix="" \
		--with-bootdir="/boot" \
		--with-grubdir="grub" \
		--enable-quiet-boot \
		--enable-quick-boot \
		--disable-silent-rules \
		--disable-werror
	echo

	msg "Run make for emu build"
	make
	echo
}

build() {
	cd "${srcdir}/grub-${pkgver}/"

	msg "Build grub bios stuff"
	_build_grub-common_and_bios
	echo

	msg "Build grub ${_EFI_ARCH} efi stuff"
	_build_grub-efi
	echo

	if [[ "${CARCH}" == "x86_64" ]] && [[ "${_IA32_EFI_IN_ARCH_X64}" == "1" ]]; then
		msg "Build grub i386 efi stuff"
		_EFI_ARCH="i386" _build_grub-efi
		echo
	fi

	if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
		msg "Build grub emu stuff"
		_build_grub-emu
		echo
	fi
}

_package_grub-common_and_bios() {
	cd "${srcdir}/grub-${pkgver}-bios/"

	msg "Run make install for bios build"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo

	msg "Remove gdb debugging related files for bios build"
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/{kernel.exec,gdb_grub,gmodule.pl} || true

#	msg "Install a sample file for /etc/default/grub "
	install -D -m0644 "${srcdir}/grub.silent" "${pkgdir}/etc/default/grub.silent"
}

_package_grub-efi() {
	cd "${srcdir}/grub-${pkgver}-efi-${_EFI_ARCH}/"

	msg "Run make install for ${_EFI_ARCH} efi build"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo

	msg "Remove gdb debugging related files for ${_EFI_ARCH} efi build"
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/{kernel.exec,gdb_grub,gmodule.pl} || true
}

_package_grub-emu() {
	cd "${srcdir}/grub-${pkgver}-emu/"

	msg "Run make install for emu build"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo

	msg "Remove gdb debugging related files for emu build"
	rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/{kernel.exec,gdb_grub,gmodule.pl} || true
}

package() {
	cd "${srcdir}/grub-${pkgver}/"

	msg "Package grub ${_EFI_ARCH} efi stuff"
	_package_grub-efi

	if [[ "${CARCH}" == "x86_64" ]] && [[ "${_IA32_EFI_IN_ARCH_X64}" == "1" ]]; then
		msg "Package grub i386 efi stuff"
		_EFI_ARCH="i386" _package_grub-efi
		echo
	fi

	if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
		msg "Package grub emu stuff"
		_package_grub-emu
		echo
	fi

	msg "Package grub bios stuff"
	_package_grub-common_and_bios
}
