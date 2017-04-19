# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=signal-muon
pkgver=0.1.0
pkgrel=0.1
license=("MPL-2.0")
pkgdesc="Signal Private Messenger for the Desktop using Muon instead of Chrome"
depends=()
makedepends=("npm")
arch=("i686" "x86_64")
url="https://github.com/diracdeltas/signal-muon"
conflicts=(${pkgname}-git)
source=("https://github.com/diracdeltas/${pkgname}/archive/${pkgver}.tar.gz"
        "signal-muon.desktop")
sha256sums=("64d286a4f493bbca0f2fbd70263edc950d93e28601ab0d3ea905383f4679ceeb"
            "f799040368973ee28fff00d659fa64ab56638d69795741ba51a90f11f09b5e98")

prepare() {
  cd "${pkgname}-${pkgver}"
  # TODO: fetch diracdeltas' fork of Signal-Desktop?
  npm install
}

build() {
  cd "${pkgname}-${pkgver}"
  npm run build
}

package() {
  install -Dm644 ${pkgname}.desktop \
      "${pkgdir}"/usr/share/applications/${pkgname}.desktop

  cd "${pkgname}-${pkgver}"

  install -Ddm755 "${pkgdir}/usr/lib/${pkgname}"
  install -Ddm755 "${pkgdir}/usr/bin"

  cp -r Signal-linux-*/* "${pkgdir}/usr/lib/${pkgname}/"

  install -dm755 "${pkgdir}"/usr/share/icons/hicolor/256x256/apps
  cp img/icon.png \
      "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/${pkgname}.png

  echo -e "#!/usr/bin/env sh\nexec /usr/lib/${pkgname}/signal --no-sandbox -- "'"$@"' > "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
