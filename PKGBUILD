# Maintainer: drakkan <nicola.murino at gmail dot com>
# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgbase=yaru
pkgname=('yaru-sound-theme' 'yaru-gtk-theme' 'yaru-gnome-shell-theme' 'yaru-unity-theme' 'yaru-icon-theme' 'yaru-session')
pkgver=20.04.4
pkgrel=2
pkgdesc="Yaru default ubuntu theme"
arch=(any)
url="https://github.com/ubuntu/yaru"
license=('GPL3')

makedepends=('meson' 'sassc' 'git')
options=('!strip' '!buildflags' 'staticlibs')

source=("https://github.com/ubuntu/yaru/archive/${pkgver}.tar.gz"
  "https://github.com/ubuntu/yaru/commit/16db0a3d2e256fa132c208658b1e8ffd068f49d2.patch"
  "https://github.com/ubuntu/yaru/commit/e4f9d0e312814ea3f364d80b7ab35a3b7c832cbf.patch")
sha256sums=('e34718c44f773d06c88fca1da852b6c0d8d72d9d6bcff3539869055059af6813'
  '0ec64f98dd22ddfa287ece97ff38a60b151c40443c5defdd3c4b664442076c67'
  '81c99f7250dba1e4c6f24d586c8d736e45adf4a52e7791ac9cb641f0ba7e7727')

prepare() {
  cd $pkgbase-$pkgver
  patch -Np1 -i "$srcdir/e4f9d0e312814ea3f364d80b7ab35a3b7c832cbf.patch"
  patch -Np1 -i "$srcdir/16db0a3d2e256fa132c208658b1e8ffd068f49d2.patch"
}

build() {
  arch-meson $pkgbase-$pkgver build
  ninja -C build
}

_delete_all_from_pkgdir_except() {
    if [[ "$1" != "sound-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/sounds
    fi
    if [[ "$1" != "gtk-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/themes/Yaru{-light,{,-dark}/{gtk-*,index.theme}}
    fi
    if [[ "$1" != "gnome-shell-theme" ]]; then
        rm "${pkgdir}"/usr/share/themes/Yaru{,-dark}/gnome-shell
        rm -r "${pkgdir}"/usr/share/gnome-shell/theme/Yaru{,-dark}
    fi
    if [[ "$1" != "unity-theme" ]]; then
        rm -r "${pkgdir}"/usr/share/themes/Yaru/unity
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
