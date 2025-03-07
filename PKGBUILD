# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Cédric Schieli <cschieli at gmail dot com>
#
# To fetch the author's GPG key, run:
#   $ gpg --locate-keys bwh@kernel.org

pkgname=klibc
pkgver=2.0.14
pkgrel=1
pkgdesc="A minimalistic libc subset for use with initramfs"
arch=(x86_64 aarch64 i686)
url="https://mirrors.kernel.org/pub/linux/libs/klibc"
license=('GPL')
depends=(perl)
makedepends=(linux-api-headers)
options=('staticlibs')
validpgpkeys=(
  'AC2B29BD34A6AFDDB3F68F35E7BFC8EC95861109' # Ben Hutchings <bwh@kernel.org>
)
source=(
  "$url/2.0/${pkgname}-${pkgver}.tar."{xz,sign}
)
sha256sums=('281bfb683e196818412af70b8968b7726475a80ff1c4bd67119e6bf5059f9075'
            'SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p uapi/include
  ln -sf /usr/include/{asm,asm-generic,linux} uapi/include/
}

build() {
  cd "$pkgname-$pkgver"
  make KLIBCKERNELSRC=uapi
}

check() {
  cd "$pkgname-$pkgver"
  make -k KLIBCKERNELSRC=uapi test
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/lib"
  ln -s "$pkgdir/usr/lib" "$pkgdir/lib"
  make KLIBCKERNELSRC=uapi INSTALLROOT="$pkgdir" mandir=/usr/share/man install
  rm -f "$pkgdir/lib"
}
