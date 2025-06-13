# Maintainer: Root-Core <aur at root-core dot net>
pkgname=easylpac
pkgver=0.7.8.3
pkgrel=1
pkgdesc="lpac GUI Frontend"
arch=('x86_64')
url="https://github.com/creamlike1024/EasyLPAC"
license=('MIT')
makedepends=('go')
depends=('lpac')
provides=("easylpac")
conflicts=("easylpac")
source=(
  easylpac-$pkgver.tar.gz::https://github.com/creamlike1024/EasyLPAC/archive/refs/tags/$pkgver.tar.gz
)
sha256sums=('cbfc36591724a6445203d27240b59ea93ac7a0de3915609637cc8c5484abaaf2')

build() {
  cd $srcdir/EasyLPAC-$pkgver
  VERSION=$(grep 'Version' FyneApp.toml | sed 's/Version = "\(.*\)"/\1/' | xargs)
  DATE=$(TZ=Asia/Shanghai date +"%Y-%m-%d")
  sed -i "s/const Version = \"development\"/const Version = \"$VERSION\"/" main.go
  sed -i "s/const EUICCDataVersion = \"unknown\"/const EUICCDataVersion = \"$DATE\"/" main.go
  go generate
  go run fyne.io/fyne/v2/cmd/fyne@latest package --icon assets/icon128.png --release
}

package() {
  cd $srcdir/EasyLPAC-$pkgver
  tar xf EasyLPAC.tar.xz
  install -Dm644 usr/local/share/applications/EasyLPAC.desktop $pkgdir/usr/share/applications/EasyLPAC.desktop
  install -Dm755 usr/local/bin/EasyLPAC $pkgdir/usr/bin/EasyLPAC
  install -Dm644 usr/local/share/pixmaps/EasyLPAC.png $pkgdir/usr/share/pixmaps/EasyLPAC.png
}
