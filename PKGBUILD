# Maintainer : Keshav Padram (the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

# _gitroot="git://git.zytor.com/syslinux/syslinux.git"
_gitroot="git://git.kernel.org/pub/scm/boot/syslinux/syslinux.git"
_gitname="syslinux"
_gitbranch="firmware"

_pkgname="syslinux"
pkgname="${_pkgname}-firmware-git"

pkgver=6.02pre8
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Collection of boot loaders that boot from FAT, ext2/3/4 and btrfs filesystems, from CDs and via PXE - GIT firmware branch"
url="http://syslinux.zytor.com/"
license=('GPL2')
options=('!makeflags' '!emptydirs')
backup=('boot/syslinux/syslinux.cfg')

conflicts=('syslinux' 'syslinux-bios' 'syslinux-efi' 'syslinux-git')
provides=('syslinux' 'syslinux-bios' 'syslinux-efi' 'syslinux-git')

makedepends=('git' 'python2' 'nasm' 'gnu-efi-libs')
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
          '05405401f80c7fd1d19a3e66d50c83e008590447')

pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --tags | sed -e 's|syslinux-||g' -e 's|-pre|pre|g' -e 's|-|.|g'
}

_build_syslinux_bios() {
	
	rm -rf "${srcdir}/${_pkgname}-bios/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-bios"
	cd "${srcdir}/${_pkgname}-bios/"
	
	## Do not try to build syslinux with our default LDFLAGS, it will fail
	unset LDFLAGS
	
	make PYTHON="python2" bios
	make PYTHON="python2" bios installer
	
}

_build_syslinux_efi64() {
	
	rm -rf "${srcdir}/${_pkgname}-efi64/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-efi64"
	cd "${srcdir}/${_pkgname}-efi64/"
	
	## Unset all compiler FLAGS for efi64 build
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	make PYTHON="python2" efi64
	make PYTHON="python2" efi64 installer
	
}

_build_syslinux_efi32() {
	
	rm -rf "${srcdir}/${_pkgname}-efi32/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-efi32"
	cd "${srcdir}/${_pkgname}-efi32/"
	
	## Unset all compiler FLAGS for efi32 build
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	make PYTHON="python2" efi32
	make PYTHON="python2" efi32 installer
	
}

build() {
	
	cd "${srcdir}/${_pkgname}/"
	
	## Do not try to build the Windows or DOS installers and DIAG files
	sed 's|diag libinstaller dos win32 win64 dosutil txt|libinstaller txt|g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|win32/syslinux.exe win64/syslinux64.exe||g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|dosutil/*.com dosutil/*.sys||g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|dos/syslinux.com||g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|INSTALLSUBDIRS = com32 utils dosutil|INSTALLSUBDIRS = com32 utils|g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|install -m 644 -c $(INSTALL_DIAG) $(INSTALLROOT)$(DIAGDIR)|# install -m 644 -c $(INSTALL_DIAG) $(INSTALLROOT)$(DIAGDIR)|g' -i "${srcdir}/${_pkgname}/Makefile" || true
	
	## Fix FHS manpage path
	sed 's|/usr/man|/usr/share/man|g' -i "${srcdir}/${_pkgname}/mk/syslinux.mk" || true
	
	## Build syslinux-efi
	if [[ "${CARCH}" == "x86_64" ]]; then
		_build_syslinux_efi64
	fi
	
	if [[ "${CARCH}" == "i686" ]]; then
		_build_syslinux_efi32
	fi
	
	## Build syslinux-bios
	_build_syslinux_bios
	
}

_package_syslinux_bios() {
	
	cd "${srcdir}/${_pkgname}-bios/"
	
	## Install Syslinux bios
	make INSTALLROOT="${pkgdir}/" AUXDIR="/usr/lib/syslinux/bios/" bios install
	
	## Remove syslinux.exe,syslinux64.exe,syslinux.com and dosutil dir
	rm "${pkgdir}/usr/lib/syslinux/bios"/syslinux.{com,exe} || true
	rm "${pkgdir}/usr/lib/syslinux/bios/syslinux64.exe" || true
	rm -rf "${pkgdir}/usr/lib/syslinux/bios/dosutil/" || true
	
	## Remove com32 and diag dirs
	rm -rf "${pkgdir}/usr/lib/syslinux/bios/diag/" || true
	rm -rf "${pkgdir}/usr/lib/syslinux/bios/com32/" || true
	
	## Move extlinux binary to /usr/bin
	install -d "${pkgdir}/usr/bin"
	mv "${pkgdir}/sbin/extlinux" "${pkgdir}/usr/bin/extlinux"
	rm -rf "${pkgdir}/sbin/"
	
	## Install docs
	install -d "${pkgdir}/usr/share/doc"
	cp -ar "${srcdir}/${_pkgname}/doc" "${pkgdir}/usr/share/doc/syslinux"
	
	## Install the default configuration
	install -D -m0644 "${srcdir}/syslinux.cfg" "${pkgdir}/boot/syslinux/syslinux.cfg"
	
	## Install the installation and update script
	## This script is maintained at git://gist.github.com/772138.git
	## Script not yet updated for syslinux-efi
	install -D -m0755 "${srcdir}/syslinux-install_update" "${pkgdir}/usr/bin/syslinux-install_update"
	
}

package() {
	
	cd "${srcdir}/${_pkgname}/"
	
	if [[ "${CARCH}" == "x86_64" ]]; then
		cd "${srcdir}/${_pkgname}-efi64/"
		make INSTALLROOT="${pkgdir}/" AUXDIR="/usr/lib/syslinux/" efi64 install
	fi
	
	if [[ "${CARCH}" == "i686" ]]; then
		cd "${srcdir}/${_pkgname}-efi32/"
		make INSTALLROOT="${pkgdir}/" AUXDIR="/usr/lib/syslinux/" efi32 install
	fi
	
	_package_syslinux_bios
	
}

