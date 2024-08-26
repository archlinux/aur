
pkgname=hostapd-wpe
_name=hostap
pkgver=2.11
pkgrel=1
pkgdesc="Modified hostapd to facilitate AP impersonation attacks"
arch=(i686 x86_64)
url="https://w1.fi/hostapd/"
license=(BSD-3-Clause)
depends=(
  glibc
  libnl
  openssl-1.0 # alternative with missing features: openssl-1.1
  sqlite
)
makedepends=(
  git
)
source=(
  "git+https://w1.fi/$_name.git?signed#tag=${_name}_${pkgver//./_}"
  0001_adj-wpe.patch
  https://raw.githubusercontent.com/aircrack-ng/aircrack-ng/master/patches/wpe/${pkgname}/${_name}d-${pkgver}-wpe.patch
)
b2sums=('163d2e6644902f36b3b5f25e328221fa34495d745801e8d3dce874b05366c81370ef75c8f7e0198e206a3d04c5ea4bb501bf97693fa481e15cf5067d80ab0c1e'
        'e65bd54e927522a70974d7bb6391ccdd24a79f00cde0e0b292e81830c0a89b2a12ab642b8c0a21361a8e19052b82bdcaa63acb4fb0bf1b62058866b4c12504a7'
        '5bd6fb7f7383d68f1f42340ecc15a25c5fd963c7328b837b7efa19f05c4bd5c364eb33c0a5d7a5d33efffe8f13734f51ef827b0d1e7e6c7caec7ca0a4ced7aa5')
validpgpkeys=(EC4AA0A991A5F2464582D52D2B6EF432EFC895FA) # Jouni Malinen <j@w1.fi>

prepare() {
  # Adjust aircrack-ng patch as it doesn't cleanly apply
  patch -Np1 --follow-symlinks -i "${srcdir}"/0001_adj-wpe.patch

  # Apply aircrack-ng patch
  patch -Np1 -d $_name -i "${srcdir}"/${_name}d-${pkgver}-wpe.patch
}

build() {
  make -C $_name/${_name}d
}

package() {
  cd $_name
  make -C ${_name}d install DESTDIR="$pkgdir" BINDIR=/usr/bin
  # license
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
