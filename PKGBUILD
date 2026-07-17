# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname="gnome-night-shift-git"
pkgver=r20.639c1bf
pkgrel=1
pkgdesc="::Rolling release:: A Small utility to switch the selected preferred mode."
arch=('any')
url="https://github.com/christophermca/gnome-night-shift/"
license=('GPL-1.0-or-later')
makedepends=('git')
provides=('gnome-night-shift.service' 'auto-update-gnome-theme.path' 'auto-update-gnome-theme.service' 'stop-night-shift-timer.service')
conflicts=( 'alacritty-use-theme-with-redshift'
            'alacritty-use-theme-with-redshift-git')
source=("$pkgname::git+https://github.com/christophermca/gnome-night-shift.git/")
sha256sums=('SKIP')
depends=( 'bash'
          'redshift')

pkgver() {
   cd "$pkgname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

 package() {
    cd "$pkgname"
    # options and directives that can be overridden
    pkgdesc="::Rolling release:: Changes gnomes perferred mode based on sunrise/sunset"
    install=gnome-night-shift-git.install

    # systemd units
    install -Dm644 $srcdir/$pkgname/app/home/config/systemd/user/auto-update-gnome-theme.path "$pkgdir/usr/lib/systemd/user/auto-update-gnome-theme.path"
    install -Dm644 $srcdir/$pkgname/app/home/config/systemd/user/auto-update-gnome-theme.service "$pkgdir/usr/lib/systemd/user/auto-update-gnome-theme.service"
    install -Dm644 $srcdir/$pkgname/app/home/config/systemd/user/gnome-night-shift.service "$pkgdir/usr/lib/systemd/user/gnome-night-shift.service"
    install -Dm644 $srcdir/$pkgname/app/home/config/systemd/user/gnome-night-shift.timer "$pkgdir/usr/lib/systemd/user/gnome-night-shift.timer"
    install -Dm644 $srcdir/$pkgname/app/home/config/systemd/user/stop-night-shift-timer.service "$pkgdir/usr/lib/systemd/user/stop-night-shift-timer.service"

    # scripts
    install -Dm755 $srcdir/$pkgname/app/home/local/bin/get-sunrise-sunset.sh "$pkgdir/usr/lib/gnome-night-shift/bin/get-sunrise-sunset.sh"
    install -Dm755 $srcdir/$pkgname/app/home/local/bin/test-network-connection.sh "$pkgdir/usr/lib/gnome-night-shift/bin/test-network-connection.sh"
    install -Dm755 $srcdir/$pkgname/app/home/local/bin/auto-update-gnome-theme.sh "$pkgdir/usr/lib/gnome-night-shift/bin/auto-update-gnome-theme.sh"

    # NetworkManager requires all dispatcher scripts to be owned by root
    install -Dm755 $srcdir/$pkgname/app/home/local/bin/revive-gnome-night-shift.sh "$pkgdir/usr/lib/NetworkManager/dispatcher.d/revivie-gnome-night-shift.sh"

    # vars
    install -Dm644 $srcdir/$pkgname/app/home/local/gnome-night-shift/shared-variables.sh "$pkgdir/usr/lib/gnome-night-shift/shared-variables.sh"

    # Create directory with 755 permissins

    # Includes vars file
    # install -Dm755 -o $USER $srcdir/$pkgname/app/home/local/gnome-night-shift/is-day-or-night "$pkgdir/$XDG_STATE_HOME/gnome-night-shift/is-day-or-night"
 }

