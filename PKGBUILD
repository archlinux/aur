# Maintainer : Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_IA32_EFI_IN_ARCH_X64="1"

_pkgname="syslinux"
pkgname="${_pkgname}-git"

pkgver=6.03pre11
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Collection of boot loaders that boot from FAT, ext2/3/4 and btrfs filesystems, from CDs and via PXE - GIT master branch"
url="http://syslinux.zytor.com/"
license=('GPL2')
options=('!makeflags' '!emptydirs')
backup=('boot/syslinux/syslinux.cfg')

conflicts=('syslinux' 'syslinux-bios' 'syslinux-efi' 'syslinux-firmware-git')
provides=("syslinux=${pkgver}" "syslinux-bios=${pkgver}" "syslinux-efi=${pkgver}" "syslinux-firmware-git=${pkgver}")

makedepends=('git' 'python2' 'nasm' 'ncurses')
depends=('perl' 'glibc')
optdepends=('perl-passwd-md5:  For md5pass'
            'perl-digest-sha1: For sha1pass'
            'mtools:           For mkdiskimage and syslinux support'
            'gptfdisk:         For GPT support'
            'util-linux:       For isohybrid'
            'efibootmgr:       For EFI support'
            'dosfstools:       For EFI support')

if [[ "${_IA32_EFI_IN_ARCH_X64}" == "1" ]]; then
	makedepends+=('lib32-glibc')
fi

install="${_pkgname}.install"

source=("syslinux::git+http://git.zytor.com/syslinux/syslinux.git#branch=master"
        "gnu-efi::git+http://git.code.sf.net/p/gnu-efi/code#commit=3c62e78556aea01e9798380cd46794c6ca09d4bd"
        'syslinux.cfg'
        'syslinux-install_update')

sha1sums=('SKIP'
          'SKIP'
          'b0f174bcc0386fdf699e03d0090e3ac841098010'
          'cfba99d3ccac2680ce7819cb97a6695307f2ba9d')

pkgver() {
	cd "${srcdir}/syslinux/"
	echo "$(git describe --tags)" | sed -e 's|syslinux-||g' -e 's|-pre|pre|g' -e 's|-|.|g'
}

prepare() {
	
	cd "${srcdir}/${_pkgname}/"
	
	msg "Run git clean"
	git clean -x -d -f
	echo
	
	msg "Do not try to build the Windows or DOS installers and DIAG files"
	sed 's|diag libinstaller dos win32 win64 dosutil txt|libinstaller txt|g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|win32/syslinux.exe win64/syslinux64.exe||g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|dosutil/*.com dosutil/*.sys||g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|dos/syslinux.com||g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|INSTALLSUBDIRS = com32 utils dosutil|INSTALLSUBDIRS = com32 utils|g' -i "${srcdir}/${_pkgname}/Makefile" || true
	sed 's|install -m 644 -c $(INSTALL_DIAG) $(INSTALLROOT)$(DIAGDIR)|# install -m 644 -c $(INSTALL_DIAG) $(INSTALLROOT)$(DIAGDIR)|g' -i "${srcdir}/${_pkgname}/Makefile" || true
	
	msg "Fix FHS manpage path"
	sed 's|/usr/man|/usr/share/man|g' -i "${srcdir}/${_pkgname}/mk/syslinux.mk" || true
	
	cd "${srcdir}/gnu-efi/"
	
	msg "Run git clean for gnu-efi"
	git clean -x -d -f
	echo
	
	msg "Revert gnu-efi Makefile 'make install' problamatic commit"
	git revert --no-commit 06744d69273de4945cf0ffcaa4a6abf7cec707b6
	echo

	msg "Prepare gnu-efi source"
	cp -r "${srcdir}/gnu-efi/gnu-efi-3.0" "${srcdir}/${_pkgname}/gnu-efi/gnu-efi-3.0"
	
	cd "${srcdir}/${_pkgname}/"
	
}

_build_syslinux_bios() {
	
	rm -rf "${srcdir}/${_pkgname}-bios/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-bios"
	
	mkdir -p "${srcdir}/${_pkgname}-bios/OBJDIR"
	cd "${srcdir}/${_pkgname}-bios/"
	
	msg "Do not try to compile bios build with our default LDFLAGS, it will fail"
	unset LDFLAGS
	
	msg "Run make bios"
	make PYTHON="python2" OBJDIR="${srcdir}/${_pkgname}-bios/OBJDIR" bios
	echo
	
	msg "Run make bios installer"
	make PYTHON="python2" OBJDIR="${srcdir}/${_pkgname}-bios/OBJDIR" bios installer
	echo
	
}

