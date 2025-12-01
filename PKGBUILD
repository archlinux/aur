# Maintainer: Hildigerr Vergaray <Maintainer at YmirSystems dot com>
# Contributor: Mike Pento <mjpento@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: jlvsimoes <jlvsimoes@oninet.pt>
# Contributor: kevin <kevin@archlinux.org>

pkgname=abuse-git
_pkgname=abuse
pkgver=2025.1.0
pkgrel=1
pkgdesc='Side-scroller action game that pits you against ruthless alien killers'
arch=(x86_64)
url='http://abuse.zoy.org/'
license=(custom GPL)
depends=('libglvnd' 'sdl2_mixer')
provides=("abuse")
conflicts=("abuse")
makedepends=('gendesk' 'glu' 'mesa' 'cmake' 'git')
source=("${_pkgname}::git+https://github.com/apancik/Abuse_2025")
b2sums=(SKIP)

pkgver() {
  local version=$(grep '"version":' "abuse/vcpkg.json" | \
    sed -E 's/.*"([0-9]+\.[0-9]+\.[0-9]+)".*/\1/')
  printf '%s' "${version//-/.}"
}

prepare() {
  cd abuse/data
  sed -i 's|com.github.Xenoveritas.||' freedesktop/com.github.Xenoveritas.abuse.desktop
  sed -i 's|ArcadeGame;||' freedesktop/com.github.Xenoveritas.abuse.desktop
}

build() {
  cd abuse
  cmake -DCMAKE_INSTALL_PREFIX=/usr/share/games/abuse .
  make
}

package() {
  cd abuse

  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/share/games/abuse/bin" "$pkgdir/usr/bin"

  # Desktop shortcut and icon
  install -Dm644 data/freedesktop/com.github.Xenoveritas.abuse.desktop \
    "$pkgdir/usr/share/applications/com.dot.crack.$_pkgname.desktop"
  install -Dm644 doc/$_pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
}
