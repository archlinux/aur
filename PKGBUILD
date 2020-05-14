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
makedepends=('go-pie' 'gendesk')
install=post_install
source=("git+https://github.com/OpenDiablo2/OpenDiablo2")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/OpenDiablo2"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/OpenDiablo2"
  mkdir -p $srcdir/go
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go get -d -v ./...
}

build() {
  cd "${srcdir}/OpenDiablo2"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o "../opendiablo2-bin"
  gendesk -f -n --pkgname "opendiablo2" --pkgdesc "${pkgdesc}" --exec="opendiablo2" --categories=Game --icon opendiablo2
}

package() {
  cd "${srcdir}"
  install -Dm644 OpenDiablo2/opendiablo2.desktop "${pkgdir}/usr/share/applications/opendiablo2.desktop"
  install -Dm755 opendiablo2-bin "${pkgdir}/usr/bin/opendiablo2"
  install -Dm644 OpenDiablo2/d2logo.png "${pkgdir}/usr/share/pixmaps/opendiablo2.png"
  go clean -modcache #Remove go libraries
}