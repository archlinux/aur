# Maintainer: Albert Graef <aggraef at gmail.com>

pkgname=faustlive-git
pkgver=747.9d439cb
pkgrel=1
pkgdesc="A graphical frontend to the Faust compiler."
arch=('i686' 'x86_64')
url="http://faust.grame.fr/"
license=('GPL')
# NOTE: faust2-git used to be a make dependency, but this doesn't work in the
# latest revisions of FaustLive any more, since it will try to link against
# the static qrencode and microhttpd libraries which aren't normally installed
# on Arch. Thus faust2-git is now required at runtime.
depends=('qt4' 'faust2-git' 'jack2' 'qrencode' 'libmicrohttpd' 'openssl' 'liblo' 'curl')
makedepends=('git')
provides=('faustlive')
conflicts=('faustlive')
source=("$pkgname::git+git://git.code.sf.net/p/faudiostream/faustlive")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  # Make sure that we get the dev branch.
  git checkout dev > /dev/null 2>&1
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $srcdir/$pkgname
  make arch=Linux PREFIX=/usr STATIC=0 NETJACK=1
}

package() {
  cd $srcdir/$pkgname
  make install arch=Linux PREFIX=/usr DESTDIR="$pkgdir"
  # docs
  install -d "$pkgdir/usr/share/doc/faustlive"
  install -d "$pkgdir/usr/share/doc/faustlive/FilesToConfigure"
  cp GPL.txt Build/Linux/README.txt Documentation/*.pdf Build/Linux/Distributions/*.pdf "$pkgdir/usr/share/doc/faustlive"
  (cd Build/Linux/Distributions && cp DefaultDSP.dsp DefaultDSP.lib process.svg "$pkgdir/usr/share/doc/faustlive/FilesToConfigure")
}
