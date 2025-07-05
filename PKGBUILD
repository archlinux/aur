# Maintainer: foi <foi@live.ru>

pkgname=bird3-bin
pkgver=3.0.4
pkgrel=1
pkgdesc="BIRD Internet Routing Daemon"
arch=('x86_64')
url="https://pkg.labs.nic.cz/doc/?project=bird"
license=('GNU General Public License')
conflicts=('bird')
sha256sums=('57804c45426bd9f1e6492d06b56322b8e0927363239607cb73a29e68bc6d8b9d')
source=("https://pkg.labs.nic.cz/bird3/pool/main/b/bird3/bird3_${pkgver}-cznic.1~bookworm_amd64.deb")
backup=("etc/bird" "etc/bird/bird.conf" "etc/bird/envvars")

package() {
    ar x "${srcdir}/bird3_${pkgver}-cznic.1~bookworm_amd64.deb"
    tar -xf "$srcdir/data.tar.xz" -C "$srcdir"

    mkdir -p "$pkgdir/usr/lib/sysusers.d"
    echo "u bird - \"bird user\" -" > "$pkgdir/usr/lib/sysusers.d/bird.conf"
    echo "g bird -" >> "$pkgdir/usr/lib/sysusers.d/bird.conf"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    mkdir -p "$pkgdir/usr/lib/bird/"
    mkdir -p "$pkgdir/etc/bird"

    mkdir -p "$pkgdir/usr/lib/tmpfiles.d"
    echo "f /etc/bird/bird.conf 0600 bird bird -" > "$pkgdir/usr/lib/tmpfiles.d/bird.conf"

    install -m 755 "$srcdir/usr/sbin/bird" "$pkgdir/usr/bin/"
    install -m 755 "$srcdir/usr/sbin/birdcl" "$pkgdir/usr/bin/"
    install -m 755 "$srcdir/usr/sbin/birdc" "$pkgdir/usr/bin/"
    install -m 755 "$srcdir/usr/lib/bird/prepare-environment" "$pkgdir/usr/lib/bird/prepare-environment"
    install -m 644 "$srcdir/lib/systemd/system/bird.service" "$pkgdir/usr/lib/systemd/system/bird.service"

    cp "$srcdir/etc/bird/envvars" "$pkgdir/etc/bird/envvars"
    cp "$srcdir/usr/share/bird3/bird.conf" "$pkgdir/etc/bird/bird.conf"

    sed -i 's|/usr/sbin/|/usr/bin/|g' "$pkgdir/usr/lib/systemd/system/bird.service"
}

post_install() {
    systemd-sysusers
    systemctl daemon-reload
}

post_remove() {
    systemctl disable --now bird
}
