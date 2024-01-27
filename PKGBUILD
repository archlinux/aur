# Maintainer: mpsijm
pkgname=browsers-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Open the right browser at the right time"
arch=("x86_64")
url="https://browsers.software"
license=("Apache" "MIT")
provides=("browsers=$pkgver")
conflicts=("browsers-git")
source=("https://github.com/Browsers-software/browsers/releases/download/$pkgver/browsers_linux.tar.xz")
sha256sums=("09a210cc27d935cc35a2c9917ff5ab9758840f7add453ec768ba81ff98887155")

package() {
  bsdtar -xf "$srcdir/browsers_linux.tar.xz" -C "$srcdir"

  # install.sh assumes it's installing in /usr/local, so replace paths by $pkgdir
  sed -Ei "s|=\"/usr(\/local)?|=\"$pkgdir\/usr|" "$srcdir/install.sh"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"

  XDG_DATA_DIRS="$pkgdir/usr/share" "$srcdir/install.sh" --system

  # It's nice that install.sh updates the mime database for us, but this should be updated in post_install
  rm "$pkgdir/usr/share/applications/mimeinfo.cache"

  # Similarly, install.sh thinks that the browsers binary is located in $pkgdir, so remove this prefix from the .desktop files
  sed -Ei "s|$pkgdir||" "$pkgdir/usr/share/applications/software.Browsers.desktop" "$pkgdir/usr/share/xfce4/helpers/software.Browsers.desktop"
}

# Thanks to https://bbs.archlinux.org/viewtopic.php?pid=1544072#p1544072
post_install() {
  xdg-icon-resource forceupdate --theme hicolor &>/dev/null
  update-mime-database usr/share/mime &>/dev/null
  update-desktop-database -q
}

post_upgrade() {
  post_install "$1"
}

post_remove() {
  post_install "$1"
}
