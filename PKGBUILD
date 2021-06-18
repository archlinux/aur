# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_pkgname=fluffychat
pkgname=fluffychat-web-git
pkgver=0.32.0.r3.gcb84e823
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
provides=("fluffychat-web")
conflicts=("fluffychat-web")
source=(
    "$_pkgname::git+https://gitlab.com/famedly/fluffychat.git"
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.2.2-stable.tar.xz"
)
sha256sums=('SKIP'
            'da1ebc597563b5d3e46d8fd5bb505cae645443c1b653d7b4fbed7c083f4d498a')
backup=(
    "etc/webapps/${_pkgname}/config.json"
)

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  ./scripts/prepare-web.sh
}

build() {
  export PATH="${srcdir}/flutter/bin:$PATH"
  cd "$_pkgname"
  ./scripts/build-web.sh
}

package() {  
  cd "$_pkgname"

  install -dm755 ${pkgdir}/usr/share/webapps
  mv build/web ${pkgdir}/usr/share/webapps/${_pkgname}
  install -Dm644 config.sample.json ${pkgdir}/etc/webapps/${_pkgname}/config.json
  ln -s /etc/webapps/${_pkgname}/config.json ${pkgdir}/usr/share/webapps/${_pkgname}
}

# vim: set sw=2 ts=2 et:
