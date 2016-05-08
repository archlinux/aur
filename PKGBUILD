# Maintainer : Joe Maples <joe@frap129.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Zack Buhman
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_GRUB_IA32_EFI_ARCH_X64="1"

## "1" to enable EMU build, "0" to disable
_GRUB_EMU_BUILD="0"

_UNIFONT_VER="6.3.20131217"

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="i386"

[[ "${CARCH}" == "x86_64" ]] && _EMU_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EMU_ARCH="i386"

_pkgname="grub"
pkgname="${_pkgname}-f2fs"

pkgdesc="GNU GRand Unified Bootloader (2) - GIT Version with F2FS Support"
pkgver=2.02.beta3.16.gb524fa2
pkgrel=1
url="https://www.gnu.org/software/grub/"
arch=('x86_64' 'i686')
license=('GPL3')
backup=('boot/grub/grub.cfg' 'etc/default/grub' 'etc/grub.d/40_custom')
install="${_pkgname}.install"
options=('!makeflags')

conflicts=('grub' 'grub-common' 'grub-bios' "grub-efi-${_EFI_ARCH}" 'grub-emu' 'grub-bzr' 'grub-legacy' 'grub-git')
provides=("grub=${pkgver}" "grub-common=${pkgver}" "grub-bios=${pkgver}" "grub-efi-${_EFI_ARCH}=${pkgver}" "grub-emu=${pkgver}" "grub-bzr=${pkgver}")

makedepends=('git' 'rsync' 'xz' 'freetype2' 'ttf-dejavu' 'python' 'autogen'
             'texinfo' 'help2man' 'gettext' 'device-mapper' 'fuse')
depends=('sh' 'xz' 'gettext' 'device-mapper')
optdepends=('freetype2: For grub-mkfont usage'
            'fuse: For grub-mount usage'
            'dosfstools: For grub-mkrescue FAT FS and EFI support' 
            'efibootmgr: For grub-install EFI support'
            'libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue'
            'os-prober: To detect other OSes when generating grub.cfg in BIOS systems'
            'mtools: For grub-mkrescue FAT FS support'
            'f2fs-tools: For f2fs filesystem support')

if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
    makedepends+=('libusbx' 'sdl')
    optdepends+=('libusbx: For grub-emu USB support'
                 'sdl: For grub-emu SDL support')
fi

source=("grub::git+git://git.sv.gnu.org/grub.git#branch=master"
        "grub-extras::git+git://git.sv.gnu.org/grub-extras.git#branch=master"
        "http://ftp.gnu.org/gnu/unifont/unifont-${_UNIFONT_VER}/unifont-${_UNIFONT_VER}.bdf.gz"
        "http://ftp.gnu.org/gnu/unifont/unifont-${_UNIFONT_VER}/unifont-${_UNIFONT_VER}.bdf.gz.sig"
        'grub-10_linux-detect-archlinux-initramfs.patch'
        'grub-add-GRUB_COLOR_variables.patch'
        'grub-add-f2fs-support-v8.patch'
        '60_memtest86+'
        'grub.default'
        'grub.cfg')

sha1sums=('SKIP'
          'SKIP'
          '30797ba7a86fc32213b9ae994c9fa45f37d01170'
          'SKIP'
          '7ffd63c38d74f969f72e38fea3500345c5b968b2'
          'c03d2ea83aa6a44dc383fbf67c29c20469e57f1b'
          '13ef175e398f56af052330331a54b853e0f29031'
          '10e30eb68fb95c86301112ac95c5b7515413152a'
          '55cf103b60f405bd37d44dd24357dedfff0214ee'
          '5b7fcb0718a23035c039eb2fda9e088bb13ae611')

validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') ## Paul Hardy - for unifont

pkgver() {
	cd "${srcdir}/grub/"
	echo "$(git describe --tags)" | sed -e 's|grub.||g' -e 's|-|\.|g'
}

