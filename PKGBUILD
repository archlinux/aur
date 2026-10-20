# Maintainer: Brian Bidulock <bidulock@openss7.org>
# vim:set ts=2 sw=2 et:

pkgname=libumem
pkgver=3.3.1
pkgrel=3
pkgdesc="slab and magazine allocator with built-in debugging"
arch=('x86_64' 'aarch64')
url='https://github.com/gburd/libumem/'
license=('LicenseRef-custom')
depends=('glibc' 'libelf' 'numactl')
optdepends=('python: for debugging tools')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gburd/libumem/archive/refs/tags/v${pkgver}.tar.gz"
        post-release-fixes.patch)
b2sums=('3ecc562f7cb6be3b5319058bd80edcc177525b21d743e030406d3d0da60278d0f117bb5ced69b86637b0e14b2b3a0914e22638008fbefb055fe132ff9b7791ea'
        '642c69c832752aed3e5727fee574268bd543ba25756a70ba82ff62103b40cf3c07b3fac5957ece9c51c1ff533ec46ef17fc27c4f6e0d39a0882bb37388483373')

prepare() {
  cd $pkgname-$pkgver
  patch -Np2 -b -z .orig <../post-release-fixes.patch
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --enable-pic \
    --enable-numa
# --enable-avx2 when building on x86_64 ABI V3
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm644 -t "$pkgdir"/usr/share/licenses/$pkgname/ {COPYRIGHT,OPENSOLARIS.LICENSE}
}
b2sums=('3ecc562f7cb6be3b5319058bd80edcc177525b21d743e030406d3d0da60278d0f117bb5ced69b86637b0e14b2b3a0914e22638008fbefb055fe132ff9b7791ea'
        '592760725001e19d39453c774a75c0f053f7abcc76d0fa48ac9d92f01545c998471079e548c2307fd325748b86321cf9c7f1e11a3a9de57c750f4109f3b7c486')
