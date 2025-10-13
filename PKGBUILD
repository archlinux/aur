# Maintainer: a821 at mail dot de
# Contributor: Alex Xu <alex_y_xu@yahoo.ca>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=sshguard-git
pkgver=2.5.1.r17.ge1da42d
pkgrel=1
pkgdesc="Brute force detector for SSH, Exim, VSFTPD and more. Blocks by ip with iptables"
arch=('i686' 'x86_64')
url="https://www.sshguard.net/"
license=('ISC' 'BSD-2-Clause')
makedepends=('git' 'python-docutils')
optdepends=('iptables' 'nftables' 'firewalld' 'ipset')
conflicts=('sshguard')
provides=('sshguard')
backup=('etc/sshguard.conf')
source=("git+https://bitbucket.org/sshguard/sshguard.git"
        "sshguard.service"
        "sshguard.tmpfile")
sha256sums=('SKIP'
            '5dda7a47c11898142fcc21cf8e76c0c7009814a0d924675feacb3df084a0fa1b'
            'cd2ba683f25a650a29dd465ec7eb507826af46822d1a1ea6116a052c77c4148f')

prepare() {
    cd sshguard
    sed -i 's|tables.target|tables.service|g' examples/sshguard.service
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
        --libexecdir=/usr/lib/sshguard

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
LOGREADER="LANG=C /usr/bin/journalctl -afb -p info -n1 -t sshd -t sshd-session -o cat"
BLACKLIST_FILE=120:/var/db/sshguard/blacklist.db
BACKEND="/usr/lib/sshguard/sshg-fw-iptables"
EOF

    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