prepare() {
	
	cd "${srcdir}/grub/"
	
	msg "Patch to detect of Arch Linux initramfs images by grub-mkconfig"
	patch -Np1 -i "${srcdir}/grub-10_linux-detect-archlinux-initramfs.patch"
	echo
	
	msg "Patch to enable GRUB_COLOR_* variables in grub-mkconfig"
	## Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
	patch -Np1 -i "${srcdir}/grub-add-GRUB_COLOR_variables.patch"
	echo

	msg "Patch to enable f2fs filesystem support"
	## Based on https://lists.gnu.org/archive/html/grub-devel/2016-03/msg00080.html
	patch -Np1 -i "${srcdir}/grub-add-f2fs-support-v8.patch"
	echo
	
	msg "Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme"
	sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "${srcdir}/grub/configure.ac"
	
	msg "Fix mkinitcpio 'rw' FS#36275"
	sed 's| ro | rw |g' -i "${srcdir}/grub/util/grub.d/10_linux.in"
	
	msg "Fix OS naming FS#33393"
	sed 's|GNU/Linux|Linux|' -i "${srcdir}/grub/util/grub.d/10_linux.in"
	
	# msg "Requires python2"
	# sed 's|python |python2 |g' -i "${srcdir}/grub/autogen.sh"
	
	msg "Pull in latest language files"
	./linguas.sh
	echo
	
	msg "Remove not working langs which need LC_ALL=C.UTF-8"
	sed -e 's#en@cyrillic en@greek##g' -i "${srcdir}/grub/po/LINGUAS"
	
	msg "Avoid problem with unifont during compile of grub, http://savannah.gnu.org/bugs/?40330 and https://bugs.archlinux.org/task/37847"
	cp "${srcdir}/unifont-${_UNIFONT_VER}.bdf" "${srcdir}/grub/unifont.bdf"
	
}

_build_grub-common_and_bios() {
	
	msg "Set ARCH dependent variables for bios build"
	if [[ "${CARCH}" == 'x86_64' ]]; then
		_EFIEMU="--enable-efiemu"
	else
		_EFIEMU="--disable-efiemu"
	fi
	
	msg "Copy the source for building the bios part"
	cp -r "${srcdir}/grub" "${srcdir}/grub-bios"
	cd "${srcdir}/grub-bios/"
	
	msg "Add the grub-extra sources for bios build"
	install -d "${srcdir}/grub-bios/grub-extras"
	# cp -r "${srcdir}/grub-extras/915resolution" "${srcdir}/grub-bios/grub-extras/915resolution"
	export GRUB_CONTRIB="${srcdir}/grub-bios/grub-extras/"
	
	msg "Unset all compiler FLAGS for bios build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	cd "${srcdir}/grub-bios/"
	
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
	cp -r "${srcdir}/grub" "${srcdir}/grub-efi-${_EFI_ARCH}"
	cd "${srcdir}/grub-efi-${_EFI_ARCH}/"
	
	msg "Unset all compiler FLAGS for ${_EFI_ARCH} efi build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	cd "${srcdir}/grub-efi-${_EFI_ARCH}/"
	
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
	cp -r "${srcdir}/grub" "${srcdir}/grub-emu"
	cd "${srcdir}/grub-emu/"
	
	msg "Unset all compiler FLAGS for emu build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	cd "${srcdir}/grub-emu/"
	
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
	
	cd "${srcdir}/grub/"
	
	msg "Build grub bios stuff"
	_build_grub-common_and_bios
	echo
	
	msg "Build grub ${_EFI_ARCH} efi stuff"
	_build_grub-efi
	echo
	
	if [[ "${CARCH}" == "x86_64" ]] && [[ "${_GRUB_IA32_EFI_ARCH_X64}" == "1" ]]; then
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
	
	cd "${srcdir}/grub-bios/"
	
	msg "Run make install for bios build"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo
	
	msg "Remove gdb debugging related files for bios build"
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/{kernel.exec,gdb_grub,gmodule.pl} || true
	
	msg "Install extra /etc/grub.d/ files"
	install -D -m0755 "${srcdir}/60_memtest86+" "${pkgdir}/etc/grub.d/60_memtest86+"
	
	msg "Install /etc/default/grub (used by grub-mkconfig)"
	install -D -m0644 "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"
	
	msg "Install grub.cfg for backup array"
	install -D -m0644 "${srcdir}/grub.cfg" "${pkgdir}/boot/grub/grub.cfg"
	
}

_package_grub-efi() {
	
	cd "${srcdir}/grub-efi-${_EFI_ARCH}/"
	
	msg "Run make install for ${_EFI_ARCH} efi build"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo
	
	msg "Remove gdb debugging related files for ${_EFI_ARCH} efi build"
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/{kernel.exec,gdb_grub,gmodule.pl} || true
	
}

_package_grub-emu() {
	
	cd "${srcdir}/grub-emu/"
	
	msg "Run make install for emu build"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo
	
	msg "Remove gdb debugging related files for emu build"
	rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/{kernel.exec,gdb_grub,gmodule.pl} || true
	
}

package() {
	
	cd "${srcdir}/grub/"
	
	if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
		msg "Package grub emu stuff"
		_package_grub-emu
		echo
	fi
	
	msg "Package grub ${_EFI_ARCH} efi stuff"
	_package_grub-efi
	echo
	
	if [[ "${CARCH}" == "x86_64" ]] && [[ "${_GRUB_IA32_EFI_ARCH_X64}" == "1" ]]; then
		msg "Package grub i386 efi stuff"
		_EFI_ARCH="i386" _package_grub-efi
		echo
	fi
	
	msg "Package grub bios stuff"
	_package_grub-common_and_bios
	echo
	
}
