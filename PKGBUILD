# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit=a1b4f5d1a108498fb010305d7377a81d00a873c7
pkgname=cups-rastertotspl
pkgver=2026.06.27
pkgrel=1
pkgdesc='CUPS filter for TSPL printers '
arch=('x86_64' 'aarch64')
url='https://github.com/ogarcia/rucio'
license=('MPL-2.0')
depends=('cups')
makedepends=('cargo' 'clang' 'git' 'rust')
#options=('!lto')
source=("${pkgname}-${pkgver}::git+https://github.com/ogarcia/rastertotspl.git#commit=${_commit}")
b2sums=('7c78d5ad7a3589811508d1bc633b779f44114007e289c67a04054677c8c0c5dfd0319b2e0e145824e3d68e1754032bff879970460bed5b30e6c7bff74d9d4a68')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --locked --release
}

package() {
  # filter
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/rastertotspl" \
    "${pkgdir}/usr/lib/cups/filter/rastertotspl"
  # ppd
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/ppd/PM240.ppd" \
    "${pkgdir}/usr/share/cups/model/PM240.ppd"
  # license
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
