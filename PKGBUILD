# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=tamanoir-svn
pkgver=281
pkgrel=1
pkgdesc='Image processing tool to remove dust from picture scans'
arch=('i686' 'x86_64')
url='http://code.google.com/p/tamanoir/'
license=('GPL3')
depends=(opencv qt4)
makedepends=(opencv qt4)
optdepends=()
install='tamanoir.install'
source=(
tamanoir.desktop
)
_svntrunk='http://tamanoir.googlecode.com/svn/trunk/'
_svnmod='tamanoir'
pkgver() {
    cd "$SRCDEST/local_repo"
      svnversion | tr -d [A-z]
}
build(){
  cd "$srcdir"
  msg2 "Connecting to SVN server...."
    if [[ -d ${_svnmod}/.svn ]]; then
     (cd ${_svnmod} && svn up -r $pkgver)
  else
     svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg2 "SVN checkout done or server timeout"

  cd $_svnmod
  lrelease-qt4 tamanoir_French.ts -qm tamanoir_French.qm
  qmake-qt4 Tamanoir-distrib.pro
  make
}
package(){
  cd "$srcdir"/$_svnmod

  install -Dm755 tamanoir "$pkgdir"/usr/bin/tamanoir
  install -Dm644 tamanoir_French.qm "$pkgdir"/usr/share/tamanoir/tamanoir_French.qm
  install -Dm644 ../tamanoir.desktop "$pkgdir"/usr/share/applications/tamanoir.desktop
  install -Dm644 icon/tamanoir32.png "$pkgdir"/usr/share/pixmaps/tamanoir.png
}
md5sums=('72f4fab857d9ddb7ec39693657b21060')
