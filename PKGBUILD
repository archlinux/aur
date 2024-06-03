# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Aloxaf <aloxafx at gamil>

pkgname=hiddify-next
pkgver=1.4.0
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
sha256sums=('29d97b5b6311f18c16a43e045982565edfd19372a8fa3b6dc7e5c5625c8cb110'
            'f5ea17d65166ee85605863bcf718d09c4b77bf324090bbb4771bbf7bd626987e')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed "s/VERSION_PLACEHOLDER/${pkgver}/" -i "${srcdir}/${pkgname}.desktop"

  fvm install 3.19.6
  export PATH="${PATH}:$(fvm global 3.19.6 --verbose | awk '/cacheVersion.binPath/ {print $2}')"

  flutter --disable-analytics
  make linux-prepare
}

build() {
  cd "${pkgname}-${pkgver}"
  flutter build linux --release
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
