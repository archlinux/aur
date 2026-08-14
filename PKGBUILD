# Maintainer: Pavan Rikhi <pavan.rikhi@gmail.com>

_pkgbase=snout-cli
pkgver=r146.95c5cc4
pkgname="${_pkgbase}-git"
pkgrel=2
pkgdesc='Face and Eye Tracking CLI Based on Project Babble'
url='https://codeberg.org/Darksecond/libsnout'
license=('LicenseRef-Babble')

makedepends=('cargo' 'git' 'clang' 'onnxruntime' 'llvm')
depends=('glibc' 'libgcc')

provides=( "${_pkgbase}" )
conflicts=( "${_pkgbase}" )
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=('git+https://codeberg.org/Darksecond/libsnout.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/libsnout"
    # Support tags once/if they exist but use total commit count otherwise
    ( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/libsnout"
    cargo fetch --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target 
    cd "$srcdir/libsnout"
    cargo build --release -p snout-cli
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/libsnout"
    cargo test --workspace
}

package() {
    cd "$srcdir/libsnout"
    install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${_pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 config.toml "${pkgdir}/etc/snout/config.toml"
}
