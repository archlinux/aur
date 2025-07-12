# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>

pkgname=goldwarden-gui
_pkgname=${pkgname%-gui}
pkgver=0.3.6
pkgrel=1
pkgdesc='A feature-packed Bitwarden compatible desktop integration'
arch=('x86_64' 'aarch64')
url="https://github.com/quexten/$_pkgname"
license=('MIT')
depends=('goldwarden' 'python-tendo')
makedepends=('blueprint-compiler')
source=(
  "$_pkgname::git+$url#tag=v$pkgver"
  "fix-bin-name.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$_pkgname"
  patch --strip=1 < ../fix-bin-name.patch
}

build() {
  cd "$_pkgname"/gui
  blueprint-compiler batch-compile ./src/gui/.templates ./src/gui ./src/gui/*.blp
}

package() {
  cd "$_pkgname"/gui

  _app_dir=/usr/lib/${_pkgname}/gui

  mkdir -p "$pkgdir"/$_app_dir
  mkdir -p "$pkgdir"/usr/bin

  cp ./*.{py,css} -t "$pkgdir"/$_app_dir
  cp -R ./src -t "$pkgdir"/$_app_dir
  rm -rf "$pkgdir"/$_app_dir/src/gui/*.blp

  chmod +x "$pkgdir"/$_app_dir/goldwarden_ui_main.py
  ln -sf "$_app_dir"/goldwarden_ui_main.py "$pkgdir"/usr/bin/goldwarden-gui

  install -D ./com.quexten.Goldwarden.desktop "$pkgdir"/usr/share/applications/com.quexten.Goldwarden.desktop
  install -D ./com.quexten.Goldwarden.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/com.quexten.Goldwarden.svg
  install -Dm644 ./com.quexten.Goldwarden.metainfo.xml -t "$pkgdir"/usr/share/metainfo/
}
