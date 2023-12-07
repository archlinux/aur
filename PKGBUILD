# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lesma
pkgver=1.2.0
pkgrel=1
pkgdesc='Simple paste app friendly with browser and command line written in Rust'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/lesma'
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
options=('!lto')
backup=("etc/${pkgname}.toml")
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.service")
b2sums=('838da47e6468e4d154059c72eea0c3cce9602345736cd362987497f75b43c1b99cf3e817f861c03e34e16086591a71b6047897f4b5057d2b95936586feb586d4'
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
