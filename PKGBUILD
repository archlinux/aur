# Maintainer : Keshav Padram Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

_gitroot="http://git.zytor.com/syslinux/syslinux.git"
# _gitroot="https://git.kernel.org/pub/scm/boot/syslinux/syslinux.git"
_gitname="syslinux"
_gitbranch="firmware"

_pkgname="syslinux"
pkgname="${_pkgname}-firmware-git"

pkgver=6.02.2.g4c3c856
pkgrel=4
arch=('x86_64' 'i686')
pkgdesc="Collection of boot loaders that boot from FAT, ext2/3/4 and btrfs filesystems, from CDs and via PXE - GIT firmware branch"
url="http://syslinux.zytor.com/"
license=('GPL2')
options=('!makeflags' '!emptydirs')
backup=('boot/syslinux/syslinux.cfg')

conflicts=('syslinux' 'syslinux-bios' 'syslinux-efi' 'syslinux-git')
provides=("syslinux=${pkgver}" "syslinux-bios=${pkgver}" "syslinux-efi=${pkgver}" "syslinux-git=${pkgver}")

makedepends=('git' 'python2' 'nasm' 'ncurses' 'gnu-efi-libs')
depends=('perl' 'glibc')
optdepends=('perl-passwd-md5:  For md5pass'
            'perl-digest-sha1: For sha1pass'
            'mtools:           For mkdiskimage and syslinux support'
            'gptfdisk:         For GPT support'
            'util-linux:       For isohybrid'
            'efibootmgr:       For EFI support'
            'dosfstools:       For EFI support')

install="${_pkgname}.install"

source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}"
        'syslinux.cfg'
        'syslinux-install_update')

sha1sums=('SKIP'
          'b0f174bcc0386fdf699e03d0090e3ac841098010'
          '6032b30aadbd738764213e1710652d0735d93f16')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	echo "$(git describe --tags)" | sed -e 's|syslinux-||g' -e 's|-pre|pre|g' -e 's|-|.|g'
}

prepare() {
	
	cd "${srcdir}/${_pkgname}/"
	
	msg "Do not try to build the Windows or DOS installers and DIAG files"
	sed 's|diag libinstaller dos win32 win64 dosutil txt|libinstaller txt|g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|win32/syslinux.exe win64/syslinux64.exe||g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|dosutil/*.com dosutil/*.sys||g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|dos/syslinux.com||g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|INSTALLSUBDIRS = com32 utils dosutil|INSTALLSUBDIRS = com32 utils|g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|install -m 644 -c $(INSTALL_DIAG) $(INSTALLROOT)$(DIAGDIR)|# install -m 644 -c $(INSTALL_DIAG) $(INSTALLROOT)$(DIAGDIR)|g' -i "${srcdir}/${_pkgname}/Makefile" || true
	
	msg "Fix FHS manpage path"
	sed 's|/usr/man|/usr/share/man|g' -i "${srcdir}/${_pkgname}/mk/syslinux.mk" || true
	
}

_build_syslinux_bios() {
	
	rm -rf "${srcdir}/${_pkgname}-bios/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-bios"
	cd "${srcdir}/${_pkgname}-bios/"
	
	msg "Do not try to compile bios build with our default LDFLAGS, it will fail"
	unset LDFLAGS
	
	msg "Run make bios spotless"
	make PYTHON="python2" bios spotless
	echo
	
	msg "Run make bios"
	make PYTHON="python2" bios
	echo
	
	msg "Run make bios installer"
	make PYTHON="python2" bios installer
	echo
	
}

_build_syslinux_efi64() {
	
	rm -rf "${srcdir}/${_pkgname}-efi64/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-efi64"
	cd "${srcdir}/${_pkgname}-efi64/"
	
	msg "Unset all compiler FLAGS for efi64 build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Run make efi64 spotless"
	make PYTHON="python2" efi64 spotless
	echo
	
	msg "Run make efi64"
	make PYTHON="python2" efi64
	echo
	
	msg "Run make efi64 installer"
	make PYTHON="python2" efi64 installer
	echo
	
}

_build_syslinux_efi32() {
	
	rm -rf "${srcdir}/${_pkgname}-efi32/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-efi32"
	cd "${srcdir}/${_pkgname}-efi32/"
	
	msg "Unset all compiler FLAGS for efi32 build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Run make efi32 spotless"
	make PYTHON="python2" efi32 spotless
	echo
	
	msg "Run make efi32"
	make PYTHON="python2" efi32
	echo
	
	msg "Run make efi32 installer"
	make PYTHON="python2" efi32 installer
	echo
	
}

build() {
	
	cd "${srcdir}/${_pkgname}/"
	
	if [[ "${CARCH}" == "x86_64" ]]; then
		msg "Build syslinux efi64"
		_build_syslinux_efi64
		echo
	fi
	
	if [[ "${CARCH}" == "i686" ]]; then
		msg "Build syslinux efi32"
		_build_syslinux_efi32
		echo
	fi
	
	msg "Build syslinux bios"
	_build_syslinux_bios
	echo
	
}

_package_syslinux_bios() {
	
	cd "${srcdir}/${_pkgname}-bios/"
	
	msg "Install Syslinux bios"
	make INSTALLROOT="${pkgdir}/" AUXDIR="/usr/lib/syslinux/bios/" bios install
	echo
	
	msg "Remove syslinux.exe,syslinux64.exe,syslinux.com and dosutil dir"
	rm "${pkgdir}/usr/lib/syslinux/bios"/syslinux.{com,exe} || true
	rm "${pkgdir}/usr/lib/syslinux/bios/syslinux64.exe" || true
	rm -rf "${pkgdir}/usr/lib/syslinux/bios/dosutil/" || true
	
	msg "Remove com32 and diag dirs"
	rm -rf "${pkgdir}/usr/lib/syslinux/bios/diag/" || true
	rm -rf "${pkgdir}/usr/lib/syslinux/bios/com32/" || true
	
	msg "Move extlinux binary to /usr/bin"
	install -d "${pkgdir}/usr/bin"
	mv "${pkgdir}/sbin/extlinux" "${pkgdir}/usr/bin/extlinux"
	rm -rf "${pkgdir}/sbin/"
	
	msg "Install syslinux docs"
	install -d "${pkgdir}/usr/share/doc"
	cp -ar "${srcdir}/${_pkgname}/doc" "${pkgdir}/usr/share/doc/syslinux"
	
	msg "Install syslinux.cfg"
	install -D -m0644 "${srcdir}/syslinux.cfg" "${pkgdir}/boot/syslinux/syslinux.cfg"
	
	msg "Install the syslinux-install_update script"
	## This script is maintained at git://gist.github.com/772138.git
	## Script not yet updated for syslinux-efi
	install -D -m0755 "${srcdir}/syslinux-install_update" "${pkgdir}/usr/bin/syslinux-install_update"
	
}

_package_syslinux_efi() {
	
	cd "${srcdir}/${_pkgname}/"
	
	if [[ "${CARCH}" == "x86_64" ]]; then
		cd "${srcdir}/${_pkgname}-efi64/"
		msg "Install Syslinux efi64"
		make INSTALLROOT="${pkgdir}/" AUXDIR="/usr/lib/syslinux/" efi64 install
		echo
	fi
	
	if [[ "${CARCH}" == "i686" ]]; then
		cd "${srcdir}/${_pkgname}-efi32/"
		msg "Install Syslinux efi32"
		make INSTALLROOT="${pkgdir}/" AUXDIR="/usr/lib/syslinux/" efi32 install
		echo
	fi
	
}

package() {
	
	cd "${srcdir}/${_pkgname}/"
	
	msg "Package Syslinux efi"
	_package_syslinux_efi
	echo
	
	msg "Package Syslinux bios"
	_package_syslinux_bios
	echo
	
}

