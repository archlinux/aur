# Maintainer: garionion <garionion@entr0py.de>

_pkgname=fluffychat
pkgname=fluffychat-web
_gitname=${_pkgname}
pkgver=0.26.0
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
            '852d0a9ba862b8dca94f9f8cedc719d1e03405c1657174f3b9663feab0c47153')
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
