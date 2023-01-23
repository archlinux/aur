# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lesma
pkgver=0.7.0
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
        "${pkgname}.toml"
        "${pkgname}.service")
b2sums=('4c325ca7364639289c7818b95d419150f82ea59fb800df10332e6cb311e1375f22d1fe00f13ccfd35138a3dbc793d04f4b5ac644f108a14a2edfac0c11abeab4'
        '669031b846b817a48e7aa621df34fbf85102e8da6ab58e77ab6ac4abbb77d3632933881116f256e49a22cff3ecd52712ce9e34f451cef778d8e61762ad3609d2'
        '6512f2d4fc6852cbcb96469890d15ab922d46eeeb6f25b234b074966f3a17b5748936fd5898a0e3c914b59f5b526595cff17f8abc856e58fb5cb4acd83ef2515')

build() {
  cd "${pkgbase}-${pkgver}"
  cargo build --release --locked --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgbase}-${pkgver}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # conf
  install -Dm644 "${srcdir}/${pkgname}.toml" "${pkgdir}/etc/${pkgname}.toml"
  # service
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  # templates and static directories
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r "${srcdir}/${pkgbase}-${pkgver}/templates" \
    "${srcdir}/${pkgbase}-${pkgver}/static" \
    "${pkgdir}/usr/lib/${pkgname}"
}
