# Maintainer : Maxim Fomin <maxim@fomin.one>
# Maintainer : Christian Hesse <mail@eworm.de>
# Maintainer : Ronald van Haren <ronald.archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Joan Bruguera <joanbrugueram@gmail.com>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_IA32_EFI_IN_ARCH_X64="1"

## "1" to enable EMU build, "0" to disable
_GRUB_EMU_BUILD="0"

_GRUB_EXTRAS_COMMIT="f2a079441939eee7251bf141986cdd78946e1d20"

_UNIFONT_VER="13.0.06"

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="i386"

[[ "${CARCH}" == "x86_64" ]] && _EMU_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EMU_ARCH="i386"

_pkgname="grub"
pkgname="grub-luks-keyfile"
pkgdesc="GNU GRand Unified Bootloader (2) with crypto extensions to support for DMCrypt and LUKS volumes with detached headers and key files."
pkgver=2.06
pkgrel=1
epoch=2
url="https://www.gnu.org/software/grub/"
arch=('x86_64')
license=('GPL3')
options=('!makeflags')
backup=('etc/default/grub')

conflicts=('grub' 'grub-common' 'grub-bios' 'grub-emu' "grub-efi-${_EFI_ARCH}" 'grub-legacy')
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

validpgpkeys=('E53D497F3FA42AD8C9B4D1E835A93B74E82E4209'  # Vladimir 'phcoder' Serbinenko <phcoder@gmail.com>
              'BE5C23209ACDDACEB20DB0A28C8189F1988C2166'  # Daniel Kiper <dkiper@net-space.pl>
              '95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

source=("https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        "https://git.savannah.nongnu.org/cgit/grub-extras.git/snapshot/grub-extras-${_GRUB_EXTRAS_COMMIT}.tar.gz"
        "https://ftp.gnu.org/gnu/unifont/unifont-${_UNIFONT_VER}/unifont-${_UNIFONT_VER}.bdf.gz"{,.sig}
        '0001-00_header-add-GRUB_COLOR_-variables.patch'
        '0002-10_linux-detect-archlinux-initramfs.patch'
        '0001-Cryptomount-support-LUKS-detached-header.patch'
        '0002-Cryptomount-support-key-files.patch'
        '0003-Cryptomount-luks-allow-multiple-passphrase-attempts.patch'
        '0004-Cryptomount-support-plain-dm-crypt.patch'
        '0005-Cryptomount-support-for-hyphens-in-UUID.patch'
        '0006-Cryptomount-support-for-using-whole-device-as-keyfile.patch'
        'grub.default')

sha256sums=('b79ea44af91b93d17cd3fe80bdae6ed43770678a9a5ae192ccea803ebb657ee1'
            'SKIP'
            '2844601914cea6b1231eca0104853a93c4d67a5209933a0766f1475953300646'
            'b7668a5d498972dc4981250c49f83601babce797be19b4fdd0f2f1c6cfbd0fc5'
            'SKIP'
            'ef87b27e4cef6f83c41c8a1a0401f41e22a89a130baaef8c5a832a6c99bb2683'
            'ce7e24acec78989169a136e989e07369def3dd7c727788d5038a255409ec3c35'
            'b9d737d1b403b540a00a8e9c25240a06bb371da7588d3e665af8543397724698'
            '5d7060fbe9738764d2f8ebc96b43cc0bb8939c2e4e4e78b7a82a1a149ea6e837'
            '3e373bcb7847326ae14365e7443f900559f35f4f9ba2e5e69d034f4423fc45bb'
            '9ff4aba657d3826a510c57ce44d7582c4e4c72eb32a59ffd2b09e923202750ed'
            '6f58b01eb9adcc6864e09a4ecaa728f19ee2c9a7ecf4cf20fd17fc5ec327f19c'
            '4739a472c609df2528ac30e502a9f1b77fd1517af551c6bcbd35ba57b81da827'
            'ba476142f65b4b7c94bedeba55bf2aa0303a9247c4708e99abaeca22941bf20d')

prepare() {
	cd "${srcdir}/grub-${pkgver}/"

	echo "Patch to detect of Arch Linux initramfs images by grub-mkconfig..."
	patch -Np1 -i "${srcdir}/0002-10_linux-detect-archlinux-initramfs.patch"

	echo "Patch to enable GRUB_COLOR_* variables in grub-mkconfig..."
	## Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
	patch -Np1 -i "${srcdir}/0001-00_header-add-GRUB_COLOR_-variables.patch"
	
	echo "Patch to enable LUKS detached header support..."
	patch -Np1 -i "${srcdir}/0001-Cryptomount-support-LUKS-detached-header.patch"
	
	echo "Patch to enable LUKS key files support ..."
	patch -Np1 -i "${srcdir}/0002-Cryptomount-support-key-files.patch"
	
	echo "Patch to enable multiple passphrase attempts support..."
	patch -Np1 -i "${srcdir}/0003-Cryptomount-luks-allow-multiple-passphrase-attempts.patch"
	
	echo "Patch to enable plain dm-crypt mode support..."
	patch -Np1 -i "${srcdir}/0004-Cryptomount-support-plain-dm-crypt.patch"
	
	echo "Patch to enable hyphens in UUID support..."
	patch -Np1 -i "${srcdir}/0005-Cryptomount-support-for-hyphens-in-UUID.patch"
	
	echo "Patch to enable whole device as keyfile support ..."
	patch -Np1 -i "${srcdir}/0006-Cryptomount-support-for-using-whole-device-as-keyfile.patch"

	msg "Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme"
	sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "configure.ac"

	msg "Fix mkinitcpio 'rw' FS#36275"
	sed 's| ro | rw |g' -i "util/grub.d/10_linux.in"

	msg "Fix OS naming FS#33393"
	sed 's|GNU/Linux|Linux|' -i "util/grub.d/10_linux.in"

	msg "Pull in latest language files"
	./linguas.sh
	echo

	msg "Remove not working langs which need LC_ALL=C.UTF-8"
	sed -e 's#en@cyrillic en@greek##g' -i "po/LINGUAS"

	msg "Avoid problem with unifont during compile of grub"
	# http://savannah.gnu.org/bugs/?40330 and https://bugs.archlinux.org/task/37847
	# Fix: for some reason this is not unpacked automatically anymore
	gunzip -f "${srcdir}/unifont-${_UNIFONT_VER}.bdf.gz"
	cp "${srcdir}/unifont-${_UNIFONT_VER}.bdf" "unifont.bdf"
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
		FREETYPE="pkg-config freetype2" \
		--with-platform="pc" \
		--target="i386" \
		"${_EFIEMU}" \
		--enable-mm-debug \
		--enable-nls \
		--enable-device-mapper \
		--enable-cache-stats \
		--enable-boot-time \
		--enable-grub-mkfont \
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
		FREETYPE="pkg-config freetype2" \
		--with-platform="efi" \
		--target="${_EFI_ARCH}" \
		--disable-efiemu \
		--enable-mm-debug \
		--enable-nls \
		--enable-device-mapper \
		--enable-cache-stats \
		--enable-boot-time \
		--enable-grub-mkfont \
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
		FREETYPE="pkg-config freetype2" \
		--with-platform="emu" \
		--target="${_EMU_ARCH}" \
		--enable-mm-debug \
		--enable-nls \
		--enable-device-mapper \
		--enable-cache-stats \
		--enable-grub-mkfont \
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

	msg "Install /etc/default/grub (used by grub-mkconfig)"
	install -D -m0644 "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"
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
