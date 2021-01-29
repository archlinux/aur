# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_pkgname=fluffychat
pkgname=fluffychat-web
_gitname=${_pkgname}
pkgver=0.26.1
pkgrel=1
pkgdesc="Chat with your friends"
arch=('any')
url="https://fluffychat.im/"
license=('AGPL3')
makedepends=('clang'
             'ninja'
             'cmake')
optdepends=('pantalaimon: used for E2E encryption')
provides=("$pkgname")
conflicts=("$pkgname")
source=(
    "flutter.tar.xz::https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_1.22.6-stable.tar.xz"
    "fluffychat-v${pkgver}.tar.gz::https://gitlab.com/famedly/fluffychat/-/archive/v${pkgver}/fluffychat-v${pkgver}.tar.gz"
)
sha256sums=('282fc4b9c59a4e98c5e76a934ca804ea868f45b05c6255c85ee1065955dd7fa5'
            'fa4fd382351e4912ba1afb801f1bef4be76c5b59c5bd264776911d173d186403')
backup=(
    "etc/webapps/${_pkgname}/config.json"
)

prepare() {
  export PATH="${srcdir}/flutter/bin:$PATH"
  flutter channel beta
  flutter upgrade
  flutter config --enable-web
}

build() {
  export PATH="${srcdir}/flutter/bin:$PATH"

  cd ${_gitname}-v$pkgver
  
  ./scripts/prepare-web.sh
  flutter clean
  flutter pub get
  flutter build web --release --verbose
}

package() {  
  cd ${_gitname}-v$pkgver

  install -dm755 ${pkgdir}/usr/share/webapps
  mv build/web ${pkgdir}/usr/share/webapps/${_pkgname}
  install -Dm644 config.sample.json ${pkgdir}/etc/webapps/${_pkgname}/config.json
  ln -s /etc/webapps/${_pkgname}/config.json ${pkgdir}/usr/share/webapps/${_pkgname}
}

# vim: set sw=2 ts=2 et:
