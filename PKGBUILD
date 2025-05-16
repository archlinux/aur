# Maintainer: Christian Bergschneider <christian.bergschneider@gmx.de>
# Maintainer: Georgios Tsotsos <geoxor123@outlook.com>
appname=amethyst
pkgname=$appname-player
pkgver=2.1.3
pkgrel=1
pkgdesc="A cross-platform music player made with Typescript "
arch=('x86_64')
url="https://github.com/Geoxor/$appname"
license=('MIT')
makedepends=('gcc-multilib' 'git' 'gendesk' 'yarn' 'libxcrypt-compat')
depends=('libvips')
source=("git+https://github.com/Geoxor/$appname/#tag=v$pkgver")
md5sums=('SKIP')

logo() {
  echo "    ___                   __  __               __ "
  echo "   /   |  ____ ___  ___  / /_/ /_  __  _______/ /_"
  echo "  / /| | / __ \`__ \\/ _ \\/ __/ __ \\/ / / / ___/ __/"
  echo " / ___ |/ / / / / /  __/ /_/ / / / /_/ (__  ) /_  "
  echo "/_/  |_/_/ /_/ /_/\\___/\\__/_/ /_/\\__, /____/\\__/  "
  echo "                                /____/"
}

prepare() {
  logo
  cd "$appname"
  gendesk -n -f --pkgname "$appname" --pkgdesc "$pkgdesc" --exec="/opt/$appname/$appname"
  git submodule update --init --recursive
  yarn
}

build() {
  cd "$appname"
  yarn cap telemetry off
  yarn build && yarn electron-builder --linux dir --publish never
}

package() {
  cd "$appname"
  install -Dm644 "$appname.desktop" "$pkgdir/usr/share/applications/$appname.desktop"
  install -d "$pkgdir/opt/$appname" && cp -r release/build/linux-unpacked/* "$pkgdir/opt/$appname"
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/pixmaps/$appname.svg"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$appname"
}
