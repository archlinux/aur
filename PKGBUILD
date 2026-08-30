# Maintainer: Prabhat Kumar <hi@prbhtkumr.xyz>
pkgname=gaur
pkgver=1.2.2
pkgrel=1
pkgdesc="A beautiful, interactive TUI for Arch Linux package management"
arch=('x86_64' 'aarch64')
url="https://github.com/prbhtkumr/gaur"
license=('GPL-3.0-only')
depends=('fzf' 'pacman-contrib' 'glibc')
makedepends=('go>=1.21')
optdepends=(
    'paru: AUR helper (recommended)'
    'yay: AUR helper (alternative)'
    'reflector: mirror list updates'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/prbhtkumr/gaur/archive/v$pkgver.tar.gz")
sha256sums=('dd83ea30f68e132bace9771258f75a92db2913b98389e67a609faf0119500f51')

prepare() {
    cd "$pkgname-$pkgver"
    go mod download
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    
    go build -v -ldflags "-linkmode=external -extldflags \"${LDFLAGS}\" -X main.Version=$pkgver" -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
