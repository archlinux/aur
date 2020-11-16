# Maintainer: lsf
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Adam Hose <adis@blad.is>

pkgname=opensnitch-git
pkgver=1.2.0.r11.a517ebe
pkgrel=1
pkgdesc="A GNU/Linux application firewall"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gustavo-iniguez-goya/opensnitch"
license=('GPL3')
makedepends=('git' 'go' 'python-setuptools' 'python-grpcio-tools')
depends=('libnetfilter_queue' 'libpcap' 'python-grpcio' 'python-protobuf'
         'python-pyinotify' 'python-slugify' 'python-pyqt5')
optdepends=('logrotate: for logfile rotation support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=("etc/${pkgname%-git}d/default-config.json")
install="${pkgname%-git}.install"
source=('git+https://github.com/gustavo-iniguez-goya/opensnitch.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
    export GOPATH="$srcdir/gopath"
    go clean -modcache

    cd "$srcdir/${pkgname%-git}"
    sed -i 's|local/bin|bin|g' "daemon/${pkgname%-git}d.service"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
    pushd daemon
    make
    popd

    # Clean mod cache for makepkg -C
    go clean -modcache

    pushd proto
    make
    popd

    pushd ui
    python setup.py build
    popd
}

package() {
    cd "$srcdir/${pkgname%-git}"
    pushd ui
    export PYTHONHASHSEED=0
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    popd

    install -Dm755 "daemon/${pkgname%-git}d" -t "$pkgdir/usr/bin"
    install -Dm644 "daemon/${pkgname%-git}d.service" -t \
        "$pkgdir/usr/lib/systemd/system"
    install -dm755 "$pkgdir/etc/${pkgname%-git}d/rules"
    install -Dm644 daemon/default-config.json -t "$pkgdir/etc/${pkgname%-git}d"
    install -Dm644 daemon/system-fw.json -t "$pkgdir/etc/${pkgname%-git}d"
    install -Dm644 "debian/${pkgname%-git}.logrotate" \
        "$pkgdir/etc/logrotate.d/${pkgname%-git}"
}
