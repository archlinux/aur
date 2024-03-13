# Maintainer: mpsijm
pkgname=browsers-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="Open the right browser at the right time"
arch=("x86_64")
url="https://browsers.software"
license=("Apache" "MIT")
provides=("browsers=$pkgver")
conflicts=("browsers-git")
# Make source file name unique: https://wiki.archlinux.org/title/PKGBUILD#source
source=("browsers_linux-$pkgver.tar.xz::https://github.com/Browsers-software/browsers/releases/download/$pkgver/browsers_linux.tar.xz")
sha256sums=("c64c4bd5f0f0e1119e9a37a6e0a51b1033711363c365fd43dd4514f15598119b")

package() {
  bsdtar -xf "$srcdir/browsers_linux-$pkgver.tar.xz" -C "$srcdir"

  # install.sh assumes it's installing in /usr/local, so replace paths by $pkgdir/usr
  sed -Ei "s|=\"/usr(\/local)?|=\"$pkgdir\/usr|" "$srcdir/install.sh"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"

  # Run install.sh with updated root and --skip-desktop-database.
  # Since install.sh would (by default) update the mime database, this would generate conflicts in mimeinfo.cache,
  # so we move this to the post_install() instead. See https://github.com/Browsers-software/browsers/pull/129#issuecomment-1919579765
  XDG_DATA_DIRS="$pkgdir/usr/share" "$srcdir/install.sh" --system --skip-desktop-database

  # Since we replaced the TARGET_INSTALL_BINARY_PATH in install.sh, we should update any references to it
  sed -Ei "s|$pkgdir||" "$pkgdir/usr/share/applications/software.Browsers.desktop" "$pkgdir/usr/share/xfce4/helpers/software.Browsers.desktop"
  ln -snf /usr/share/software.Browsers/bin/browsers "$pkgdir/usr/bin/browsers"
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
