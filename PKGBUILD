# Maintainer: Zerachiel <z.dadsi21@gmail.com>

_pkgname="matugen"
pkgname="$_pkgname-git"
pkgver=2.4.1.r20.g4619cca
pkgrel=1
pkgdesc="A material you color generation tool with templates"
url="https://github.com/InioX/matugen"
arch=('x86_64')
license=("GPL-2.0")

makedepends=('cargo' 'git')

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgsrc"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgsrc"
    cargo build --release --frozen
}

check() {
    cd "$_pkgsrc"
    cargo test --frozen
}

package() {
    cd "$_pkgsrc"
    install -Dm755 "target/release/matugen" "$pkgdir/usr/bin/matugen"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
