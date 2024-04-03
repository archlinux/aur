# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_pkgname=fluffychat
pkgname=fluffychat-web-git
pkgver=rc1.18.0.2.r97.g9a8f604f
pkgrel=1
pkgdesc="Chat with your friends"
arch=('any')
url="https://fluffychat.im/"
license=('AGPL3')
makedepends=(
    'git'
    'clang'
    'ninja'
    'cmake'
    'unzip'
    'yq'
    'flutter'
)
optdepends=('pantalaimon: used for E2E encryption')
provides=("fluffychat-web")
conflicts=("fluffychat-web")
source=(
    "$_pkgname::git+https://github.com/krille-chan/fluffychat.git"
)
sha256sums=('SKIP')
backup=(
    "etc/webapps/${_pkgname}/config.json"
)

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

    rm -rf assets/js/package

    OLM_VERSION=$(cat pubspec.yaml | yq -r .dependencies.flutter_olm)
    DOWNLOAD_PATH="https://github.com/famedly/olm/releases/download/v$OLM_VERSION/olm.zip"

    cd assets/js/ && curl -L $DOWNLOAD_PATH > olm.zip && cd ../../
    cd assets/js/ && unzip olm.zip && cd ../../
    cd assets/js/ && rm olm.zip && cd ../../
    cd assets/js/ && mv javascript package && cd ../../
}

build() {
  cd "$_pkgname"
  flutter build web --release
}

package() {  
  cd "$_pkgname"

  install -dm755 ${pkgdir}/usr/share/webapps
  mv build/web ${pkgdir}/usr/share/webapps/${_pkgname}
  install -Dm644 config.sample.json ${pkgdir}/etc/webapps/${_pkgname}/config.json
  ln -s /etc/webapps/${_pkgname}/config.json ${pkgdir}/usr/share/webapps/${_pkgname}
  sed -i '/base href=/d' ${pkgdir}/usr/share/webapps/${_pkgname}/index.html
}

# vim: set sw=2 ts=2 et:
