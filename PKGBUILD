# Contributor: Vincent Prelat <vincent@prelat.fr>

pkgname=chmsee-git
pkgver=2.0.2
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="A chm (MS HTML help file format) viewer based on xulrunner."
url="http://chmsee.googlecode.com/"
license=('GPL')
depends=('xulrunner' 'chmlib' 'desktop-file-utils')
makedepends=('git' 'python2')
conflicts=('chmsee')
provides=('chmsee')
install=chmsee-git.install
source=(chmsee-git::git://github.com/jungleji/chmsee
	chmsee)
md5sums=('SKIP'
         '1787edd1de8aa75bd9fa75a5ab319e85')


pkgver() {
  cd $pkgname
  git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

build() {
  # Run with higher xulrunner versions
  sed -i -e 's/MaxVersion=[0-9]\+/MaxVersion=99/g' $pkgname/application.ini
  cd $pkgname/src
  make -f Makefile.arch
}

package() {
  cd ${srcdir}/$pkgname

  install -d ${pkgdir}/usr/share/chmsee
  cp -a * ${pkgdir}/usr/share/chmsee
  rm -r ${pkgdir}/usr/share/chmsee/src
  install -Dm644 data/chmsee.desktop.in \
    ${pkgdir}/usr/share/applications/chmsee.desktop
  # Fix FS#25152
  sed -i -e 's/_//g' ${pkgdir}/usr/share/applications/chmsee.desktop
  #
  install -d ${pkgdir}/usr/share/pixmaps
  install -Dm644 data/chmsee-icon.png ${pkgdir}/usr/share/pixmaps
  install -Dm755 ${srcdir}/chmsee ${pkgdir}/usr/bin/chmsee
#  install -d ${pkgdir}/usr/share/icons
#  cp -a data/icons/* ${pkgdir}/usr/share/icons/
}
