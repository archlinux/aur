# Maintainer: haxibami <contact at haxibami dot net>

pkgname=ibus-akaza
pkgdesc="Yet another Japanese IME for IBus/Linux"
pkgver=0.2.0
pkgrel=1
arch=('x86_64')
url="https://github.com/tokuhirom/akaza"
license=('MIT')
depends=('ibus' 'python-marisa' 'gtk4')
optdepends=('akaza-default-model: official provided model & dictionary')
makedepends=('cargo')
source=("https://github.com/tokuhirom/akaza/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('366b4e1d61d0277d9fc6f8e4c38c5b62d9b10d38d33c8c234d46c35f5169cd2c')

prepare() {
  cd "${srcdir}/akaza-${pkgver}"
  sed -i "s|\$(DATADIR)|\$(DESTDIR)/\$(DATADIR)|" Makefile
  sed -i "s|0644 ../target/release/ibus-akaza \$(PREFIX)/bin/|0755 ../target/release/ibus-akaza \$(DESTDIR)\$(PREFIX)/bin/|" \
    ibus-akaza/Makefile
}

build() {
  cd "${srcdir}/akaza-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr
}

package() {
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 "${srcdir}/akaza-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/share/ibus-akaza"
  install -dm755 "${pkgdir}/usr/share/ibus/component"

  cd "${srcdir}/akaza-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
