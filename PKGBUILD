# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=opendiablo2-git
pkgver=r486.515b667
pkgrel=1
pkgdesc='An open source re-implementation of Diablo 2'
arch=('i686' 'x86_64')
url='https://opendiablo2.com'
license=('GPL3')
provides=('opendiablo2')
depends=('libxrandr'
         'libxinerama'
         'libxi'
         'sdl2'
         'sdl2_mixer'
         'sdl2_net')
makedepends=('go' 'gendesk')
install=opendiablo2.install
source=("opendiablo2::git+https://github.com/OpenDiablo2/OpenDiablo2")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/OpenDiablo2"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/OpenDiablo2"
  mkdir -p build/
}

build() {
  cd "${srcdir}/OpenDiablo2"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  go build -o build ./...
  gendesk -f -n \
   --pkgname "opendiablo2" \
   --pkgdesc "${pkgdesc}" \
   --exec="opendiablo2" \
   --categories=Game \
   --icon opendiablo2
}

package() {
  cd "${srcdir}/OpenDiablo2"
  install -Dm644 opendiablo2.desktop "${pkgdir}/usr/share/applications/opendiablo2.desktop"
  install -Dm755 build/OpenDiablo2 "${pkgdir}/usr/bin/opendiablo2"
  install -Dm644 d2logo.png "${pkgdir}/usr/share/pixmaps/opendiablo2.png"
}