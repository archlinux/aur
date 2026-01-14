# Maintainer: Your Name <mca.christopher@gmail.com>
pkgname="alacritty-toggle-theme-on-darkmode-git"
pkgver=r33.4933cf9
pkgrel=1
pkgdesc="Changes alacritty theme when clicking the 'Dark Style' button in Gnome's System tray"
arch=('x86_64')
url="https://github.com/christophermca/great-matcha"
license=('GPL-1.0-or-later')
depends=('bash' 'awk' 'alacritty-use-theme-git')
makedepends=('git')
provides=('alacritty-listen-to-colorscheme.service')
source=("$pkgname::git+https://github.com/christophermca/great-matcha.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"

  # systemd units
  install -Dm755 $srcdir/$pkgname/app/home/.config/systemd/user/alacritty-listen-to-colorscheme.service "$pkgdir/usr/lib/systemd/user/alacritty-listen-to-colorscheme.service"

  # toggle-mode-on-dbus-signal
  install -Dm755 $srcdir/$pkgname/app/home/.local/alacritty-use-theme/bin/toggle-mode-on-signal.sh "$pkgdir/usr/bin/alacritty-use-theme/toggle-mode-on-signal.sh"
}

post_install() {
 echo -e "::: Be sure to enable and start the systemd units :::"
 echo -e " run: `systemctl --user enable alacritty-listen-to-colorscheme.service` `systemctl --user start alacritty-listen-to-colorscheme.service`"
}

pre_remove() {
 echo -e "::: Stopping and disabling color-mode.service :::"
 echo -e " run: `systemctl --user disable alacritty-listen-to-colorscheme.service` `systemctl --user stop alacritty-listen-to-colorscheme.service`"
}
