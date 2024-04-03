# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>
# flutter in embedded here, as fluffychat do not support automatically fresher version of it.

_pkgname=fluffychat
pkgname=fluffychat-web
pkgver=1.19.0
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
    'yq'
    'flutter'
)
optdepends=('pantalaimon: used for E2E encryption')
provides=("$pkgname")
conflicts=("$pkgname")
source=(
    "fluffychat-v${pkgver}.tar.gz::https://github.com/krille-chan/fluffychat/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('0fb007f2ed56ee46115606dae5eb2bb9eac238c344caae8d478eb80d71e6295f')
backup=(
    "etc/webapps/${_pkgname}/config.json"
)

prepare() {
  cd "fluffychat-${pkgver}"
  rm -rf assets/js/package

  OLM_VERSION=$(cat pubspec.yaml | yq -r .dependencies.flutter_olm)
  DOWNLOAD_PATH="https://github.com/famedly/olm/releases/download/v$OLM_VERSION/olm.zip"

  cd assets/js/ && curl -L $DOWNLOAD_PATH > olm.zip && cd ../../
  cd assets/js/ && unzip olm.zip && cd ../../
  cd assets/js/ && rm olm.zip && cd ../../
  cd assets/js/ && mv javascript package && cd ../../
}

build() {
  cd "fluffychat-${pkgver}"
  flutter build web --release
}

package() {  
  cd "fluffychat-${pkgver}"

  install -dm755 ${pkgdir}/usr/share/webapps
  cp -r build/web ${pkgdir}/usr/share/webapps/${_pkgname}
  install -Dm644 config.sample.json ${pkgdir}/etc/webapps/${_pkgname}/config.json
  ln -s /etc/webapps/${_pkgname}/config.json ${pkgdir}/usr/share/webapps/${_pkgname}
  sed -i '/base href=/d' ${pkgdir}/usr/share/webapps/${_pkgname}/index.html
}

# vim: set sw=2 ts=2 et:
