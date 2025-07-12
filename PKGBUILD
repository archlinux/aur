# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=savedesktop
_app_id=io.github.vikdevelop.SaveDesktop
pkgver=3.6.1
pkgrel=1
pkgdesc="Save and load KDE Plasma, Xfce and GNOME-based DE configuration"
arch=('any')
url="https://github.com/vikdevelop/SaveDesktop"
license=('GPL-3.0-or-later')
depends=(
  '7zip'
  'dconf'
  'hicolor-icon-theme'
  'libadwaita'
  'python-dbus'
  'python-gobject'
)
makedepends=('git')
_commit=fa114b21c92baa04ae4ba45ea6c3e54738e14456  # tags/3.6.1^0
source=("git+https://github.com/vikdevelop/SaveDesktop.git#commit=${_commit}"
        "$pkgname.sh")
sha256sums=('ccbc1ce5c2eba00b5bb094249094dd2e8a707b72d2bee3f089f9fccae6414ccc'
            '69571f87e5eb4754c9b35c62d0311b1bf0e040cf79d5478a050d46efb1a4809a')

prepare() {
  cd SaveDesktop

  # Use system directories
  sed -i -e 's|{home}/.local/share/savedesktop|/usr/share/savedesktop|g; s|{Path.home()}/.local/share/savedesktop|/usr/share/savedesktop|g' \
    src/localization.py \
    savedesktop
}

check() {
  cd SaveDesktop
  appstreamcli validate --no-net "flatpak/${_app_id}.metainfo.xml"
  desktop-file-validate "flatpak/${_app_id}.desktop"
}

package() {
  cd SaveDesktop
  install -Dm755 "$pkgname" -t "$pkgdir/usr/share/$pkgname/src/"
  cp -R src translations "$pkgdir/usr/share/$pkgname"
  install -Dm644 "flatpak/${_app_id}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "flatpak/${_app_id}.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -Dm644 "flatpak/${_app_id}.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas/"
  install -Dm644 "flatpak/icons/${_app_id}.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "flatpak/icons/${_app_id}-symbolic.svg" -t \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
  install -Dm644 flatpak/symbolic-icons/*.{svg,png} -t \
     "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
