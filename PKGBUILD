# Derived from official Arch Linux grub package
# Maintainer : Pulsar33550336 <pulsar33550336@163.com>
# Maintainer : Angel Perez <drlorente97@gmail.com>
# Maintainer : Martin Villagra <possum@archlinux.org>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Maintainer : Christian Hesse <mail@eworm.de>
# Maintainer : Ronald van Haren <ronald.archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_IA32_EFI_IN_ARCH_X64="1"

## "1" to enable EMU build, "0" to disable
_GRUB_EMU_BUILD="0"

_GRUB_EXTRAS_COMMIT="8a245d5c1800627af4cefa99162a89c7a46d8842"

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="i386"

[[ "${CARCH}" == "x86_64" ]] && _EMU_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EMU_ARCH="i386"

pkgname="grub-silent"
pkgdesc="GNU GRand Unified Bootloader (2) [without welcome and kernel messages]"
pkgver=2.16
pkgrel=3
url="https://gnu-grub.freedesktop.org/"
arch=('x86_64' 'i686')
license=('GPL3')
backup=('etc/grub.d/40_custom')
backup=('etc/default/grub')
install="${pkgname%-*}.install"
options=('!makeflags')

conflicts=('grub' 'grub-common' 'grub-bios' 'grub-emu' "grub-efi-${_EFI_ARCH}" 'grub-legacy' 'grub-git')
provides=('grub' 'grub-common' 'grub-bios' 'grub-emu' "grub-efi-${_EFI_ARCH}")

makedepends=('autogen' 'bdf-unifont' 'git' 'help2man'
             'python' 'rsync' 'texinfo' 'ttf-dejavu'
			 'autoconf-archive')
depends=('device-mapper' 'gettext' 'efibootmgr' 'fuse3' 'xz')
optdepends=('freetype2: For grub-mkfont usage'
            'dosfstools: For grub-mkrescue FAT FS and EFI support'
            'libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue'
            'os-prober: To detect other OSes when generating grub.cfg in BIOS systems'
            'mtools: For grub-mkrescue FAT FS support')

if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
    makedepends+=('libusbx' 'sdl')
    optdepends+=('libusbx: For grub-emu USB support'
                 'sdl: For grub-emu SDL support')
fi

source=("https://gitlab.freedesktop.org/api/v4/projects/26558/packages/generic/source-assets/grub-${pkgver}/grub-${pkgver}.tar.xz"
        "git+https://git.savannah.gnu.org/git/grub-extras.git#commit=8a245d5c1800627af4cefa99162a89c7a46d8842"
        '01-intel-ucode.patch'
        '02-linux-detect-archlinux-initramfs.patch'
        '03-add-GRUB_COLOR_variables.patch'
        '04-gettext_quiet.patch'
        '05-sleep_shift.patch'
        '06-maybe_quiet.patch'
        '07-quick_boot.patch'
        'grub.silent')

sha256sums=('f0db0104927df0b9a48bc41b735c702936190d17eb2d73d3018fa77474a0cabe'
            '0a85e3691398b897a8f087c99757d67269a5ced0b51bd52b810d195aa125af10'
            '8740c18bc0e8873c6c855014ac7282915431185c21f26022375eae615044457e'
            '6a865fc9db3a6b36a3e8740e92083bee5b068327517ff78832fb1c06d870e2fc'
            'd550448165a60ee2ae3aa4d1167f897727da59a6613a98d6b3c1aa0e45b77d72'
            '5333e6f3c95e31d9f2d372f664c54f7015ddddacdf8e59fe6e647d53357eaaae'
            '7b42be438a8ddb45c1e39eeb7182cc94408e17a38df12ed422b58a33147dda31'
            'f22bf89dbf18e8f4f042df90374a2275b7acba5e55cf89501fa9aab32eb02fcf'
            '4653333f2f41ecffe2c7eef42527984b9a5c5d5d4f2e9eb4f9b5beba69348fb9'
            '4f2e9d585b7b0ef8ce0d09e88391d1397b50883c7cb1516dc99785934abe15a2')

prepare() {
	cd "${srcdir}/grub-${pkgver}/"

	msg "Patch to load Intel microcode"
	patch -Np1 -i "${srcdir}/01-intel-ucode.patch"
	echo

	msg "Patch to detect of Arch Linux initramfs images by grub-mkconfig"
	patch -Np1 -i "${srcdir}/02-linux-detect-archlinux-initramfs.patch"
	echo

	msg "Patch to enable GRUB_COLOR_* variables in grub-mkconfig"
	## Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
	patch -Np1 -i "${srcdir}/03-add-GRUB_COLOR_variables.patch"
	echo

	msg "Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme"
	sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "configure.ac"

	msg "Fix OS naming FS#33393"
	sed 's|GNU/Linux|Linux|' -i "util/grub.d/10_linux.in"

	msg "Applying Ubuntu patches for making GRUB silent"
	patch -Np1 -i "${srcdir}/04-gettext_quiet.patch"
	patch -Np1 -i "${srcdir}/05-sleep_shift.patch"
	patch -Np1 -i "${srcdir}/06-maybe_quiet.patch"
	patch -Np1 -i "${srcdir}/07-quick_boot.patch"
	echo

	# GRUB 2.16 ships the translations in the release tarball, and the
	# upstream linguas.sh (rsync from translationproject.org) is no longer
	# required to build.

	msg "Fix mkinitcpio 'rw' FS#36275"
	sed 's| ro | rw |g' -i "util/grub.d/10_linux.in"

	# The i386-pc "kernel.img is miscompiled: its start address is 0x9074
	# instead of 0x9000" issue is fixed upstream since GRUB 2.16, which
	# uses a linker script (conf/i386-pc-kernel.lds) and
	# --defsym=_grub_text_base for the i386-pc target instead of probing
	# the linker for --image-base support, so no local patch is needed.

    # Remove lua module from grub-extras as it is incompatible with changes to grub_file_open
    # http://git.savannah.gnu.org/cgit/grub.git/commit/?id=ca0a4f689a02c2c5a5e385f874aaaa38e151564e
    rm -rf "$srcdir"/grub-extras/lua
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
	cp -r "${srcdir}/grub-extras/915resolution" \
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

#	msg "Install config file for /etc/default/grub "
	install -D -m0644 "${srcdir}/grub.silent" "${pkgdir}/etc/default/grub"
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
