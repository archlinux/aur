# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=savedesktop
_app_id=io.github.vikdevelop.SaveDesktop
pkgver=2.9.9.1
pkgrel=1
pkgdesc="Save and load KDE Plasma, Xfce and GNOME-based DE configuration"
arch=('any')
url="https://github.com/vikdevelop/SaveDesktop"
license=('GPL3')
depends=('hicolor-icon-theme' 'libadwaita' 'python-dbus' 'python-gobject')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}j.tar.gz"
        "$pkgname.sh")
sha256sums=('86c0e323082dbb9494286e8cfaf7d27cc638460eaad7cc0ca556844c4f087976'
            '960f2fab77071b4ee1d6c62edb7ab3d2f39efe1db21a136bc43eeef5bfc9a497')

prepare() {
  cd "SaveDesktop-${pkgver}j"

  # Desktop file Exec path
  desktop-file-edit --set-key=Exec --set-value="$pkgname" "flatpak/${_app_id}.desktop"

  # Correct version
  sed -i "s/2.9.9/$pkgver/g" src/localization.py
}

check() {
  cd "SaveDesktop-${pkgver}j"
  appstream-util validate-relax --nonet "flatpak/${_app_id}.metainfo.xml"
  desktop-file-validate "flatpak/${_app_id}.desktop"
}

package() {
  cd "SaveDesktop-${pkgver}j"
  install -d "$pkgdir/usr/share/$pkgname"
  cp -R src/* translations "$pkgdir/usr/share/$pkgname"
  install -Dm644 "flatpak/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "flatpak/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "flatpak/${_app_id}.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 "flatpak/icons/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "flatpak/icons/${_app_id}-symbolic.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
  install -Dm644 flatpak/symbolic-icons/desktop-symbolic.svg -t \
     "$pkgdir/usr/share/icons/hicolor/symbolic/actions/"
  install -Dm644 flatpak/symbolic-icons/exclamation_mark.png -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/actions/"
  install -Dm644 flatpak/symbolic-icons/list-view.png -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/actions/"
  install -Dm644 flatpak/symbolic-icons/preferences-system-symbolic.svg -t \
     "$pkgdir/usr/share/icons/hicolor/symbolic/actions/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
