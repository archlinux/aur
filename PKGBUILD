# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=rockpass
pkgver=0.1.0
pkgrel=1
pkgdesc='A small and ultrasecure Lesspass database server written in Rust'
arch=('any')
url='https://github.com/ogarcia/rockpass'
license=('GPL3')
makedepends=('rustup')
backup=("etc/${pkgname}.conf")
source=("https://github.com/ogarcia/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}.conf"
        "${pkgname}.service")
sha256sums=('0daca365828f15ec03ad129778f743720fbabad89a7aab3d1eb6271683135e09'
            '4e75fb9c5d5b396f4e4d8fe4064c1f1725595392c7bdec27d71bac022c7cbd67'
            '5175d4d689c8f9b63a4d1409ab48d4ec91e37120cec8c4be1f8ba871363be424')

prepare() {
  cd "${pkgbase}-${pkgver}"
  rustup override set nightly
}

build() {
  cd "${pkgbase}-${pkgver}"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgbase}-${pkgver}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # conf
  install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}.conf"
  # service
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
