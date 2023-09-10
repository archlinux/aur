# Maintainer: poly000 <pedajilao@163.com>
pkgname=c2rust-git
_pkgname=${pkgname/-git/}
pkgver=v0.18.0.r409.g0e9e4048
pkgrel=1
pkgdesc="Migrate C code to Rust"
url="https://github.com/immunant/c2rust"

provides=('c2rust')
conflicts=('c2rust-bin' 'c2rust')

arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')

license=('Apache-2.0' 'MIT')
depends=('llvm')
makedepends=('cargo' 'llvm' 'clang' 'cmake' 'openssl' 'python' 'git')

source=("git+https://github.com/immunant/c2rust.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_pkgname}"

    if [[ $CARCH != x86_64 ]]; then
        export CARGO_PROFILE_RELEASE_LTO=off
    fi

    cargo build --locked --release --target-dir target
}

package() {
    cd "$srcdir/${_pkgname}"
    install -vDm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"
    echo deleting...
    find "target/release" -type f -name "*-*.d" -print -delete 
    cp -av "target/release/${_pkgname}-"* "${pkgdir}/usr/bin/"
} 
