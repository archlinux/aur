# Maintainer: Your Name <mca.christopher@gmail.com>
pkgname="alacritty-toggle-theme-on-darkmode-git"
pkgver=r32.126a244
pkgrel=1
pkgdesc="Changes alacritty theme when user changes the Gnome theme to 'prefer dark style'"
arch=('x86_64')
url="https://github.com/christophermca/great-matcha"
license=('GPL')
depends=('awk' 'bash' 'alacritty-use-theme-git')
makedepends=('git')
provides=('color-mode.service')
source=("$pkgname::git+https://github.com/christophermca/great-matcha.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"

  # systemd units
  install -Dm755 $srcdir/$pkgname/app/home/.config/systemd/user/color-mode.service "$pkgdir/usr/lib/systemd/user/color-mode.service"

  #toggle-mode-on-dbus-signal
  install -Dm755 $srcdir/$pkgname/app/home/.local/alacritty/bin/toggle-mode-on-signal.sh "$pkgdir/usr/bin/$pkgname/toggle-mode-on-signal.sh"

}

pre_remove() {
 echo -e "::: Stopping and disabling color-mode.service :::"
 echo -e " run: `systemctl --user disable color-mode.service` `systemctl --user stop color-mode.service` to clean up systemd"
}
