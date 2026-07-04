# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname=("alacritty-use-theme-with-redshift-git" "alacritty-use-theme-with-gnome-darkmode-git")
pkgbase=alacritty-use-theme-with-services-git
pkgver=r67.4ec40a3
pkgrel=1
pkgdesc="services to use alacritty-use-theme"
arch=('x86_64')
url="https://github.com/alacritty-use-theme/alacritty-use-theme-with-services"
license=('GPL-1.0-or-later')
groups=('alacritty-use-theme' 'alacritty-use-theme-services')
depends=('redshift' 'alacritty-use-theme')
makedepends=('git')
source=("$pkgbase::git+https://github.com/alacritty-use-theme/alacritty-use-theme-with-services.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package_alacritty-use-theme-with-redshift-git() {
	# options and directives that can be overridden
  pkgdesc="::Rolling release:: Changes alacritty theme based on the current time and locale"
  depends=('redshift' 'alacritty-use-theme')
  provides=('alaritty-use-theme-with-redshift.service' 'alaritty-use-theme-with-redshift.timer' 'alaritty-use-theme-with-redshift.target' 'auto-update-gnome-theme.service' 'auto-update-gnome-theme.path')
  conflicts=('alacritty-use-theme-with-redshift' 'alacritty-use-theme-with-redshift-git')
  install=alacritty-use-theme-with-redshift-git.install

	cd "$pkgbase"

  # systemd units
  install -Dm755 $srcdir/$pkgbase/app/home/config/systemd/user/alacritty-use-theme.timer "$pkgdir/usr/lib/systemd/user/alacritty-use-theme.timer"
  install -Dm755 $srcdir/$pkgbase/app/home/config/systemd/user/alacritty-use-theme.target "$pkgdir/usr/lib/systemd/user/alacritty-use-theme.target"
  install -Dm755 $srcdir/$pkgbase/app/home/config/systemd/user/alacritty-use-theme.service "$pkgdir/usr/lib/systemd/user/alacritty-use-theme.service"
  install -Dm755 $srcdir/$pkgbase/app/home/config/systemd/user/auto-update-gnome-theme.path "$pkgdir/app/home/config/systemd/user/auto-update-gnome-theme.path"
  install -Dm755 $srcdir/$pkgbase/app/home/config/systemd/user/auto-update-gnome-theme.service "$pkgdir/app/home/config/systemd/user/auto-update-gnome-theme.service"

  #config$pkgbase
  install -Dm755 $srcdir/$pkgbase/app/home/config/theme-switcher/environment.env "$pkgdir/usr/lib/alacritty-use-theme/environment.env"

  # scripts$pkgbase
  install -Dm755 $srcdir/$pkgbase/app/home/local/theme-switcher/theme-switcher.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/theme-switcher.sh"
  install -Dm777 $srcdir/$pkgbase/app/home/local/share/theme-switcher/toggle-theme-per-mode.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/toggle-theme-per-mode.sh"

  install -Dm755 $srcdir/$pkgbase/app/home/local/theme-switcher/bin/get-sunrise-sunset.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/get-sunrise-sunset.sh"
  install -Dm755 $srcdir/$pkgbase/app/home/local/theme-switcher/bin/auto-update-gnome-theme.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/auto-update-gnome-theme.sh"
  install -Dm755 $srcdir/$pkgbase/app/home/local/theme-switcher/bin/update-de.sh "$pkgdir/usr/lib/alacritty-use-theme/bin/theme-switcher/update-de.sh"

  # DEBUG tools
  install -Dm755 $srcdir/$pkgbase/app/home/local/theme-switcher/src/utils/debug.sh "$pkgdir/usr/lib/alacritty-use-theme/utils/debug.sh"
  install -Dm755 $srcdir/$pkgbase/app/home/local/theme-switcher/src/utils/is_theme_locked.sh "$pkgdir/usr/lib/alacritty-use-theme/utils/is_theme_locked.sh"

  #VARS
  install -Dm755 $srcdir/$pkgbase/app/home/local/theme-switcher/src/shared-variables.sh "$pkgdir/usr/share/alacritty-use-theme/theme-switcher/shared-variables.sh"
  install -Dm777 $srcdir/$pkgbase/app/home/config/theme-switcher/mode "$pkgdir/usr/lib/alacritty-use-theme/theme-switcher/mode"
}

package_alacritty-use-theme-with-gnome-darkmode-git() {
	# options and directives overrides
  pkgdesc="::Rolling release:: Changes alacritty theme when clicking the 'Dark Style' button in Gnome's System tray"
  url="https://github.com/alacritty-use-theme/alacritty-use-theme-with-gnome-darkmode"
  depends=('bash' 'awk' 'alacritty-use-theme')
  provides=('alacritty-listen-to-colorscheme.service')
  conflicts=('alacritty-use-theme-with-gnome-darkmode')
  replaces=('alacritty-use-theme-with-gnome-darkmode-git' 'alacritty-toggle-theme-on-darkmode-git')
  install=alacritty-use-theme-with-gnome-darkmode-git.install

	cd "$pkgbase"

  # systemd units
  install -Dm755 $srcdir/$pkgbase/app/home/config/systemd/user/alacritty-listen-to-colorscheme.service "$pkgdir/usr/lib/systemd/user/alacritty-listen-to-colorscheme.service"

  # toggle-mode-on-dbus-signal
  install -Dm755 $srcdir/$pkgbase/app/home/local/alacritty-use-theme/bin/toggle-mode-on-signal.sh "$pkgdir/usr/bin/alacritty-use-theme/toggle-mode-on-signal.sh"

  # documentation
  install -Dm644 $srcdir/$pkgbase/docs/alacritty-use-theme-with-gnome-darkmode/alacritty-toggle-theme-on-darkmode.md "$pkgdir/usr/share/docs/$pkgname/README.md"
}
