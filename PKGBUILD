# Maintainer: Vyacheslav Konovalov <f4f7l1hvr@relay.firefox.com>

pkgname=opensnitch
pkgver=1.3.6
pkgrel=2
pkgdesc='GNU/Linux port of the Little Snitch application firewall'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/evilsocket/opensnitch'
license=('GPL3')
depends=(
    'libnetfilter_queue' 'libpcap' 'python-grpcio' 'python-protobuf'
    'python-pyinotify' 'python-slugify' 'python-pyqt5'
)
makedepends=('go' 'python-setuptools' 'python-grpcio-tools')
optdepends=('logrotate: for logfile rotation support')
backup=(
    'etc/opensnitchd/default-config.json'
    'etc/opensnitchd/system-fw.json'
)
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=(
    '2a6b634fdd820d5b9083058d05f7895112e7d56b5c494be0f96d45a05da89d8ff784a978e61d4d48fbd72ba28ac866a56741dae8011694d5ecaf4deb6238fbad'
)

prepare() {
    cd "$srcdir/opensnitch-$pkgver"
    sed -i 's|local/bin|bin|g' daemon/opensnitchd.service
}

build() {
    cd "$srcdir/opensnitch-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=mod'
    make -C daemon
    make -C proto

    cd ui
    python setup.py build
}

package() {
    cd "$srcdir/opensnitch-$pkgver"
    install -Dm755 daemon/opensnitchd -t "$pkgdir/usr/bin"
    install -Dm644 daemon/opensnitchd.service -t "$pkgdir/usr/lib/systemd/system"
    install -dm755 "$pkgdir/etc/opensnitchd/rules"
    install -Dm644 daemon/default-config.json -t "$pkgdir/etc/opensnitchd"
    install -Dm644 daemon/system-fw.json -t "$pkgdir/etc/opensnitchd"
    install -Dm644 debian/opensnitch.logrotate "$pkgdir/etc/logrotate.d/opensnitch"

    cd ui
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
