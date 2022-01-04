# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
#maintainer tip: rename this file deb.PKGBUILD in practice
_maintainer="Moses Narrow"
pkgname=deb-pkgbuild
_pkgname=${pkgname}
pkgdesc="create a debian package with makepkg"
_pkgdesc="description of a debian package"
#leave archlinux package architecture code as 'any'
arch=('any')
#set to native architecture with dpkg
_pkgarch=$(dpkg --print-architecture)
#manually version for now
pkgver='0.1.0'
_pkgver=${pkgver}
pkgrel=1
_pkgrel=${pkgrel}
license=()
makedepends=('dpkg')
depends=()
_debdeps=""
#source=("")
#sha256sums=('SKIP')

build() {
############################################################
#BUILD AS YOU NORMALLY WOULD HERE
############################################################
#create control file for the debian package
echo "Package: ${_pkgname}" > ${srcdir}/control
echo "Version: ${_pkgver}-${_pkgrel}" >> ${srcdir}/control
echo "Priority: optional" >> ${srcdir}/control
echo "Section: web" >> ${srcdir}/control
echo "Architecture: ${_pkgarch}" >> ${srcdir}/control
echo "Depends: ${_debdeps}" >> ${srcdir}/control
echo "Maintainer: ${_maintainer}" >> ${srcdir}/control
echo "Description: ${_pkgdesc}" >> ${srcdir}/control
}



package() {
_msg2 'creating dirs'
#set up to create a .deb package
_debpkgdir="${_pkgname}-${pkgver}-${_pkgrel}-${_pkgarch}"
_pkgdir="${pkgdir}/${_debpkgdir}"
mkdir -p ${_pkgdir}/usr/bin
#########################################################################
#PACKAGE AS YOU NORMALLY WOULD HERE USING ${_pkgdir} instead of ${pkgdir}
#########################################################################
_msg2 'installing control file'
install -Dm755 ${srcdir}/control ${_pkgdir}/DEBIAN/control

_msg2 'creating the debian package'
#create the debian package
cd $pkgdir
dpkg-deb --build -z9 ${_debpkgdir}
mv *.deb ../../
#exit so the arch package doesn't get built
_msg2 "Exiting so the arch package doesn't get built."
_msg2 "Check your package cache for the created .deb and modify this PKGBUILD to suit your needs"

exit
}

_msg2() {
	(( QUIET )) && return
	local mesg=$1; shift
	printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
