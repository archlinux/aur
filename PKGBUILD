# Maintainer: Christian Bergschneider <christian.bergschneider@gmx.de>
# Maintainer: Georgios Tsotsos <geoxor123@outlook.com>
# Contributor: JeremyStarTM <jeremystartm@staropensource.de>

pkgname=amethyst-player-git
pkgver=v2.1.7.r662.gc1ec028
pkgrel=1
pkgdesc="Amethyst is an Electron-based cross-platform audio player with a node-based audio routing system."
arch=('x86_64' 'aarch64')
url="https://github.com/Geoxor/amethyst"
license=('MIT')
makedepends=('gcc-multilib' 'git' 'gendesk' 'yarn' 'libxcrypt-compat' 'node-gyp')
depends=('libvips')
source=("git+https://github.com/Geoxor/amethyst.git")
md5sums=('SKIP')

logo() {
  echo "    ___                   __  __               __ "
  echo "   /   |  ____ ___  ___  / /_/ /_  __  _______/ /_"
  echo "  / /| | / __ \`__ \\/ _ \\/ __/ __ \\/ / / / ___/ __/"
  echo " / ___ |/ / / / / /  __/ /_/ / / / /_/ (__  ) /_  "
  echo "/_/  |_/_/ /_/ /_/\\___/\\__/_/ /_/\\__, /____/\\__/  "
  echo "                                /____/"
}

pkgver() {
  cd "amethyst"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  logo
  cd "amethyst"
  gendesk -n -f --pkgname "amethyst" --pkgdesc "$pkgdesc" --exec="/opt/amethyst/amethyst"
  git submodule update --init --recursive
  yarn
}

build() {
  cd "amethyst"
  yarn build && yarn electron-builder --linux dir --publish never
}

package() {
  cd "amethyst"
  install -Dm644 "amethyst.desktop" "$pkgdir/usr/share/applications/amethyst.desktop"
  install -d "$pkgdir/opt/amethyst" && cp -r release/build/linux-unpacked/* "$pkgdir/opt/amethyst"
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/pixmaps/amethyst.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/amethyst"
}
