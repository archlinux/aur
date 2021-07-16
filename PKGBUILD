# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_pkgname=fluffychat
pkgname=fluffychat-web
pkgver=0.34.1
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
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.2.2-stable.tar.xz"
    "fluffychat-v${pkgver}.tar.gz::https://gitlab.com/famedly/fluffychat/-/archive/v${pkgver}/fluffychat-v${pkgver}.tar.gz"
)
sha256sums=('da1ebc597563b5d3e46d8fd5bb505cae645443c1b653d7b4fbed7c083f4d498a'
            'e819e8cf60bff1315404ba76c2144b495a0aa02d4e10b2171b0e6e7733937f4d')
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
  sed -i '/base href=/d' ${pkgdir}/usr/share/webapps/${_pkgname}/index.html
}

# vim: set sw=2 ts=2 et:
