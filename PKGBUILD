# Maintainer: Christian Schendel <doppelhelix@gmail.com>
pkgbase=yaru-remix-git
pkgname=(yaru-remix-gtk-theme-git
         yaru-remix-gnome-shell-theme-git
         yaru-remix-icon-theme-git
         yaru-remix-wallpaper-git)
pkgver=20.10.1.r65.g23b4478a
pkgrel=2
pkgdesc="Yaru-remix is a fork of Yaru theme"
arch=(any)
url="https://github.com/Muqtxdir/${pkgbase%-git}"
license=('GPL3' 'LGPL3' 'LGPL2.1' 'CCPL:by-nc-sa')
makedepends=(meson sassc git)
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgbase%-git}::git+https://github.com/Muqtxdir/yaru-remix.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgbase%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson yaru-remix build
  meson configure build
  ninja -C build
}

_delete_all_from_pkgdir_except() {
  if [[ "$1" != "gtk-theme" ]]; then
    rm -r "${pkgdir}"/usr/share/themes/Yaru-remix-light/{gtk-*,index.theme}
    rm -r "${pkgdir}"/usr/share/themes/Yaru-remix-dark/{gtk-*,index.theme}
    rm -r "${pkgdir}"/usr/share/themes/Yaru-remix/{gtk-*,index.theme}
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

