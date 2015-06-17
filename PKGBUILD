# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=tuxboot
pkgver=0.8
pkgrel=1
epoch=1
pkgdesc="A tool that helps you to create a bootable Live USB drive for Clonezilla live, DRBL live, GParted live and Tux2live"
url="http://www.tuxboot.org/"
license=('GPL')
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/project/tuxboot/${pkgver}/source/${pkgname}-${pkgver}.src.tar.gz")
sha1sums=('94dbb964eee8b3c49febb353d2cc5d491716ecf0')
depends=('syslinux' 'qt4' 'mtools' 'polkit')
conflicts=('tuxboot-git')

build() {
   cd "${srcdir}"/${pkgname}-${pkgver}

   # patch the version to correspond the tarball version
   sed -i 's/0.7/0.8/' version.h	

   sed -i '/\[en_US\]/d' ${pkgname}.desktop
   sed -i '/^RESOURCES/d' ${pkgname}.pro
   lupdate-qt4 ${pkgname}.pro
   lrelease-qt4 ${pkgname}.pro
   qmake-qt4 "DEFINES += NOSTATIC" "RESOURCES -= tuxboot.qrc"
   make
}

package() {
   cd "${srcdir}"/${pkgname}-${pkgver}
   install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
   install -Dm755 ${pkgname}-pkexec ${pkgdir}/usr/bin/${pkgname}-pkexec
   mkdir -p ${pkgdir}/usr/share/${pkgname}
   install -m644 i18n/${pkgname}_*.qm ${pkgdir}/usr/share/${pkgname}/
   install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
   install -Dm644 ${pkgname}.xpm  ${pkgdir}/usr/share/pixmaps/${pkgname}.xpm
}
