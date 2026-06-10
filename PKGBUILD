# Maintainer: Cristian Ciro <cristian_ciro@icloud.com>
#
# AUR PKGBUILD for hpd-handheld-power-daemon-bin (prebuilt repack).
# Repacks the official x86_64-linux release tarball from GitHub —
# no compilation, fast install. For users on machines without rust.
#
# Template: placeholders in the pkgver and sha256sums lines below are
# rewritten at release time by scripts/aur-sync.sh.

pkgname=hpd-handheld-power-daemon-bin
_realname=hpd-handheld-power-daemon
pkgver=2.7.2
# pkgrel is static (not a placeholder): reset to 1 when bumping pkgver,
# increment for packaging-only respins of the same version.
pkgrel=1
pkgdesc="Linux system daemon for handheld PCs: TDP, charge, profile, fan (prebuilt x86_64)"
arch=('x86_64')
url="https://github.com/CiroDev-Git/hpd-handheld-power-daemon"
license=('GPL-3.0-or-later')
depends=('dbus' 'polkit' 'systemd')
provides=("$_realname=$pkgver")
conflicts=("$_realname" 'power-profiles-daemon')
backup=('etc/hpd/config.toml.example')
install="hpd.install"
options=(!strip !debug)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/hpd-$pkgver-x86_64-linux.tar.gz")
sha256sums=('2ef6671f6d1dfbfae81cbafa9ac20f195e9045825c7bba1590c667e38010af0c')

package() {
    cd "hpd-$pkgver-x86_64-linux"

    install -Dm755 hpd-daemon "$pkgdir/usr/bin/hpd-daemon"
    install -Dm755 hpdctl     "$pkgdir/usr/bin/hpdctl"

    # systemd unit: rewrite ExecStart so it points at /usr/bin under
    # the AUR install layout instead of the in-repo install.sh
    # default of /usr/local/bin.
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    sed -E 's|/usr/local/bin/hpd-daemon|/usr/bin/hpd-daemon|' \
        package/hpd.service > "$pkgdir/usr/lib/systemd/system/hpd.service"
    chmod 644 "$pkgdir/usr/lib/systemd/system/hpd.service"

    install -Dm644 package/dev.cirodev.hpd.conf \
        "$pkgdir/usr/share/dbus-1/system.d/dev.cirodev.hpd.conf"
    install -Dm644 package/polkit/dev.cirodev.hpd.policy \
        "$pkgdir/usr/share/polkit-1/actions/dev.cirodev.hpd.policy"
    install -Dm644 package/polkit/49-hpd.rules \
        "$pkgdir/usr/share/polkit-1/rules.d/49-hpd.rules"
    install -Dm644 package/hpd-example.toml \
        "$pkgdir/etc/hpd/config.toml.example"

    install -Dm644 LICENSE      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md    "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
