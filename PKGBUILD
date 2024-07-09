# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Aloxaf <aloxafx at gamil>

pkgname=hiddify-next
pkgver=1.5.0
pkgrel=1
pkgdesc="Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH, etc."
arch=('x86_64')
url="https://github.com/hiddify/hiddify-next"
license=('CC-BY-NC-SA-4.0')
depends=('at-spi2-core'
         'fontconfig'
         'gcc-libs'
         'glib2'
         'glibc'
         'gtk3'
         'libayatana-appindicator'
         'libepoxy'
         'pango')
makedepends=('clang' 'cmake' 'fvm' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('8fee65c4368155f2aeefc93ac8049acb0e37d4aaab8c53d1f7743fcccbedd6f6'
            'fcbf5df6388ebe23f3adb2abe55a61f7eecb7ff5f1731892d3791b7d41142b32')

prepare() {
  cd "${pkgname}-${pkgver}"
  fvm install 3.19.6
  export PATH="${PATH}:$(fvm global 3.19.6 --verbose | awk '/cacheVersion.binPath/ {print $2}')"

  fvm flutter --disable-analytics
  make linux-prepare
}

build() {
  cd "${pkgname}-${pkgver}"
  fvm flutter build linux --release --target=lib/main_prod.dart
}

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r build/linux/x64/release/bundle/* "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/hiddify" "${pkgdir}/usr/bin/hiddify"

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/hiddify.desktop"
  install -Dm644 assets/images/logo.svg "${pkgdir}/usr/share/pixmaps/hiddify.svg"
}
