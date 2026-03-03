# Maintainer: Jesús Castro <jcstr@jcstr.dev>

pkgname=squeaky
pkgver=0.1
pkgrel=1
pkgdesc="Arch Linux system cleanup tool - removes stale caches, orphaned packages, old logs, and temp files"
arch=('x86_64' 'aarch64')
url="https://github.com/jcstr/squeaky"
license=('MIT')
depends=('glibc')
optdepends=(
    'pacman-contrib: Pacman Cache cleaning via paccache'
    'sudo: system-level cleanup without running squeaky as root'
)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jcstr/squeaky/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('311fc76ba4c1a5b3d94150f147497d3edbf5216d011f61f2f2facb119e2fc2d6')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build \
        -ldflags "-linkmode=external -s -w -X github.com/jcstr/squeaky/cmd.version=$pkgver" \
        -o squeaky .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 squeaky "$pkgdir/usr/bin/squeaky"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 squeaky.example.yaml "$pkgdir/usr/share/doc/$pkgname/squeaky.example.yaml"
}
