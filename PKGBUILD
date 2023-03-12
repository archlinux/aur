# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: lsf
# Contributor: Adam Hose <adis@blad.is>
pkgname=opensnitch-git
pkgver=1.6.0rc5.r10.5f532e5
pkgrel=2
pkgdesc="A GNU/Linux port of the Little Snitch application firewall"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/evilsocket/opensnitch"
license=('GPL3')
makedepends=(
  'git'
  'go'
  'python-grpcio-tools'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-nspektr'
  'python-jaraco.text'
  'qt5-tools'
)
depends=(
  'hicolor-icon-theme'
  'libnetfilter_queue'
  'libpcap' # check: do we still need this? Arch upstream says no?
  'python-grpcio'
  'python-protobuf'
  'python-slugify'
  'python-pyqt5'
  'python-pyinotify'
  'python-notify2'
)
optdepends=(
 'logrotate: logfile rotation'
 'opensnitch-ebpf-module-git: eBPF process monitor method (non-hardened kernel only)'
 'python-pyasn: display network names of IP'
 'python-qt-material-git: extra ui themes')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=(
  "etc/${pkgname%-git}d/default-config.json"
  "etc/${pkgname%-git}d/system-fw.json"
)
install="${pkgname%-git}.install"
_arch_svntogit=https://raw.githubusercontent.com/archlinux/svntogit-community
_arch_commit=eebb5fb16ed15251d3ead163e8e4b4229c21a999
_arch_git_url=${_arch_svntogit}/${_arch_commit}/trunk/
source=(
  'git+https://github.com/evilsocket/opensnitch.git'
  "fix-systemd-service.patch"
  "${_arch_git_url}remove-debian-path.patch"
  "${_arch_git_url}fix-setup.py.patch"
  "${_arch_git_url}tmpfiles.conf"
)
sha256sums=('SKIP'
            '9c3b312492c8127ca5e766cc5d6a8f8abcc5212be0d012e9f91c0258db4e9970'
            '4485913927e77c2edf46afcec9c2fbd6b1b6c8139d43d3b587b39ae2afdde398'
            'e77d2f6a6ada2761a987828e00c7725dee0c06bdb8793ae414d0df7fb1eb44a7'
            '09bd2cda97f74033617fd31efce8eba68eac03b29ea6d0f55aba2cef18824a72')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/-rc./rc/;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  export GOPATH="$srcdir/gopath"
  go clean -modcache

  cd "$srcdir/${pkgname%-git}"

  # Arch upstream patches

  # TODO file an upstream bug
  # * fix an issue with setup.py installing to python's site-packages instead
  # of /usr
  # * prefer scaled SVG instead of pixellated 48x48 PNG
  patch -p1 -i "$srcdir/fix-setup.py.patch"

  # TODO file an upstream bug
  # fix a couple of issues with the systemd services
  # (slightly adapted Arch upstream patch)
  patch -p1 -i "$srcdir/fix-systemd-service.patch"

  # TODO file an upstream bug
  # remove Debian-specific path from sys.path
  patch -p1 -i "$srcdir/remove-debian-path.patch"

  # other fixes

  sed -i 's|/usr/lib/python3/dist-packages/data/|/usr/lib/python3.10/site-packages/pyasn/data/|g' ui/opensnitch/utils/__init__.py
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
  # NOTE: yes, we do need this.
  # Arch upstream uses a patch, but _also_ includes pb files pre-generated
  # so it fails for this PKGBUILD.
  # not seeing the files to be fixed with this in the tree _before_ building
  # made me assume they were just not there anymore (and thus no need for the fix).
  # I was wrong.
  sed -i 's/^import ui_pb2/from . import ui_pb2/' opensnitch/ui_pb2*
  python -m build --wheel --no-isolation
  # python setup.py build
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
  # pushd ui
  # export PYTHONHASHSEED=0 # to hopefully avoid annoying keychain popups
  # python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  # popd

  install -d "$pkgdir/etc/${pkgname%-git}d/rules"
  install -Dm755 "daemon/${pkgname%-git}d" -t "$pkgdir/usr/bin"
  install -Dm644 "daemon/${pkgname%-git}d.service" -t \
    "$pkgdir/usr/lib/systemd/system"
  install -vDm644 "$srcdir/tmpfiles.conf" \
    "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-git}.conf"
  # install -Dm644 "daemon/${pkgname%-git}d-ebpf.service" -t \
    # "$pkgdir/usr/lib/systemd/system"
  install -Dm644 daemon/default-config.json -t "$pkgdir/etc/${pkgname%-git}d"
  install -Dm644 daemon/system-fw.json -t "$pkgdir/etc/${pkgname%-git}d"
  install -Dm644 "utils/packaging/daemon/deb/debian/${pkgname%-git}.logrotate" \
    "$pkgdir/etc/logrotate.d/${pkgname%-git}"

  # python ui
  python -m installer --destdir="$pkgdir" ui/dist/*.whl

  # tests are in site-packages, big no-no
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -rf "$pkgdir/$site_packages/tests"
}
