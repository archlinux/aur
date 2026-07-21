# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Abhinav Gupta <mail@abhinavg.net>

pkgname=git-spice
pkgver=0.31.2
pkgrel=1
_commit=56186e4
pkgdesc='A tool for stacking Git branches.'
url='https://github.com/abhinav/git-spice'
arch=(aarch64 armv7h x86_64)
license=(GPL-3.0-or-later)
depends=(glibc)
makedepends=(openssl git go)
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('03695cbf68ceeec5b2a309374271a87175f5c3637e345ca6793d7fee5c5e6831')
validpgpkeys=(968479A1AFF927E37D1A566BB5690EEEBB952194)

prepare() {
    # git -C "$pkgname" -c gpg.ssh.allowedSignersFile="$srcdir/abhinavg.keys" verify-commit "$_commit"
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

