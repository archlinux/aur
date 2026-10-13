# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Abhinav Gupta <mail@abhinavg.net>

pkgname=git-spice
pkgver=0.32.0
pkgrel=1
_commit=eb1831c
pkgdesc='A tool for stacking Git branches.'
url='https://github.com/abhinav/git-spice'
arch=(aarch64 armv7h x86_64)
license=(GPL-3.0-or-later)
depends=(glibc)
makedepends=(git go)
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('98c8e2a6cb1942d91bcd68da2d9f3d9d744341939dcd6ef88f870239a1509075')
validpgpkeys=(968479A1AFF927E37D1A566BB5690EEEBB952194)

prepare() {
    cd "$pkgname"
    export GOPATH="$srcdir"
    go mod download -modcacherw
    mkdir -p build
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname"
    go build -o "build/$pkgname" -ldflags "-X main._version=$pkgver"
    "./build/$pkgname" shell completion bash > "$pkgname.bash"
    "./build/$pkgname" shell completion zsh > "$pkgname.zsh"
    "./build/$pkgname" shell completion fish > "$pkgname.fish"
    for file in "$pkgname.bash" "$pkgname.zsh" "$pkgname.fish"; do
        sed -i "s:$srcdir/$pkgname/build/$pkgname:/usr/bin/$pkgname:" "$file"
    done
}

package() {
    cd "$pkgname"
    install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 "$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md AGENTS.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

