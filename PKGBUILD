# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: lsf
# Contributor: Adam Hose <adis@blad.is>
pkgname=opensnitch-git
pkgver=1.6.0rc2.r21.564c263
pkgrel=1
pkgdesc="A GNU/Linux port of the Little Snitch application firewall"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/evilsocket/opensnitch"
license=('GPL3')
makedepends=('git' 'go' 'python-setuptools'
             'python-grpcio-tools' 'qt5-tools')
depends=('libnetfilter_queue' 'libpcap' 'python-grpcio' 'python-protobuf'
         'python-pyinotify' 'python-slugify' 'python-pyqt5')
optdepends=('logrotate: for logfile rotation support'
            'opensnitch-ebpf-module-git: eBPF process monitor method (non-hardened kernel only)'
            'python-notify2: desktop notifications'
            'python-pyasn: display network names'
            'python-qt-material-git: theming')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/${pkgname%-git}d/default-config.json")
install="${pkgname%-git}.install"
source=('git+https://github.com/evilsocket/opensnitch.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/-rc./rc/;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  export GOPATH="$srcdir/gopath"
  go clean -modcache

  cd "$srcdir/${pkgname%-git}"
  sed -i 's|local/bin|bin|g' "daemon/${pkgname%-git}d.service"
  sed -i 's|/usr/lib/python3/dist-packages/data/|/usr/lib/python3.10/site-packages/pyasn/data/|g' ui/opensnitch/utils.py
  sed -i 's|/usr/lib/python3/dist-packages/|/usr/lib/python3.10/site-packages/|g' ui/bin/opensnitch-ui
}

build() {
  cd "$srcdir/${pkgname%-git}"

  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=mod"
  export PATH=${PATH}:${GOPATH}/bin
  go install github.com/golang/protobuf/protoc-gen-go
  go install google.golang.org/grpc/cmd/protoc-gen-go-grpc
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

  # do not use ebpf proc method by default as the module is provided as an optdepend
  # NOTE: does not seem to be required, the default-config.json should use proc unless
  # changed in the settings / in the file
  # cp "daemon/${pkgname%-git}d.service" "daemon/${pkgname%-git}d-ebpf.service"
  # sed  -i 's/\(ExecStart=.*\)/\1 -process-monitor-method ebpf/' "daemon/${pkgname%-git}d-ebpf.service"
  # sed  -i 's/\(ExecStart=.*\)/\1 -process-monitor-method proc/' "daemon/${pkgname%-git}d.service"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  pushd ui
  export PYTHONHASHSEED=0 # to hopefully avoid annoying keychain popups
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  popd

  install -d "$pkgdir/etc/${pkgname%-git}d/rules"
  install -Dm755 "daemon/${pkgname%-git}d" -t "$pkgdir/usr/bin"
  install -Dm644 "daemon/${pkgname%-git}d.service" -t \
    "$pkgdir/usr/lib/systemd/system"
  # install -Dm644 "daemon/${pkgname%-git}d-ebpf.service" -t \
    # "$pkgdir/usr/lib/systemd/system"
  install -Dm644 daemon/default-config.json -t "$pkgdir/etc/${pkgname%-git}d"
  install -Dm644 daemon/system-fw.json -t "$pkgdir/etc/${pkgname%-git}d"
  install -Dm644 "utils/packaging/daemon/deb/debian/${pkgname%-git}.logrotate" \
    "$pkgdir/etc/logrotate.d/${pkgname%-git}"

  # clean up test dir to avoid conflicts with other packages
  # that also do not clear up the test dir ^^
  rm -rf "$pkgdir/usr/lib/python3.10/site-packages/tests"
}
