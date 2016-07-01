# Maintainer: Zygmunt Krynicki <me at zygoon dot pl>
pkgname=snapd
pkgver=2.0.10
pkgrel=1
pkgdesc="Service and tools for management of snap packages."
arch=('i686' 'x86_64')
url="https://github.com/snapcore/snapd"
license=('GPL3')
groups=()
depends=('glibc' 'snap-confine' 'squashfs-tools')
makedepends=('git' 'go' 'go-tools' 'bzr')
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip' '!emptydirs')
install=snapd.install
source=("https://github.com/snapcore/$pkgname/archive/$pkgver.tar.gz" 
        'snapd.sh')
noextract=()
md5sums=('af789f427239a22e2d15d729cd94f95b'
         '1d841a1d09ba86945551dfc5c5658b2e')

_gourl=github.com/snapcore/snapd

prepare() {
    # Use $srcdir/go as our GOPATH
    export GOPATH="$srcdir/go"
    mkdir -p "$GOPATH"
    # Have snapd checkout appear in a place suitable for subsequent GOPATH This
    # way we don't have to go get it again and it is exactly what the tag/hash
    # above describes.
    mkdir -p "$(dirname "$GOPATH/src/${_gourl}")"
    ln --no-target-directory -fs "$srcdir/$pkgname-$pkgver" "$GOPATH/src/${_gourl}"
}

build() {
    export GOPATH="$srcdir/go"
    # Use get-deps.sh provided by upstream to fetch go dependencies using the
    # godeps tool and dependencies.tsv (maintained upstream).
    ( cd "$GOPATH/src/${_gourl}" && ./get-deps.sh ) 
    # Build/install snap and snapd
    go install "${_gourl}/cmd/snap"
    go install "${_gourl}/cmd/snapd"
	cd "$pkgname-$pkgver"
}

check() {
    export GOPATH="$srcdir/go"
    cd "$GOPATH/src/${_gourl}"
    # FIXME: re-enable this after upstream behaves correctly in absence of .git
    # ./run-checks --unit
    # FIXME: this seems to break on C.UTF-8 locale
    # ./run-checks --static
}

package() {
    export GOPATH="$srcdir/go"
    # Ensure that we have /var/lib/snapd/{hostfs,lib/gl}/ as they are required by snap-confine
    # for constructing some bind mounts around.
    install -d -m 755 "$pkgdir/var/lib/snapd/hostfs/"
    touch "$pkgdir/var/lib/snapd/hostfs/.keep"
    install -d -m 755 "$pkgdir/var/lib/snapd/lib/gl/"
    touch "$pkgdir/var/lib/snapd/lib/gl/.keep"
    # Install the refresh timer and service for updating snaps
    install -d -m 755 "$pkgdir/usr/lib/systemd/system/"
    install -m 644 "$GOPATH/src/${_gourl}/debian/snapd.refresh.service" "$pkgdir/usr/lib/systemd/system"
    install -m 644 "$GOPATH/src/${_gourl}/debian/snapd.refresh.timer" "$pkgdir/usr/lib/systemd/system"
    # Install the snapd socket and service for the main daemon
    install -m 644 "$GOPATH/src/${_gourl}/debian/snapd.service" "$pkgdir/usr/lib/systemd/system"
    install -m 644 "$GOPATH/src/${_gourl}/debian/snapd.socket" "$pkgdir/usr/lib/systemd/system"
    # Install legacy "frameworks" units
    # TODO: drop those when they go away upstream
    install -m 644 "$GOPATH/src/${_gourl}/debian/snapd.frameworks-pre.target" "$pkgdir/usr/lib/systemd/system"
    install -m 644 "$GOPATH/src/${_gourl}/debian/snapd.frameworks.target" "$pkgdir/usr/lib/systemd/system"
    # Install snap and snapd executables
    install -d -m 755 "$pkgdir/usr/bin/"
    install -m 755 "$GOPATH/bin/snap" "$pkgdir/usr/bin/"
    install -d -m 755 "$pkgdir/usr/lib/snapd"
    install -m 755 "$GOPATH/bin/snapd" "$pkgdir/usr/lib/snapd/"
    # Install the license
    install -Dm 755 "$GOPATH/src/${_gourl}/COPYING" "$pkgdir/usr/share/licenses/${pkgname%-git}/COPYING"
    # Install script to export binaries paths of snaps
    install -Dm 755 "$srcdir/snapd.sh" "$pkgdir/etc/profile.d/apps-bin-path.sh"
}
