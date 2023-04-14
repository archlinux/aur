# Maintainer: drakkan <nicola.murino at gmail dot com>
# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgbase=yaru
pkgname=('yaru-sound-theme'
         'yaru-gtk-theme'
         'yaru-gtksourceview-theme'
         'yaru-gnome-shell-theme'
         'yaru-xfwm4-theme'
         'yaru-unity-theme'
         'yaru-metacity-theme'
         'yaru-icon-theme'
         'yaru-session')
pkgver=23.04.4
pkgrel=1
pkgdesc="Yaru default ubuntu theme"
arch=(any)
url="https://github.com/ubuntu/yaru"
license=('GPL3')

makedepends=('meson' 'sassc' 'git')
options=('!strip' '!buildflags' 'staticlibs')

source=("https://github.com/ubuntu/yaru/archive/${pkgver}.tar.gz")
sha256sums=('be00296286426006851e2cdf63dfe8166439cdf2afa22d56035e449cc524412c')

build() {
  arch-meson $pkgbase-$pkgver build
  meson configure build -Dubuntu-unity=true -Dxfwm4=true
  ninja -C build
}

_delete_all_from_pkgdir_except() {
    if [[ "$1" != "sound-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/sounds
    fi
    if [[ "$1" != "gtk-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/themes/Yaru{,-*}/{gtk-*,index.theme}
    fi
    if [[ "$1" != "gtksourceview-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/gtksourceview-*
    fi
    if [[ "$1" != "gnome-shell-theme" ]]; then
        rm "${pkgdir}"/usr/share/themes/Yaru{,-*}/gnome-shell
        rm -r "${pkgdir}"/usr/share/gnome-shell/theme/Yaru{,-*}
    fi
    if [[ "$1" != "xfwm4-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/themes/Yaru{,-*}/xfwm4
    fi
    if [[ "$1" != "unity-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/themes/Yaru{,-*}/unity
    fi
    if [[ "$1" != "metacity-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/themes/Yaru{,-*}/metacity-1
    fi
    if [[ "$1" != "icon-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/icons
    fi
    if [[ "$1" != "session" ]]; then
        rm -r "${pkgdir}"/usr/share/{glib-2.0,xsessions,wayland-sessions}
        rm -r "${pkgdir}"/usr/share/gnome-shell/{extensions,modes}
    fi
    # Delete remaining empty directories:
    find "${pkgdir}" -type d -empty -delete
}

package_yaru-sound-theme() {
  pkgdesc="Yaru default ubuntu sound theme"

  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "sound-theme"
}

package_yaru-gtk-theme() {
  pkgdesc="Yaru default ubuntu gtk theme"  
  depends=("gtk3" "gdk-pixbuf2" "gtk-engine-murrine" "gnome-themes-extra")
  
  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "gtk-theme"
}

package_yaru-gtksourceview-theme() {
  pkgdesc="Yaru default ubuntu gtksourceview theme"
  
  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "gtksourceview-theme"
}

package_yaru-gnome-shell-theme() {
  pkgdesc="Yaru default ubuntu gnome shell theme"  
  depends=("gnome-shell")
  
  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "gnome-shell-theme"
}

package_yaru-xfwm4-theme() {
  pkgdesc="Yaru default ubuntu xfwm4 theme"  
  
  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "xfwm4-theme"
}

package_yaru-unity-theme() {
  pkgdesc="Yaru default ubuntu unity theme"
  
  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "unity-theme"
}

package_yaru-metacity-theme() {
  pkgdesc="Yaru default ubuntu metacity theme"
  depends=(metacity)

  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "metacity-theme"
}

package_yaru-icon-theme() {
  pkgdesc="Yaru default ubuntu icon theme"  
  depends=("hicolor-icon-theme" "gtk-update-icon-cache" "librsvg" "humanity-icon-theme")

  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "icon-theme"
}

package_yaru-session() {
  pkgdesc="Yaru session"
  depends=("gnome-shell" "yaru-gnome-shell-theme")

  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "session"
}


# vim: ts=2 sw=2 et:
