# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=diffimg
_pkgname=DiffImg
pkgver=2.0.1
pkgrel=1
pkgdesc="Simple image comparison tool"
arch=('i686' 'x86_64')
license=('GPL2')
depends=(qt4 qwt opencv)
makedepends=(qt4 qwt opencv)
url='http://sourceforge.net/projects/diffimg/'
source=(
"http://sourceforge.net/projects/diffimg/files/${pkgver}/diffimg-${pkgver}.zip"
diffimg.desktop
)
install='diffimg.install'

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i -e 's/\r//' \
    -e 's/|/-print0 |/' \
    -e "s#dos2unix#-0 sed -i 's|\\\r||'#" \
    tounix.sh
  sh ./tounix.sh

  cd ./build
  qmake-qt4 -recursive INSTALL_PREFIX=/usr diffimg.pro
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  cd ./build
  make INSTALL_ROOT="${pkgdir}" install

#  install -dm755 "$pkgdir"/usr/share/icons
#  ln -s ../pixmaps/res/diffimg.ico "$pkgdir"/usr/share/icons/diffimg.ico
  # fix conflicts with graphviz
  mv "$pkgdir"/usr/bin/$pkgname "$pkgdir"/usr/bin/${_pkgname}
  mv "$pkgdir"/usr/share/man/man1/$pkgname.1.gz "$pkgdir"/usr/share/man/man1/${_pkgname}.1.gz
}
md5sums=('1b60f8d121761b8b77fe152a3fbd5639'
         '1f924268b20847374b6b260f2b7f1f7d')
