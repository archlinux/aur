# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_pkgname=fluffychat
pkgname=fluffychat-web
pkgver=1.5.0
pkgrel=1
pkgdesc="Chat with your friends"
arch=('any')
url="https://fluffychat.im/"
license=('AGPL3')
depends=()
makedepends=(
    'clang'
    'ninja'
    'cmake'
    'unzip'
    'flutter'
)
optdepends=('pantalaimon: used for E2E encryption')
provides=("$pkgname")
conflicts=("$pkgname")
source=(
    "fluffychat-v${pkgver}.tar.gz::https://gitlab.com/famedly/fluffychat/-/archive/v${pkgver}/fluffychat-v${pkgver}.tar.gz"
)
sha256sums=('f71cacae90ca6f1e5748619208dd277eaba81cf401cd4542dfce5f364b505b3a')
backup=(
    "etc/webapps/${_pkgname}/config.json"
)

prepare() {
  cd "fluffychat-v${pkgver}"
  ./scripts/prepare-web.sh
}

build() {
  cd "fluffychat-v${pkgver}"
  ./scripts/build-web.sh
}

package() {  
  cd "fluffychat-v${pkgver}"

  install -dm755 ${pkgdir}/usr/share/webapps
  mv build/web ${pkgdir}/usr/share/webapps/${_pkgname}
  install -Dm644 config.sample.json ${pkgdir}/etc/webapps/${_pkgname}/config.json
  ln -s /etc/webapps/${_pkgname}/config.json ${pkgdir}/usr/share/webapps/${_pkgname}
  sed -i '/base href=/d' ${pkgdir}/usr/share/webapps/${_pkgname}/index.html
}

# vim: set sw=2 ts=2 et:
