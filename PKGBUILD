# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=opendiablo2-git
pkgver=r484.019bb92
pkgrel=2
pkgdesc='An open source re-implementation of Diablo 2'
arch=('i686' 'x86_64')
url='https://opendiablo2.com/'
license=('GPL3')
provides=('opendiablo2')
depends=('libxcursor'
		 'libxrandr'
		 'libxinerama'
		 'libxi'
		 'mesa'
		 'libglvnd'
		 'sdl2'
		 'sdl2_mixer'
		 'sdl2_net'
		 'alsa-lib')
makedepends=('go' 'git' 'gendesk')
install=post_install
source=("git+https://github.com/OpenDiablo2/OpenDiablo2"
		'post_install')
md5sums=('SKIP'
		 'f211fcc70802f4a96d081b1c19a6172e')

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
  gendesk -f -n --pkgname "opendiablo2" --pkgdesc "${pkgdesc}" --exec="opendiablo2" --categories=Game --icon opendiablo2
}

build() {
  cd "${srcdir}/OpenDiablo2"
  go build -v -o "../opendiablo2-bin"
}

package() {
  cd "${srcdir}"
  install -Dm644 OpenDiablo2/opendiablo2.desktop "${pkgdir}/usr/share/applications/opendiablo2.desktop"
  install -Dm755 opendiablo2-bin "${pkgdir}/usr/bin/opendiablo2"
  install -Dm644 OpenDiablo2/d2logo.png "${pkgdir}/usr/share/pixmaps/opendiablo2.png"
  install -Dm644 OpenDiablo2/LICENSE "${pkgdir}/usr/share/licenses/opendiablo2/LICENSE"
}