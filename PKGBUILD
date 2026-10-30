# Maintainer: Drew Nutter <dnut@users.noreply.github.com>
pkgname=upgrade
pkgver=0.4.0
pkgrel=1
pkgdesc='Automate system upgrades'
arch=('any')
url='https://github.com/dnut/upgrade'
license=('GPL3')
# fakeroot for makepkg, which builds the package when upgrade updates itself
depends=('kernel-modules-hook' 'polkit' 'python' 'pyalpm' 'pacman-contrib' 'git' 'fakeroot')
optdepends=('yay: upgrade AUR packages'
            'paru: upgrade AUR packages'
            'flatpak: upgrade flatpak packages')
# nothing to strip, and without these makepkg needs strip and debugedit, which base-devel brings
options=('!strip' '!debug')
install=$pkgname.install
# the release tagged v$pkgver. ./makepkg in the github repo builds the checkout instead.
source=("$pkgname-$pkgver::git+https://github.com/dnut/upgrade#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 -t "$pkgdir/usr/bin" bin/{upgrade,autoremove,clearpkgcache}
    install -Dm755 -t "$pkgdir/usr/lib/upgrade" lib/{as-aur-upgrader,autoremove,clearpkgcache,locked,run-oneshot,self-upgrade,upgrade}
    install -Dm644 -t "$pkgdir/usr/lib/upgrade" lib/defaults.toml

    install -Dm644 -t "$pkgdir/usr/lib/systemd/system" systemd/{upgrade.service,upgrade.timer,autoremove.service,clearpkgcache.service}
    install -Dm644 -t "$pkgdir/usr/share/polkit-1/rules.d" permissions/upgrade.rules

    # sudo's own mode for the folder, so pacman doesn't warn that they differ
    install -dm750 "$pkgdir/etc/sudoers.d"
    install -m640 permissions/upgrade.sudoers "$pkgdir/etc/sudoers.d/upgrade"

    install -Dm644 systemd/upgrade.sysusers "$pkgdir/usr/lib/sysusers.d/upgrade.conf"
    install -Dm644 systemd/upgrade.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/upgrade.conf"
}
