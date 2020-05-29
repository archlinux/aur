# Contributor: Ainola
# Contributor: Milan Knizek
# Maintainer: K. Hampf <khampf@users.sourceforge.net>

pkgname=scanbd
pkgver=1.5.1
pkgrel=5
pkgdesc="Scanner button daemon looking for scanner button pressed"
arch=('x86_64')
url="http://scanbd.sourceforge.net/"
license=('GPL2')
depends=('sane' 'confuse')
source=("https://downloads.sourceforge.net/scanbd/scanbd-$pkgver.tgz" "string-bounds.patch")
sha256sums=('b69ca5a474b81516d19c38082d949363c243df9ab9742315aaae499723267e5f' 'SKIP')
backup=('etc/scanbd/scanbd.conf')

prepare() {
    cd "$pkgver"
    # Since scanbd and saned are running on the same machine as the scanner is
    # connected to, we need to have two sets of saned configurations - one in
    # the default location (/etc/sane.d/), which would redirect local
    # applications to a network socket, that systemd is listening on, and
    # another one (e.g. /etc/scanbd/sane.d/), which will be actually used by
    # sane backend to access the attached scanner.
    sed -i 's@\(Environment=SANE_CONFIG_DIR=/etc/scanbd\)$@\1/sane.d@' \
           integration/systemd/scanbd.service

    sed -i 's@\(Environment=SANE_CONFIG_DIR=/etc/scanbd\)$@\1/sane.d@' \
            integration/systemd/scanbm@.service

    # Arch uses the 'daemon' user and 'scanner' group.
    sed -i 's/"saned">.*/"daemon">/' integration/scanbd_dbus.conf

    sed -i 's@\(user    = \)saned$@\1daemon@' conf/scanbd.conf
    sed -i 's@\(group   = \)lp$@\1scanner@' conf/scanbd.conf
    sed -i 's@/var\(/run/scanbd.pid\)@\1@' conf/scanbd.conf
    sed -i 's@\(debug-level =\)7$@\1 2@' conf/scanbd.conf
    sed -i 's@\(SANE_CONFIG_DIR=\)\(/etc/scanbd\)@\1\2/sane.d@' conf/scanbd.conf

    patch --forward --strip=1 --input="${srcdir}/string-bounds.patch"
}

build() {
    cd "$pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
    make
}

package() {
    cd "$pkgver"
    make DESTDIR="$pkgdir" install

    install -Dm644 integration/scanbd_dbus.conf -t "$pkgdir/etc/dbus-1/system.d/"
    install -Dm644 integration/systemd/{scanbd,scanbm@}.service -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 integration/systemd/scanbm.socket -t "$pkgdir/usr/lib/systemd/system/"

    install -Dm644 integration/systemd/de.kmux.scanbd.server.service \
            -t "$pkgdir/usr/share/dbus-1/system-services/"

    install -Dm644 {doc/README.txt,AUTHORS} -t "$pkgdir/usr/share/doc/$pkgname/"
    install -dm755 "$pkgdir/etc/scanbd/sane.d"
}

