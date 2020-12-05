# Maintainer: Vyacheslav Konovalov <f4f7l1hvr@relay.firefox.com>

pkgname=opensnitch
_pkgver=1.3.0-rc.2
pkgver=1.3.0_rc2
pkgrel=1
pkgdesc='GNU/Linux application firewall'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/gustavo-iniguez-goya/opensnitch'
license=('GPL3')
makedepends=('go' 'python-setuptools' 'python-grpcio-tools')
depends=('libnetfilter_queue' 'libpcap' 'python-grpcio' 'python-protobuf'
    'python-pyinotify' 'python-slugify' 'python-pyqt5')
optdepends=('logrotate: for logfile rotation support')
backup=('etc/opensnitchd/default-config.json' 'etc/opensnitchd/system-fw.json')
source=("https://github.com/gustavo-iniguez-goya/opensnitch/archive/v$_pkgver.tar.gz")
sha256sums=('9a2fe0f7078631b6d6b347fde9125548fa924d6c3c2a38d4b2401175edc81fb9')

prepare() {
    cd "$srcdir/opensnitch-$_pkgver"
    sed -i 's|local/bin|bin|g' daemon/opensnitchd.service
}

build() {
    cd "$srcdir/opensnitch-$_pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external'
    make -C daemon
    make -C proto

    cd ui
    python setup.py build
}

package() {
    cd "$srcdir/opensnitch-$_pkgver"
    install -Dm755 daemon/opensnitchd -t "$pkgdir/usr/bin"
    install -Dm644 daemon/opensnitchd.service -t "$pkgdir/usr/lib/systemd/system"
    install -dm755 "$pkgdir/etc/opensnitchd/rules"
    install -Dm644 daemon/default-config.json -t "$pkgdir/etc/opensnitchd"
    install -Dm644 daemon/system-fw.json -t "$pkgdir/etc/opensnitchd"
    install -Dm644 debian/opensnitch.logrotate "$pkgdir/etc/logrotate.d/opensnitch"

    cd ui
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
