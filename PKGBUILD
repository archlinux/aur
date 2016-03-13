# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=cryfs
pkgver=0.9.3.alpha
pkgrel=1
pkgdesc="Cryptographic filesystem for the cloud"
arch=('i686' 'x86_64')
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
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/cryfs/$pkgname/tar.gz/0.9.3-alpha
        git+https://github.com/cryfs/cryfs.wiki)
sha256sums=('136b3009b9a352cd891d41f2cd009a340616105310fedddaa8e678ec23900be3'
            'SKIP')

build() {
  cd "$srcdir/$pkgname-0.9.3-alpha"

  msg2 'Building...'
  mkdir cmake && cd cmake
  cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=off ..
  make
}

package() {
  cd "$srcdir/$pkgname-0.9.3-alpha"

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
