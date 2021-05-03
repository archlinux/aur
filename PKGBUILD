# Maintainer: drakkan <nicola.murino at gmail dot com>
# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgbase=yaru
pkgname=('yaru-sound-theme'
         'yaru-gtk-theme'
         'yaru-gtksourceview-theme'
         'yaru-gnome-shell-theme'
         'yaru-unity-theme'
         'yaru-metacity-theme'
         'yaru-icon-theme'
         'yaru-session')
pkgver=21.04.1
pkgrel=5
pkgdesc="Yaru default ubuntu theme"
arch=(any)
url="https://github.com/ubuntu/yaru"
license=('GPL3')

makedepends=('meson' 'sassc' 'git')
options=('!strip' '!buildflags' 'staticlibs')

_commit=d0c123036b0cd855102e1df3c24a946c223c1672
_shorthash=${_commit:0:7}
source=("https://github.com/ubuntu/yaru/archive/${_commit}.tar.gz")
sha256sums=('89528b139a97987d8189d36d8a84d6b85d38c4b2432e09ca9c4451cee88983ea')

build() {
  # Avoid very long filename that eCryptfs might choke on:
  mv $pkgbase-$_commit $pkgbase-$_shorthash
  arch-meson $pkgbase-$_shorthash build
  meson configure build -Dubuntu-unity=true
  ninja -C build
}

_delete_all_from_pkgdir_except() {
    if [[ "$1" != "sound-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/sounds
    fi
    if [[ "$1" != "gtk-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/themes/Yaru{,-light,-dark}/{gtk-*,index.theme}
    fi
    if [[ "$1" != "gtksourceview-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/gtksourceview-*
    fi
    if [[ "$1" != "gnome-shell-theme" ]]; then
        rm "${pkgdir}"/usr/share/themes/Yaru{,-light}/gnome-shell
        rm -r "${pkgdir}"/usr/share/gnome-shell/theme/Yaru{,-light}
    fi
    if [[ "$1" != "unity-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/themes/Yaru/unity
    fi
    if [[ "$1" != "metacity-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/themes/Yaru{,-light,-dark}/metacity-1
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
