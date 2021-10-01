# Maintainer: Vyacheslav Konovalov <vk@protonmail.com>
# Contributor: Echizen Ryoma <echizenryoma.zhang@gmail.com>

pkgname=opensnitch
pkgver=1.4.1
pkgrel=1
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
    'abseil-cpp'
)
makedepends=(
    'go'
    'python-grpcio-tools'
    'python-setuptools'
)
optdepends=(
    'logrotate: for logfile rotation support'
    'hicolor-icon-theme: for gui'
)
backup=(
    'etc/opensnitchd/default-config.json'
    'etc/opensnitchd/system-fw.json'
)
source=(
    "$url/archive/v$pkgver.tar.gz"
)
sha512sums=(
    '58bc7eecdf129d219f2b4f16fccfd4788af02480f89e4042577a032114ddba176bc53ca299e60057ddd45b946de3cd89a5d21e3dad120aeedff0f62ce2b278a5'
)

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
