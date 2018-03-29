# Contributor: Lucky <archlinux@builds.lucky.li>
## Based on libtorrent [community]
# Maintainer: aksr <aksr at t-com dot me>
pkgname=libtorrent-git
pkgver=0.13.4.r176.gc167c5a9
pkgrel=1
pkgdesc="A BitTorrent library written in C++."
url="https://github.com/rakshasa/libtorrent/"
license=("GPL")
arch=("i686" "x86_64")
depends=("libsigc++" "openssl")
makedepends=("cppunit" "git")
conflicts=('libtorrent')
provides=('libtorrent')
options=("!libtool")
source=("$pkgname::git+https://github.com/rakshasa/libtorrent.git"
        libtorrent-openssl-1.1.patch::"https://github.com/rakshasa/libtorrent/commit/4607bbf7.patch")
md5sums=('SKIP'
         'f041643ba1c308e915fba0b4c9a9e685')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r "s/([^-]*-g)/r\1/;s/-/./g"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed '/AM_PATH_CPPUNIT/d' -i configure.ac
  patch -p1 -i ../libtorrent-openssl-1.1.patch
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  export CXXFLAGS="${CXXFLAGS} -fno-strict-aliasing"
  ./configure --prefix=/usr --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

