# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_pkgname=fluffychat
pkgname=fluffychat-web
pkgver=0.31.3
pkgrel=1
pkgdesc="Chat with your friends"
arch=('any')
url="https://fluffychat.im/"
license=('AGPL3')
makedepends=('clang'
             'ninja'
             'cmake'
             'unzip'
    )
optdepends=('pantalaimon: used for E2E encryption')
provides=("$pkgname")
conflicts=("$pkgname")
source=(
    "https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_2.0.6-stable.tar.xz"
    "fluffychat-v${pkgver}.tar.gz::https://gitlab.com/famedly/fluffychat/-/archive/v${pkgver}/fluffychat-v${pkgver}.tar.gz"
)
sha256sums=('2523bc997fb16cefcf50f88a30d9dd5ce34e24a15e5eeb23a5caddfe5012ba80'
            'dd1f055ba005949cfd7be5d91cdd49c05df159d43f8e24c344c0f644d5c439be')
backup=(
    "etc/webapps/${_pkgname}/config.json"
)

prepare() {
  export PATH="${srcdir}/flutter/bin:$PATH"
  cd "fluffychat-v${pkgver}"
  ./scripts/prepare-web.sh
}

build() {
  export PATH="${srcdir}/flutter/bin:$PATH"
  cd "fluffychat-v${pkgver}"
  ./scripts/build-web.sh
}

package() {  
  cd "fluffychat-v${pkgver}"

  install -dm755 ${pkgdir}/usr/share/webapps
  mv build/web ${pkgdir}/usr/share/webapps/${_pkgname}
  install -Dm644 config.sample.json ${pkgdir}/etc/webapps/${_pkgname}/config.json
  ln -s /etc/webapps/${_pkgname}/config.json ${pkgdir}/usr/share/webapps/${_pkgname}
}

# vim: set sw=2 ts=2 et:
