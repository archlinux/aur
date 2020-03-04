# Maintainer: lsf
# Contributor: Mark Wagie <mark.wagie@tutanota.com>
# Contributor: Adam Hose <adis@blad.is>

pkgname=opensnitch-git
pkgver=r514.db22e83
pkgrel=1
pkgdesc="A GNU/Linux port of the Little Snitch application firewall."
arch=('i686' 'x86_64')
url="https://github.com/gustavo-iniguez-goya/opensnitch"
license=('GPL3')
makedepends=('git' 'dep' 'go-pie' 'python-setuptools')
depends=('libnetfilter_queue' 'libpcap' 'python-protobuf-compiler'
         'python-pyinotify' 'python-unicode-slugify' 'python-pyqt5'
         'python-libconfigparser')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gustavo-iniguez-goya/opensnitch.git')
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        mkdir -p gopath/src/github.com/gustavo-iniguez-goya
        ln -rTsf "$srcdir/${pkgname%-git}" \
                "gopath/src/github.com/gustavo-iniguez-goya/${pkgname%-git}"
        export GOPATH="$srcdir"/gopath

        cd "gopath/src/github.com/gustavo-iniguez-goya/${pkgname%-git}/daemon"
        dep ensure

        cd "$srcdir/${pkgname%-git}"
        sed -i 's|local/bin|bin|g' daemon/opensnitchd.service
}

build() {
        export GOPATH="$srcdir"/gopath

        cd "gopath/src/github.com/gustavo-iniguez-goya/${pkgname%-git}/daemon"
        go build \
        -trimpath \
        -ldflags "-extldflags $LDFLAGS" \
        -o opensnitchd .

        cd "$srcdir/${pkgname%-git}/proto"
        make

        cd "$srcdir/${pkgname%-git}/ui"
        python setup.py build

        # Skipping, too many syntax errors
        # cd "$srcdir/${pkgname%-git}"
        # python make_ads_rules.py
}

package() {
        cd "$srcdir/${pkgname%-git}"
        install -Dm755 daemon/opensnitchd -t "$pkgdir/usr/bin"

        install -Dm644 daemon/opensnitchd.service -t "$pkgdir/usr/lib/systemd/system"

        cd "$srcdir/${pkgname%-git}/ui"
        python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
