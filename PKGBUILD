# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=scopebuddy-gui
_app_id="io.github.rfrench3.$pkgname"
pkgver=2.4.1
pkgrel=2
pkgdesc="Graphical Frontend for Scopebuddy"
arch=('any')
url="https://github.com/rfrench3/scopebuddy-gui"
license=('LGPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'pyside6'
  'python'
  'scopebuddy'
  'xdg-desktop-portal'
  'xdg-utils'
)
makedepends=('desktop-file-utils')
checkdepends=('appstream')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1b484669605c5e1243b4da552911f34e0485827b119c6ed9f540a194a8182f2')

prepare() {
  cd "$pkgname-$pkgver"

  # This is not a Flatpak
  find src/ -type f -exec sed -i 's|app/share|usr/share|g' {} \;
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "${_app_id}.metainfo.xml"
  desktop-file-validate "${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 src/main.py "$pkgdir/usr/bin/scopebuddygui"
  install -Dm644 src/*.{conf,py,ui} -t "$pkgdir/usr/share/scopebuddygui/"
  rm "$pkgdir/usr/share/scopebuddygui/main.py"
  install -Dm644 "src/img/${_app_id}.svg" -t "$pkgdir/usr/share/scopebuddygui/"

  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  ln -s "/usr/share/scopebuddygui/${_app_id}.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  ln -s /usr/share/scopebuddygui/default_scb.conf "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm644 "${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
}
