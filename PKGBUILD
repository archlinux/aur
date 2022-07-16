# Contributor: Alex Xu <alex_y_xu@yahoo.ca>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=sshguard-git
pkgver=2.4.2.r6.g653c2dd
pkgrel=1
pkgdesc="Brute force detector for SSH, Exim, VSFTPD and more. Blocks by ip with iptables"
arch=('i686' 'x86_64')
url="https://www.sshguard.net/"
license=('GPL')
makedepends=('git' 'python-docutils')
optdepends=('iptables' 'nftables' 'firewalld' 'ipset')
conflicts=('sshguard')
provides=('sshguard')
backup=('etc/sshguard.conf')
source=("git+https://bitbucket.org/sshguard/sshguard.git"
        "sshguard.service"
        "sshguard.tmpfile")
sha256sums=('SKIP'
            '18a5674d8acb9fe2a7bb3ef760b2d7d8e8ad9dbe244b9c762b754c8a482e912a'
            'cd2ba683f25a650a29dd465ec7eb507826af46822d1a1ea6116a052c77c4148f')

prepare() {
    cd sshguard
    sed -i '/iptables/d;/sample/d' examples/sshguard.service
    autoreconf -i
}

pkgver() {
    cd sshguard
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd sshguard
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/sshguard \
        --with-firefall=iptables
    make
}

package() {
    cd sshguard
    make DESTDIR="$pkgdir" install
    install -Dm0644 "../sshguard.tmpfile" "$pkgdir/usr/lib/tmpfiles.d/sshguard.conf"
    install -Dm0644 "../sshguard.service" "$pkgdir/usr/lib/systemd/system/sshguard.service"
    install -dm0755 "$pkgdir/usr/share/doc/" "$pkgdir/etc"
    cp -a examples "$pkgdir/usr/share/doc/sshguard"

    cat > "$pkgdir"/etc/sshguard.conf << EOF
LOGREADER="LANG=C /usr/bin/journalctl -afb -p info -n1 -t sshd -o cat"
BLACKLIST_FILE=120:/var/db/sshguard/blacklist.db
BACKEND="/usr/lib/sshguard/sshg-fw-iptables"
EOF

}
