# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgbase=nymphcast-git
pkgname=(nymphcast-client-git nymphcast-server-git nymphcast-player-git)
pkgver=0.1.r49.g0a44614
pkgrel=1
pkgdesc="Audio and video casting system with support for custom applications."
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/MayaPosch/NymphCast"
license=(BSD)
makedepends=(git rapidjson nymphrpc libnymphcast sdl2 sdl2_image poco ffmpeg freetype2 freeimage qt5-base)
source=("git+https://github.com/MayaPosch/NymphCast.git")
sha256sums=('SKIP')

pkgver() {
  cd NymphCast
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/NymphCast/src/client"
  make

  cd "${srcdir}/NymphCast/src/server"
  make

  cd "${srcdir}/NymphCast/player/NymphCastPlayer"
  qmake
  make
}

package_nymphcast-client-git() {
 depends=(nymphrpc libnymphcast)
  cd NymphCast
  install -Dm755 src/client/bin/nymphcast_client -t "${pkgdir}/usr/bin"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_nymphcast-server-git() {
 depends=(nymphrpc libnymphcast sdl2 sdl2_image poco ffmpeg freetype2 freeimage)
  cd NymphCast
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -d "${pkgdir}/usr/share/nymphcast"
  install -Dm755 src/server/bin/$CARCH-pc-linux-gnu/nymphcast_server "${pkgdir}/usr/share/nymphcast"
  #install -Dm644 src/server/*.jpg "${pkgdir}/usr/share/nymphcast"
  install -Dm644 src/server/*.ini "${pkgdir}/usr/share/nymphcast"
  cp -r src/server/apps "${pkgdir}/usr/share/nymphcast"
}

package_nymphcast-player-git() {
 depends=(libnymphcast qt5-base)
  cd NymphCast
  install -Dm755 player/NymphCastPlayer/NymphCastPlayer -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}