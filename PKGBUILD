# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=savedesktop
_app_id=io.github.vikdevelop.SaveDesktop
pkgver=3.3.2
pkgrel=2
pkgdesc="Save and load KDE Plasma, Xfce and GNOME-based DE configuration"
arch=('any')
url="https://github.com/vikdevelop/SaveDesktop"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'libadwaita' 'python-dbus' 'python-gobject')
makedepends=('git')
_commit=ed2b8614142db15ef8db79c368957fd1927a7c1c  # tags/3.3.2b^0
source=("git+https://github.com/vikdevelop/SaveDesktop.git#commit=${_commit}"
        "$pkgname.sh"
        'directories.patch')
sha256sums=('0456cc8330c93bf8caeafbfdb3d1ce94a9147200c4c0c1c015b8e3d8d53dd866'
            '876d67efbc57115f2d6d6558308ad19ed300ff2ad853e3a38fbfd710c25e8dcd'
            'd42f43417f54529f3db00c8888552f49ab4eab4e65defae46c49199fcbb6df37')

prepare() {
  cd SaveDesktop

  # Desktop file Exec path
  desktop-file-edit --set-key=Exec --set-value="$pkgname" "flatpak/${_app_id}.desktop"

  # Use system directories
  patch -Np1 -i ../directories.patch
}

check() {
  cd SaveDesktop
  appstreamcli validate --no-net "flatpak/${_app_id}.metainfo.xml"
  desktop-file-validate "flatpak/${_app_id}.desktop"
}

package() {
  cd SaveDesktop
  install -d "$pkgdir/usr/share/$pkgname"
  cp -R src translations "$pkgdir/usr/share/$pkgname"
  install -Dm644 "flatpak/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "flatpak/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "flatpak/${_app_id}.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 "flatpak/icons/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "flatpak/icons/${_app_id}-symbolic.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
  install -Dm644 flatpak/symbolic-icons/*.{svg,png} -t \
     "$pkgdir/usr/share/icons/hicolor/symbolic/actions/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
