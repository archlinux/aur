# Maintainer: Frederick Gnodtke <fgnodtke at cronosx dot de>

pkgname=jolly
pkgver=0.1.0
pkgrel=1
pkgdesc="Static image gallery generator."
arch=('any')
url="https://gitlab.com/prior99/jolly"
license=('GPL3')
depends=(
    'nodejs'
    'zsh')
makedepends=('yarn')
provides=('jolly')
source=("https://gitlab.com/prior99/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
options=('!strip')
sha256sums=('42b874530de376facb5138fc7a5ae2d8f5d7aae8192e57abbc1ce3708fe2a516')

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
