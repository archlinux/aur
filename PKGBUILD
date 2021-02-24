# Maintainer: robertfoster
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=opendiablo2-git
pkgver=r1287.d5d93df7
pkgrel=1
pkgdesc='An open source re-implementation of Diablo 2'
arch=('i686' 'x86_64')
url='https://opendiablo2.com'
license=('GPL3')
provides=('opendiablo2')
depends=(
  'alsa-lib'
  'libglvnd'
  'libx11'
  'libxau'
  'libxcb'
  'libxdmcp'
)
makedepends=('go' 'gendesk')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+https://github.com/OpenDiablo2/OpenDiablo2")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  mkdir -p build/
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go build

  gendesk -f -n \
    --pkgname "${pkgname%-git}" \
    --pkgdesc "${pkgdesc}" \
    --exec="${pkgname%-git}" \
    --categories=Game \
    --icon "${pkgname%-git}"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm644 "${pkgname%-git}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
  install -Dm755 OpenDiablo2 \
    "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 d2logo.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
}
