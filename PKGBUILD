# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: kaylyn

pkgname=cryfs
pkgver=0.9.5
pkgrel=2
pkgdesc="Cryptographic filesystem for the cloud"
arch=('armv7h' 'i686' 'x86_64')
depends=('boost'
         'boost-libs'
         'crypto++'
         'curl'
         'fuse'
         'openssl'
         'python2')
makedepends=('cmake' 'git' 'make' 'patch')
url="https://www.cryfs.org"
license=('LGPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/cryfs/$pkgname/tar.gz/$pkgver
        git+https://github.com/cryfs/cryfs.wiki
        "cryfs-crypto++-5.6.4-remove-56-mars.diff")
sha256sums=('84ecc4615ef9e563a2a9570cd90af4e755b4667958fb939a474fb112ac3eadd1'
            'SKIP'
            '6107ed2c2bacc624975c551835debb8717e6090d3e7a0d71233f0686b04baadb')

prepare() {
   cd "$srcdir/$pkgname-$pkgver"

   msg2 'Removing MARS cipher (broken by crypto++ v5.6.4)...'
   patch -p1 <../../cryfs-crypto++-5.6.4-remove-56-mars.diff
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  mkdir cmake && cd cmake
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=off \
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
