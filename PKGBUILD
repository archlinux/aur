# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=tuxboot-git
_pkgname=tuxboot
pkgver=0.8.r2.gfced5c1
pkgrel=1
pkgdesc="A tool that helps you to create a bootable Live USB drive for Clonezilla live, DRBL live, GParted live and Tux2live. Development version"
url="http://www.tuxboot.org/"
license=('GPL')
arch=('i686' 'x86_64')
source=("git+git://git.code.sf.net/p/tuxboot/git")
sha1sums=('SKIP')
depends=('syslinux' 'qt4' 'mtools' 'polkit')
makepdepends=('git')
conflicts=('tuxboot')

pkgver() {
   cd git
   echo $(git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g')
}

build() {
   cd git
   sed -i '/\[en_US\]/d' ${_pkgname}.desktop
   sed -i '/^RESOURCES/d' ${_pkgname}.pro
   lupdate-qt4 ${_pkgname}.pro
   lrelease-qt4 ${_pkgname}.pro
   qmake-qt4 "DEFINES += NOSTATIC" "RESOURCES -= tuxboot.qrc"
   make
}

package() {
   cd git
   install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
   install -Dm755 ${_pkgname}-pkexec ${pkgdir}/usr/bin/${_pkgname}-pkexec
   mkdir -p ${pkgdir}/usr/share/${_pkgname}
   install -m644 i18n/${_pkgname}_*.qm ${pkgdir}/usr/share/${_pkgname}/
   install -Dm644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
   install -Dm644 ${_pkgname}.xpm  ${pkgdir}/usr/share/pixmaps/${_pkgname}.xpm
}
