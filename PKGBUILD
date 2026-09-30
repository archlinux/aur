pkgname=throne-sysqt-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box) not pack the Qt libraries"
arch=('x86_64' 'aarch64')
url="https://github.com/throneproj/Throne"
license=('GPL-3.0-only')
conflicts=(throne throne-git throne-bin nekoray-mahdi-zarei-bin)
depends=('glibc' 'qt6-base' 'libx11' 'hicolor-icon-theme')
options=(!debug)
_appver=${pkgver/[a-z]/-&}
source=(Throne.{desktop,sh})
source_x86_64=(throne-$_appver-debian-system-qt-x64.deb::$url/releases/download/$_appver/Throne-$_appver-debian-amd64-system-qt.deb
)
source_aarch64=(
  throne-$_appver-debian-system-qt-arm64.deb::$url/releases/download/$_appver/Throne-$_appver-debian-arm64-system-qt.deb
)
sha256sums=('1d7019ed30127fb3c7219016ed9e08bdc4809c65af13d2b02e59eed87a69082d'
            'ba44fe899a7ae34474a497a797299587d1e286e7a574578804083220caefe1bb')
sha256sums_x86_64=('46dd3de36654f273dbecc8485f9846c7668d5d5d9393f5c413ed3a0ae3eaf00d')
sha256sums_aarch64=('ffc4798fd8b81b11bb8fdb53ac8a5957b3b51fbcf2c451ca50a65a5728193bbe')

prepare() {
  cd "$srcdir"
  mkdir -p deb

  case "$CARCH" in
    x86_64) pkg=throne-$_appver-debian-system-qt-x64.deb ;;
    aarch64) pkg=throne-$_appver-debian-system-qt-arm64.deb ;;
  esac

  bsdtar -xf "$pkg" -C deb
  bsdtar -xf deb/data.tar.* -C "$srcdir"
}

package() {
  install -Dm755 "$srcdir/opt/Throne/Throne" "$pkgdir/opt/Throne/Throne"
  install -Dm755 "$srcdir/opt/Throne/ThroneCore" "$pkgdir/opt/Throne/ThroneCore"

  for f in $(find "$srcdir"/Throne/usr -type f -printf "%P\n"); do
    install -Dm644 "$srcdir"/Throne/usr/$f -T "$pkgdir"/opt/Throne/usr/$f
  done

  install -Dm755 "$srcdir"/Throne.sh         -T "$pkgdir"/usr/bin/throne
  install -Dm644 "$srcdir"/Throne.desktop    -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/opt/Throne/Throne.png -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
}

