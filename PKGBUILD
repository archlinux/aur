# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=gh-skyline
pkgver=0.1.7
pkgrel=1
pkgdesc='Generate 3D models of your GitHub contribution history'
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
url="https://github.com/github/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d012d89cdf8f11c4b825f3ce695fdf6b93d7776f48a42119c124ec9e96305557')
depends=('github-cli' 'openssl' 'glibc' 'ttf-mona-sans')
makedepends=('go')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export CGO_ENABLED=2
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build/$pkgname
}

check() {
    cd "$pkgname-$pkgver"
    go test
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "build/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 SUPPORT.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 NOTICE -t "$pkgdir/usr/share/licenses/$pkgname"
}
