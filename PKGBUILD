# Maintainer: kinduff <kinduff@protonmail.com>

pkgname=lazystash
pkgver=0.2.0
pkgrel=1
_commit=48cb21b
pkgdesc='TUI for managing Git stashes'
url='https://github.com/lasagnapizza/lazystash'
arch=(aarch64 x86_64)
license=(MIT)
depends=(glibc)
makedepends=(git go openssh)
source=("$pkgname::git+$url#commit=${_commit}"
        kinduff.keys)
sha256sums=('0c7c42f4fea11c012e8e942dd6b9dbd1bafab2d27d40131f4bf01e03ef73e12a'
            '2fba504bd2fd07dec34961493fdb8452826f9c1146fe90aaa6aeab938958d841')

prepare() {
    git -C "$pkgname" -c gpg.ssh.allowedSignersFile="$srcdir/kinduff.keys" verify-commit "$_commit"

    export GOPATH="$srcdir"
    cd "$pkgname"
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
    go build -o build
}

check() {
    cd "$pkgname"
    go test ./...
}

package() {
    cd "$pkgname"
    install -Dm755 build/lazystash -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

