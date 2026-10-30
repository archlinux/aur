# pkgver and sha256sums are filled in by .github/workflows/aur-publish.yml
# from the release tag; bump pkgrel by hand for packaging-only changes.
pkgname=profuse
pkgver=0.1.1
pkgrel=1
pkgdesc="Proton Drive FUSE client for Linux — mounts your Proton Drive as a local filesystem"
arch=('x86_64' 'aarch64')
url="https://github.com/nearwood/profuse"
license=('GPL-3.0-or-later')
depends=(
    'fuse3'
    'libsecret'
)
makedepends=(
    'go'
)
optdepends=(
    'gnome-keyring: Secret Service backend for GNOME desktops'
    'kwallet: Secret Service backend for KDE desktops'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('23cf3779d19ee9514ff43a11e6aebb9e8772f416aa16418ced5a3d68ec893340')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export CGO_ENABLED=0
    export GOPATH="$srcdir/gopath"
    export GOMODCACHE="$GOPATH/pkg/mod"

    go build \
        -trimpath \
        -mod=readonly \
        -modcacherw \
        -ldflags "-s -w -X main.version=${pkgver}" \
        -o profuse \
        ./cmd/
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 profuse \
        "$pkgdir/usr/bin/profuse"

    install -Dm644 contrib/systemd/profuse.service \
        "$pkgdir/usr/lib/systemd/user/profuse.service"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
