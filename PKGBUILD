# Maintainer: Arne Brücher <archlinux[at]arne-brucher[dot]de>
# Contributor: lukpod <lukpod[at]mailoo[dot]org>

pkgname=electrum-ltc
pkgver=4.2.2.1
pkgrel=5
pkgdesc='Litecoin wallet'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(
  libsecp256k1
  python-aiohttp
  python-aiohttp-socks
  python-aiorpcx
  python-bitstring
  python-certifi
  python-cryptography
  python-dnspython
  python-protobuf
  python-pyqt5
  python-qdarkstyle
  python-qrcode
  python-scrypt
  zbar
)
makedepends=(python-setuptools)
source=($url/download/Electrum-LTC-$pkgver.tar.gz{,.asc} 'libsecp256k1-new-versions.patch')
validpgpkeys=(CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA)

b2sums=('77a3f3969d435492216fa93afe48228bec1e3897d83eb5ebce5aee7088304ae54ceeeb030c6250a761a1f5c02abe554bc5e38c055b9979c1b390304a2f4a0966'
        'SKIP'
        '3ede7aaca7dc96a8de4a942de9eb0018abc56e5716c00259a1baa77393a6274b79b1f2524822a38209fda44e66efbe633bc56295f842687e4a12a53552c550b2')

prepare() {
  sed -i -r '/^#/,/^\[Desktop Entry\]$/{/^#|^$/d}; s/(Exec=).*(electrum.+%u).*/\1\2/' \
  Electrum-LTC-$pkgver/electrum-ltc.desktop
  patch -Np1 -d "Electrum-LTC-$pkgver" -i "${srcdir}/libsecp256k1-new-versions.patch"
}

build() {
  cd Electrum-LTC-$pkgver
  ./setup.py build
}

package() {
  cd Electrum-LTC-$pkgver
  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m 644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENCE
}
