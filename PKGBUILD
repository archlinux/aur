# Maintainer: lsf
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Adam Hose <adis@blad.is>

pkgname=opensnitch-git
pkgver=1.0.0.r5.078df0f
pkgrel=1
pkgdesc="A GNU/Linux application firewall"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gustavo-iniguez-goya/opensnitch"
license=('GPL3')
makedepends=('git' 'go' 'python-setuptools' 'python-grpcio-tools')
depends=('libnetfilter_queue' 'libpcap' 'python-grpcio' 'python-protobuf'
         'python-pyinotify' 'python-unicode-slugify' 'python-pyqt5')
optdepends=('logrotate: for logfile rotation support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/opensnitchd/default-config.json')
install="${pkgname%-git}.install"
source=('git+https://github.com/gustavo-iniguez-goya/opensnitch.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
    mkdir -p gopath/src/github.com/gustavo-iniguez-goya
    ln -rTsf "$srcdir/${pkgname%-git}" \
        "gopath/src/github.com/gustavo-iniguez-goya/${pkgname%-git}"

    # Prevent creation of a `go` directory in one's home.
    # Sometimes this directory cannot be removed with even `rm -rf` unless
    # one becomes root or changes the write permissions.
    export GOPATH="$srcdir/gopath"
    go clean -modcache

    cd "$srcdir/${pkgname%-git}"
    sed -i 's|local/bin|bin|g' daemon/opensnitchd.service
}

build() {
    cd "gopath/src/github.com/gustavo-iniguez-goya/${pkgname%-git}/daemon"
    go build \
        -v \
        -trimpath \
        -buildmode=pie \
        -ldflags "-extldflags \"${LDFLAGS}\"" \
        -o opensnitchd .

    # Clean now to ensure makepkg --clean works
    go clean -modcache

    cd "$srcdir/${pkgname%-git}/proto"
    make

    cd "$srcdir/${pkgname%-git}/ui"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 daemon/opensnitchd -t "$pkgdir/usr/bin"
    install -Dm644 daemon/opensnitchd.service -t \
        "$pkgdir/usr/lib/systemd/system"
    install -dm755 "$pkgdir/etc/opensnitchd/rules"
    install -Dm644 daemon/default-config.json -t "$pkgdir/etc/opensnitchd"
    install -Dm644 debian/opensnitch.logrotate \
        "$pkgdir/etc/logrotate.d/opensnitch"

    cd "$srcdir/${pkgname%-git}/ui"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
