# Maintainer: Frederick Gnodtke <fgnodtke at cronosx dot de>

pkgname=jolly
pkgver=0.2.0
pkgrel=1
pkgdesc="Static image gallery generator."
arch=('any')
url="https://gitlab.com/prior99/jolly"
license=('GPL3')
depends=(
    'nodejs'
    'zsh')
makedepends=('yarn')
source=("https://gitlab.com/prior99/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
sha256sums=('c7a639105656de72e9cee52b7e44878ebe0e4e0996f41892b1d31135f844715e')

_jsdir=${pkgname}-${pkgver}

build() {
    cd $srcdir/$_jsdir
    yarn install
    yarn build
    rm -rf node_modules
    yarn install --production
    cd ..
    echo -e '#!/bin/sh\nexec node /usr/share/jolly "$@"' > jolly
    chmod +x jolly
}

package() {
  mkdir -p $pkgdir/usr/share/jolly
  cp -r $srcdir/$_jsdir/dist/* $pkgdir/usr/share/jolly/
  cp -r $srcdir/$_jsdir/node_modules $pkgdir/usr/share/jolly/
  install -Dm755 $srcdir/jolly $pkgdir/usr/bin/jolly
}
