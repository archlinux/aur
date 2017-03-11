# $Id: PKGBUILD 279795 2016-11-03 13:32:07Z dreisner $
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: ice-man <icemanf@gmail.com>

_pkgname=libssh2
pkgname=libssh2-boringssl-ed25519-git
pkgver=1.8.0.r41.g6f0ed0f
pkgrel=1
pkgdesc="A library implementing the SSH2 protocol as defined by Internet Drafts (with yan12125's patch for ED25519 authentication support)"
url="https://www.libssh2.org/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')  # Uses bundled BoringSSL
makedepends=('cmake' 'git' 'go' 'perl' 'zlib')  # BoringSSL require Go and Perl to build
provides=('libssh2')
conflicts=('libssh2')
source=('git+https://github.com/yan12125/libssh2#branch=boringssl-ed25519'
        'git+https://boringssl.googlesource.com/boringssl')
md5sums=('SKIP'
         'SKIP')
options=('staticlibs' '!strip')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^libssh2\.//'
  )
}

prepare() {
  cd "$_pkgname"

  git submodule init
  git config submodule.third_party/boringssl.url "${srcdir}/boringssl"
  git submodule update

  mkdir -p build
}

build() {
  cd "$_pkgname/build"

  cmake .. \
    -DCRYPTO_BACKEND=BoringSSL \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Debug \
    -DBUILD_SHARED_LIBS=ON

  make
}

package() {
  cd "$_pkgname/build"

  make DESTDIR="$pkgdir" install
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
