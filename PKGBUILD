# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lesma
pkgver=1.0.0
pkgrel=1
pkgdesc='A small and ultrasecure Lesspass database server written in Rust'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/lesma'
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
options=('!lto')
backup=("etc/${pkgname}.toml")
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.service")
b2sums=('541fc57da4ee24b6b4a53c1ffe2d218c0da4c42a7354dab33cf9810168f31f58da96329cc5b633e4e7d6509a9a79df012758fc47f162435a439c3e0a1b8347df'
        '6512f2d4fc6852cbcb96469890d15ab922d46eeeb6f25b234b074966f3a17b5748936fd5898a0e3c914b59f5b526595cff17f8abc856e58fb5cb4acd83ef2515')

build() {
  cd "${pkgbase}-${pkgver}"
  cargo build --release --locked --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgbase}-${pkgver}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # service
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  # conf
  install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/${pkgname}.toml.example" \
    "${pkgdir}/etc/${pkgname}.toml"
  # templates and static directories
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r "${srcdir}/${pkgbase}-${pkgver}/templates" \
    "${srcdir}/${pkgbase}-${pkgver}/static" \
    "${pkgdir}/usr/lib/${pkgname}"
}
