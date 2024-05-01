# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=savedesktop
_app_id=io.github.vikdevelop.SaveDesktop
pkgver=3.2.3
pkgrel=1
pkgdesc="Save and load KDE Plasma, Xfce and GNOME-based DE configuration"
arch=('any')
url="https://github.com/vikdevelop/SaveDesktop"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'libadwaita' 'python-dbus' 'python-gobject')
makedepends=('git')
_commit=6eb6a7da978d5264716c740b2c8f3387d8540fbf  # tags/3.2.3^0
source=("git+https://github.com/vikdevelop/SaveDesktop.git#commit=${_commit}"
        "$pkgname.sh"
        'directories.patch')
sha256sums=('c2064c76ab19162a7885e7b499e221fd6f4230019e746634b9f8b9afbd2d86d1'
            '2af6b49c1c166072fa3e0503e3f4b63e379d72d9b83b97f3f5dbf1a69383d79b'
            'd42f43417f54529f3db00c8888552f49ab4eab4e65defae46c49199fcbb6df37')

pkgver() {
  cd SaveDesktop
  git describe --tags | sed 's/-/+/g'
}

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
