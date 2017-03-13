# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: kaylyn
# Contributor: Giuseppe Calà <jiveaxe@gmail.com>

pkgname=cryfs
pkgver=0.9.7
pkgrel=3
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
sha256sums=('4a5745bc3a04c934c931f8a578f08f7e19e59c2e2cb42d8f940e5154e0b5ba53'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Monkey patching spdlog for great good...'
  sed -i 's/CHAR_WIDTH/CHAR_SIZE/g' vendor/spdlog/spdlog/fmt/bundled/format.h
}

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
