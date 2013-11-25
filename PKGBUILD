# Maintainer : Tobias Powalowski <tpowa@archlinux.org>
# Maintainer : Ronald van Haren <ronald.archlinux.org>
# Contributor: Keshav Padram Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgver="2.00"
_GRUB_GIT_COMMIT="5ae5c54c7e5cb048cdd78a53181cee0da698a953"

## grub-extras gpxe is not needed

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="i386"

pkgname="grub"
pkgdesc="GNU GRand Unified Bootloader (2)"
pkgver=2.00.1282.g5ae5c54
pkgrel=1
epoch="1"
url="https://www.gnu.org/software/grub/"
arch=('x86_64' 'i686')
license=('GPL3')
backup=('boot/grub/grub.cfg' 'etc/default/grub' 'etc/grub.d/40_custom')
install="${pkgname}.install"
options=('!makeflags')

conflicts=('grub-common' 'grub-bios' "grub-efi-${_EFI_ARCH}" 'grub-legacy')
replaces=('grub-common' 'grub-bios' "grub-efi-${_EFI_ARCH}")
provides=('grub-common' 'grub-bios' "grub-efi-${_EFI_ARCH}")

makedepends=('git' 'bzr' 'rsync' 'xz' 'freetype2' 'ttf-dejavu'
             'python2' 'autogen' 'texinfo' 'help2man'
             'gettext' 'device-mapper' 'fuse')
depends=('sh' 'xz' 'gettext' 'device-mapper')
optdepends=('freetype2: For grub-mkfont usage'
            'fuse: For grub-mount usage'
            'dosfstools: For grub-mkrescue FAT FS and EFI support' 
            'efibootmgr: For grub-install EFI support'
            'libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue'
            'os-prober: To detect other OSes when generating grub.cfg in BIOS systems'
            'mtools: For grub-mkrescue FAT FS support')

# source=("http://ftp.gnu.org/gnu/grub/grub-${pkgver}.tar.xz"
source=("grub-${_pkgver}::git+git://git.sv.gnu.org/grub.git#commit=${_GRUB_GIT_COMMIT}"
        'http://unifoundry.com/unifont-5.1.20080820.bdf.gz'
        'archlinux_grub_mkconfig_fixes.patch'
        '60_memtest86+'
        'grub.default'
        'grub.cfg')

md5sums=('SKIP'
         '6b8263ceccef33bd633aa019d74b7943'
         'b9cbff4a67e463722a113c66d57c4042'
         'be55eabc102f2c60b38ed35c203686d6'
         'a03ffd56324520393bf574cefccb893d'
         'c8b9511586d57d6f2524ae7898397a46'
         'SKIP'
         'SKIP'
         'SKIP')

for _DIR_ in 915resolution lua ntldr-img ; do
	source+=("grub-extras-${_DIR_}::bzr+bzr://bzr.savannah.gnu.org/grub-extras/${_DIR_}/#revision=")
done

pkgver() {
	cd "${srcdir}/grub-${_pkgver}/"
	echo "$(git describe --tags)" | sed -e 's|-|\.|g'
}

prepare() {
	
	cd "${srcdir}/grub-${_pkgver}/"
	
	msg "Patch to enable grub-mkconfig detect Arch kernels and initramfs"
	patch -Np1 -i "${srcdir}/archlinux_grub_mkconfig_fixes.patch"
	
	msg "Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme"
	sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "${srcdir}/grub-${_pkgver}/configure.ac"
	
	msg "Fix mkinitcpio 'rw' FS#36275"
	sed 's| ro | rw |g' -i "${srcdir}/grub-${_pkgver}/util/grub.d/10_linux.in"
	
	msg "Fix OS naming FS#33393"
	sed 's|GNU/Linux|Linux|' -i "${srcdir}/grub-${_pkgver}/util/grub.d/10_linux.in"
	
	msg "autogen.sh requires python (2/3). since bzr is in makedepends, use python2 and no need to pull python3"
	sed 's|python |python2 |g' -i "${srcdir}/grub-${_pkgver}/autogen.sh"
	
	msg "Pull in latest language files"
	./linguas.sh
	echo
	
	msg "Remove non working langs which need LC_ALL=C.UTF-8"
	sed -e 's#en@cyrillic en@greek##g' -i "${srcdir}/grub-${_pkgver}/po/LINGUAS"
	
	msg "Avoid problem with unifont during compile of grub, http://savannah.gnu.org/bugs/?40330 and https://bugs.archlinux.org/task/37847"
	cp "${srcdir}/unifont-5.1.20080820.bdf" "${srcdir}/grub-${_pkgver}/unifont.bdf"
	
}

_build_grub-common_and_bios() {
	
	msg "Set ARCH dependent variables for bios build"
	if [[ "${CARCH}" == 'x86_64' ]]; then
		_EFIEMU="--enable-efiemu"
	else
		_EFIEMU="--disable-efiemu"
	fi
	
	msg "Copy the source for building the bios package"
	cp -r "${srcdir}/grub-${_pkgver}" "${srcdir}/grub-${_pkgver}-bios"
	cd "${srcdir}/grub-${_pkgver}-bios/"
	
	msg "Add the grub-extra sources for bios build"
	install -d "${srcdir}/grub-${_pkgver}-bios/grub-extras"
	for _DIR_ in 915resolution ntldr-img ; do
		cp -r "${srcdir}/grub-extras-${_DIR_}" "${srcdir}/grub-${_pkgver}-bios/grub-extras/${_DIR_}"
	done
	export GRUB_CONTRIB="${srcdir}/grub-bios/grub-extras/"
	
	msg "Unset all compiler FLAGS for bios build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	cd "${srcdir}/grub-${_pkgver}-bios/"
	
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
	
	msg "Copy the source for building the efi package"
	cp -r "${srcdir}/grub-${_pkgver}" "${srcdir}/grub-${_pkgver}-efi"
	cd "${srcdir}/grub-${_pkgver}-efi/"
	
	msg "Add the grub-extra sources for efi build"
	install -d "${srcdir}/grub-${_pkgver}-efi/grub-extras/"
	for _DIR_ in lua ; do
		cp -r "${srcdir}/grub-extras-${_DIR_}" "${srcdir}/grub-${_pkgver}-efi/grub-extras/${_DIR_}"
	done
	# export GRUB_CONTRIB="${srcdir}/grub-efi/grub-extras/"
	
	msg "Unset all compiler FLAGS for efi build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	cd "${srcdir}/grub-${_pkgver}-efi/"
	
	msg "Run autogen.sh for efi build"
	./autogen.sh
	echo
	
	msg "Run ./configure for efi build"
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
	
	msg "Run make for efi build"
	make
	echo
	
}

build() {
	
	cd "${srcdir}/grub-${_pkgver}/"
	
	msg "Build grub bios stuff"
	_build_grub-common_and_bios
	echo
	
	msg "Build grub efi stuff"
	_build_grub-efi
	echo
	
}

_package_grub-common_and_bios() {
	
	cd "${srcdir}/grub-${_pkgver}-bios/"
	
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
	
	cd "${srcdir}/grub-${_pkgver}-efi/"
	
	msg "Run make install for efi build"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo
	
	msg "Remove gdb debugging related files for efi build"
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/{kernel.exec,gdb_grub,gmodule.pl} || true
	
}

package() {
	
	msg "Package grub efi stuff"
	_package_grub-efi
	
	msg "Package grub bios stuff"
	_package_grub-common_and_bios
	
}
