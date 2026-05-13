# Maintainer: zyxisme <d0116u@gmail.com>
pkgname=sshkeyman
pkgver=0.1.0.r0.gcee85a6
pkgrel=1
pkgdesc="Web-based SSH key & config manager"
arch=('x86_64')
url="https://github.com/zyxisme/sshkeyman"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
_gitname=sshkeyman
source=("$_gitname::git+$url.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
    cd "$_gitname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_gitname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_gitname"
    cargo build --frozen --release
}

check() {
    cd "$_gitname"
    cargo test --frozen --release
}

package() {
    cd "$_gitname"

    install -Dm755 "target/release/$_gitname" "$pkgdir/usr/bin/$_gitname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_gitname/LICENSE" 2>/dev/null || true
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_gitname/README.md"
}
