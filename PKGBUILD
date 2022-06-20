# Maintainer: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: aksr <aksr at t-com dot me>
# Contributor: Lucky <archlinux@builds.lucky.li>
## Based on libtorrent [community]
pkgname=libtorrent-git
pkgver=0.13.8.r20.g53596afc
pkgrel=2
pkgdesc='BitTorrent library with a focus on high performance and good code'
url='https://github.com/rakshasa/libtorrent'
arch=('x86_64' 'i686')
license=('GPL2')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib')
makedepends=('git' 'cppunit')
conflicts=('libtorrent')
provides=("libtorrent=${pkgver}")
options=('debug')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  # Generate git tag based version. Count only proper v#.# [#=number] tags, skip those starting with letters
  git describe --long --tags --match 'v[0-9][0-9.][0-9.]*' | sed 's/^v//;s/^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)/\1\2/;s/\([0-9]\+-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname/test"

  # Don't hardcode cppunit, main configure script finds it via pkg-config
  sed '/AM_PATH_CPPUNIT/d' -i configure.ac

  cd "$srcdir/$pkgname"

  # Don't force-link 'make test' cppunit dependency to runtime libraries
  sed -E 's/[    ]*\$CPPUNIT_CFLAGS[    ]*/ /g
          s/[    ]*\$CPPUNIT_LIBS[    ]*/ /g' \
          -i configure.ac

  # Generate configure scripts and Makefiles
  autoreconf --verbose --force --install --symlink
}

build() {
  cd "$srcdir/$pkgname"

  ./configure \
    --prefix=/usr \
    --enable-debug \
    --enable-extra-debug \
    --disable-silent-rules

  make
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
