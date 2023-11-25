# Contributor: Ainola
# Contributor: Milan Knizek
# Maintainer: 132ikl <132@ikl.sh>

pkgname=scanbd-git
pkgver=r224.f909458
pkgrel=2
pkgdesc="Scanner button daemon looking for scanner button pressed"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/sane-project/frontend/scanbd"
license=('GPL2')
depends=('sane' 'confuse' 'libusb-compat')
source=("scanbd::git+https://gitlab.com/sane-project/frontend/scanbd.git")
sha256sums=('SKIP')
backup=('etc/scanbd/scanbd.conf')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
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
    sed -i 's/GROUP="saned"/GROUP="scanner"/' integration/99-saned.rules

    sed -i 's@\(user    = \)saned$@\1daemon@' conf/scanbd.conf
    sed -i 's@\(group   = \)lp$@\1scanner@' conf/scanbd.conf
    sed -i 's@/var\(/run/scanbd.pid\)@\1@' conf/scanbd.conf
    sed -i 's@\(debug-level =\)7$@\1 2@' conf/scanbd.conf
    sed -i 's@\(SANE_CONFIG_DIR=\)\(/etc/scanbd\)@\1\2/sane.d@' conf/scanbd.conf
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir" install

    install -Dm644 integration/scanbd_dbus.conf -t "$pkgdir/etc/dbus-1/system.d/"
    install -Dm644 integration/99-saned.rules -t "$pkgdir/usr/lib/udev/rules.d/"
    install -Dm644 integration/systemd/{scanbd,scanbm@}.service -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 integration/systemd/scanbm.socket -t "$pkgdir/usr/lib/systemd/system/"

    install -Dm644 integration/systemd/de.kmux.scanbd.server.service \
            -t "$pkgdir/usr/share/dbus-1/system-services/"

    install -Dm644 {doc/README.txt,AUTHORS} -t "$pkgdir/usr/share/doc/$pkgname/"
    install -dm755 "$pkgdir/etc/scanbd/sane.d"
}

