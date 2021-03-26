# Maintainer: Christian Schendel <doppelhelix@gmail.com>
pkgbase=yaru-remix-git
pkgname=(yaru-remix-gtk-theme-git
         yaru-remix-gnome-shell-theme-git
         yaru-remix-icon-theme-git
         yaru-remix-wallpaper-git)
pkgver=r6.a1fdac60
pkgrel=4
epoch=1
pkgdesc="Yaru-remix is a fork of Yaru theme"
arch=(any)
url="https://github.com/Muqtxdir/${pkgbase%-git}"
license=('GPL3' 'LGPL3' 'LGPL2.1' 'CCPL:by-nc-sa')
makedepends=(meson sassc git)
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgbase%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson yaru-remix build
  meson configure build
  ninja -C build
}

_delete_all_from_pkgdir_except() {
  if [[ "$1" != "gtk-theme" ]]; then
    rm -r "${pkgdir}"/usr/share/themes/Yaru-remix-light/{metacity-*,gtk-*,index.theme}
    rm -r "${pkgdir}"/usr/share/themes/Yaru-remix-dark/{metacity-*,gtk-*,index.theme}
    rm -r "${pkgdir}"/usr/share/themes/Yaru-remix/{metacity-*,gtk-*,index.theme}
  fi
  if [[ "$1" != "gnome-shell-theme" ]]; then
    rm -r "${pkgdir}"/usr/share/themes/Yaru-remix/gnome-shell
    rm -r "${pkgdir}"/usr/share/themes/Yaru-remix-light/gnome-shell
    rm -r "${pkgdir}"/usr/share/themes/Yaru-remix-dark/gnome-shell
    rm -r "${pkgdir}"/usr/share/gnome-shell
  fi
  if [[ "$1" != "icon-theme" ]]; then
    rm -r "${pkgdir}"/usr/share/icons
  fi
  if [[ "$1" != "wallpaper" ]]; then
    rm -r "${pkgdir}"/usr/share/backgrounds
    rm -r "${pkgdir}"/usr/share/gnome-background-properties
  fi
  # Delete remaining empty directories:
  find "${pkgdir}" -type d -empty -delete
}

package_yaru-remix-gtk-theme-git() {
  pkgdesc="Yaru-remix gtk theme"  
  depends=(gtk3 gdk-pixbuf2 gtk-engine-murrine gnome-themes-extra)
  provides=(yaru-remix-gtk-theme)
  conflicts=(yaru-remix-gtk-theme-git)

  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "gtk-theme"
}

package_yaru-remix-gnome-shell-theme-git() {
  pkgdesc="Yaru-remix gnome shell theme"  
  depends=(gnome-shell)
  provides=(yaru-remix-gnome-shell-theme)
  conflicts=(yaru-remix-gnome-shell-theme)

  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "gnome-shell-theme"
}

package_yaru-remix-icon-theme-git() {
  pkgdesc="Yaru-remix icon theme"  
  depends=(hicolor-icon-theme gtk-update-icon-cache librsvg humanity-icon-theme)
  provides=(yaru-remix-icon-theme)
  conflicts=(yaru-remix-icon-theme)

  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "icon-theme"
}

package_yaru-remix-wallpaper-git() {
  pkgdesc="Yaru-remix wallpaper theme"  
  provides=(yaru-remix-wallpaper)
  conflicts=(yaru-remix-wallpaper)

  DESTDIR="$pkgdir" ninja -C build install 2>&1 >> install.log
  _delete_all_from_pkgdir_except "wallpaper"
}