_build_syslinux_efi64() {
	
	rm -rf "${srcdir}/${_pkgname}-efi64/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-efi64"
	
	mkdir -p "${srcdir}/${_pkgname}-efi64/OBJDIR/efi64/"
	cd "${srcdir}/${_pkgname}-efi64/gnu-efi/gnu-efi-3.0/"
	
	msg "Unset all compiler FLAGS for gnu-efi efi64 build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Run make gnu-efi for syslinux efi64"
	make ARCH="x86_64" -j1
	echo
	
	msg "Run make install gnu-efi for syslinux efi64"
	make ARCH="x86_64" PREFIX="${srcdir}/${_pkgname}-efi64/OBJDIR/efi64/" -j1 install
	echo
	
	cd "${srcdir}/${_pkgname}-efi64/"
	
	msg "Unset all compiler FLAGS for efi64 build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Run make efi64"
	make PYTHON="python2" OBJDIR="${srcdir}/${_pkgname}-efi64/OBJDIR" efi64
	echo
	
	msg "Run make efi64 installer"
	make PYTHON="python2" OBJDIR="${srcdir}/${_pkgname}-efi64/OBJDIR" efi64 installer
	echo
	
}

_build_syslinux_efi32() {
	
	rm -rf "${srcdir}/${_pkgname}-efi32/" || true
	cp -r "${srcdir}/${_pkgname}" "${srcdir}/${_pkgname}-efi32"
	
	mkdir -p "${srcdir}/${_pkgname}-efi32/OBJDIR/efi32/"
	cd "${srcdir}/${_pkgname}-efi32/gnu-efi/gnu-efi-3.0/"
	
	msg "Unset all compiler FLAGS for gnu-efi efi32 build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Run make gnu-efi for syslinux efi32"
	make ARCH="ia32" -j1
	echo
	
	msg "Run make install gnu-efi for syslinux efi32"
	make ARCH="ia32" PREFIX="${srcdir}/${_pkgname}-efi32/OBJDIR/efi32/" install
	echo
	
	cd "${srcdir}/${_pkgname}-efi32/"
	
	msg "Unset all compiler FLAGS for efi32 build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Run make efi32"
	make PYTHON="python2" OBJDIR="${srcdir}/${_pkgname}-efi32/OBJDIR" efi32
	echo
	
	msg "Run make efi32 installer"
	make PYTHON="python2" OBJDIR="${srcdir}/${_pkgname}-efi32/OBJDIR" efi32 installer
	echo
	
}

build() {
	
	cd "${srcdir}/${_pkgname}/"
	
	if [[ "${CARCH}" == "x86_64" ]]; then
		msg "Build syslinux efi64"
		_build_syslinux_efi64
		echo
		
		if [[ "${_IA32_EFI_IN_ARCH_X64}" == "1" ]]; then
			msg "Build syslinux efi32"
			_build_syslinux_efi32
			echo
		fi
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
	make INSTALLROOT="${pkgdir}/" AUXDIR="/usr/lib/syslinux/bios/" OBJDIR="${srcdir}/${_pkgname}-bios/OBJDIR" bios install
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
	## This script is maintained at https://gist.github.com/pyther/772138
	## Script not yet updated for syslinux-efi
	install -D -m0755 "${srcdir}/syslinux-install_update" "${pkgdir}/usr/bin/syslinux-install_update"
	
}

_package_syslinux_efi() {
	
	cd "${srcdir}/${_pkgname}/"
	
	if [[ "${CARCH}" == "x86_64" ]]; then
		cd "${srcdir}/${_pkgname}-efi64/"
		msg "Install Syslinux efi64"
		make INSTALLROOT="${pkgdir}/" AUXDIR="/usr/lib/syslinux/" OBJDIR="${srcdir}/${_pkgname}-efi64/OBJDIR" efi64 install
		echo
		
		if [[ "${_IA32_EFI_IN_ARCH_X64}" == "1" ]]; then
			cd "${srcdir}/${_pkgname}-efi32/"
			msg "Install Syslinux efi32"
			make INSTALLROOT="${pkgdir}/" AUXDIR="/usr/lib/syslinux/" OBJDIR="${srcdir}/${_pkgname}-efi32/OBJDIR" efi32 install
			echo
		fi
	fi
	
	if [[ "${CARCH}" == "i686" ]]; then
		cd "${srcdir}/${_pkgname}-efi32/"
		msg "Install Syslinux efi32"
		make INSTALLROOT="${pkgdir}/" AUXDIR="/usr/lib/syslinux/" OBJDIR="${srcdir}/${_pkgname}-efi32/OBJDIR" efi32 install
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

