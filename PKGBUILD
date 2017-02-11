# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: kaylyn

pkgname=cryfs
pkgver=0.9.7
pkgrel=1
pkgdesc="Cryptographic filesystem for the cloud"
arch=('armv7h' 'i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'crypto++'
         'curl'
         'fuse'
         'openssl'
         'python2')
makedepends=('cmake' 'git' 'make')
url="https://www.cryfs.org"
license=('LGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/cryfs/$pkgname/tar.gz/$pkgver
        git+https://github.com/cryfs/cryfs.wiki)
sha256sums=('4d65c462fa988f698090f00052cbb236cfc7e7524b872f96409187bc5285eedd'
            'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  mkdir cmake && cd cmake
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=off \
    -DCRYFS_UPDATE_CHECKS=off \
    ..
  make -j$(($(nproc)/2))
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing wiki...'
  cp -dpr --no-preserve=ownership "$srcdir/$pkgname.wiki" \
    "$pkgdir/usr/share/doc/$pkgname/wiki"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install -C cmake

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
