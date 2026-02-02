# Maintainer: Your Name <your.email@example.com>
pkgname=lyriterm-git
pkgver=r8.9c1c4bb  # This will automatically update when you build
pkgrel=1
pkgdesc="A minimalist, karaoke-style lyrics fetcher for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/kryptos-s/lyriterm"
license=('MIT')
depends=('glibc' 'playerctl')
makedepends=('go' 'git')
provides=("lyriterm")
conflicts=("lyriterm")
source=("git+https://github.com/kryptos-s/lyriterm.git")
sha256sums=('SKIP')

pkgver() {
    cd "lyriterm"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "lyriterm"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    # Important: Point to your cmd folder!
    go build -o lyriterm ./cmd/lyriterm
}

package() {
    cd "lyriterm"
    
    # Install the binary
    install -Dm755 lyriterm "$pkgdir/usr/bin/lyriterm"
    
    # Install the license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install the readme (optional but nice)
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
