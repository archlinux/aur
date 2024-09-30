# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=horcrux
pkgver=0.2
pkgrel=1
pkgdesc="Split your file into encrypted fragments so that you don't need to remember a passcode"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/jesseduffield/horcrux"
license=('GPL-3.0-only')
makedepends=('git' 'go')
source=("git+$url#tag=v$pkgver")
sha512sums=('f97dd28f92a857f9e97126a0522054f92771b0f173733dfd9cfb6ffbc9bf73cdc5181b94ec16a10ed6b86d9fb774e6d3c1d48aa47ce8011bec6cb736070c5f8f')
conflicts=('horcrux-git')

prepare() {
    cd $pkgname
    git reset --hard v$pkgver
    go mod init "${url#https://}" # strip https:// from canonical URL
    go mod tidy
}

build() {
    cd $pkgname
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o horcrux .
}

package() {
    cd $pkgname
    install -Dm755 horcrux -t "$pkgdir/usr/bin/"
}
