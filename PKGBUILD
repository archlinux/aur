# Maintainer: Vyacheslav Konovalov <vk@protonmail.com>
# Contributor: Echizen Ryoma <echizenryoma.zhang@gmail.com>

pkgname=opensnitch
pkgver=1.4.0
pkgrel=3
pkgdesc='GNU/Linux port of the Little Snitch application firewall'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/evilsocket/opensnitch'
license=('GPL3')
depends=(
    'libnetfilter_queue'
    'libpcap'
    'python-grpcio'
    'python-protobuf'
    'python-pyinotify'
    'python-slugify'
    'python-pyqt5'
    'abseil-cpp')
makedepends=(
    'go'
    'python-grpcio-tools'
    'python-setuptools')
optdepends=(
    'logrotate: for logfile rotation support'
    'hicolor-icon-theme: for gui'
)
backup=(
    'etc/opensnitchd/default-config.json'
    'etc/opensnitchd/system-fw.json'
)
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('35d9811f9b8c3dc073231dfe20c21151280fdb90a0bc355617b5a2f2109e7f9590579f73ceed944447004bc0e8609c78c90bb0b21b95bb339cf4acbb8aca0fa7')

prepare() {
    cd "$srcdir/opensnitch-$pkgver"
    sed -i 's|local/bin|bin|g' daemon/opensnitchd.service
}

build() {
    cd "$srcdir/opensnitch-$pkgver"
    
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=mod"

    export PATH="${GOPATH}/bin:${PATH}"
    
    go install github.com/golang/protobuf/protoc-gen-go
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc
    
    echo "$(whereis protoc-gen-go)"
    echo "$(whereis protoc-gen-go-grpc)"

    pushd proto
    make
    popd

    pushd daemon
    make
    popd

    pushd ui
    pyrcc5 -o opensnitch/resources_rc.py opensnitch/res/resources.qrc
    sed -i 's/^import ui_pb2/from . import ui_pb2/' opensnitch/ui_pb2*
    python setup.py build
    popd

    go clean -modcache
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
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
