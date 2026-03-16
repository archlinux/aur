# Maintainer: asyync1024 <asyync1024 at proton dot me>

_reponame=elfx86exts
pkgname=$_reponame-git
pkgver=0.4.0.r475.g3f7c2b0
pkgrel=1
pkgdesc="Decode ELF and MachO binaries and print out which instruction set extensions they use. (git)"
arch=('x86_64')
url="https://github.com/pkgw/$_reponame"
license=('MIT')
options=('!lto') # With LTO, build fails in clean chroot.
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=("$_reponame")
conflicts=("$_reponame")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "$_reponame"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
    cd "$_reponame"
    cargo fetch --locked
}

build() {
    cd "$_reponame"
    cargo build --release --frozen
}

check() {
    cd "$_reponame"
    cargo test --release --frozen
}

package() {
    cd "$_reponame"
    install -Dm755 "target/release/$_reponame" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
