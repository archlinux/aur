pkgname=throne-sysqt-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Cross-platform GUI proxy utility (Empowered by sing-box) not pack the Qt libraries"
arch=('x86_64')
url="https://github.com/throneproj/Throne"
license=('GPL-3.0-only')
conflicts=(throne throne-git throne-bin nekoray-mahdi-zarei-bin)
depends=('glibc' 'qt6-base' 'libx11' 'hicolor-icon-theme')
options=(!debug)
_appver=${pkgver/[a-z]/-&}
source=(Throne.{desktop,sh})
source_x86_64=(throne-$_appver-debian-system-qt-x64.deb::$url/releases/download/$_appver/Throne-$_appver-debian-amd64-system-qt.deb
)
sha256sums=('1d7019ed30127fb3c7219016ed9e08bdc4809c65af13d2b02e59eed87a69082d'
            'ba44fe899a7ae34474a497a797299587d1e286e7a574578804083220caefe1bb')
sha256sums_x86_64=('a4039a4017f37188f15726ebb78d1aaba04c4ee01f9463894d5f07143ab83b1a')

prepare() {
  cd "$srcdir"

  mkdir -p deb
  bsdtar -xf throne-$_appver-debian-system-qt-x64.deb -C deb
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

