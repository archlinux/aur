# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Antony Male <antony dot male at geemail dot com>>

pkgname=libsnappy
pkgver=1.1.3
pkgrel=1
pkgdesc="A fast compressor/decompressor"
arch=('i686' 'x86_64')
makedepends=('autoconf' 'automake' 'git' 'libtool' 'm4' 'make' 'pkg-config')
url="https://google.github.io/snappy/"
license=('BSD')
source=($pkgname-$pkgver::git+https://github.com/google/snappy
        pkg-config.diff::https://github.com/deviance/snappy/commit/d2cb73b6ac1839462fcea926c7e73d1e627bd699.diff)
sha256sums=('SKIP'
            '596a9246a24822cd83abaa88ca3846fbaa1d50b5dcc4ebe23bf29ff2e19241d8')
provides=('snappy')
conflicts=('snappy')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fixing pkg-config...'
  git apply "$srcdir/pkg-config.diff"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  # compile without assertions
  export CXXFLAGS+=\ -DNDEBUG
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/snappy \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/snappy \
    --localstatedir=/var/lib/snappy \
    --with-gnu-ld
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libsnappy"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
