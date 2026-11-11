# Maintainer: danalec
#
# Build prerequisites, once:
#   sudo pacman -S --needed rustup base-devel git
#   rustup default stable
#
# `rustup` provides cargo and rustc, and `base-devel` provides the linker
# makepkg needs. Both are expected as makedepends, not as dependencies of
# the installed package: the result is a normal dynamically linked binary.

pkgname=rgx-search-git
pkgver=0.1.10.r4.gc75150f0
pkgrel=1
pkgdesc="Ripgrep-compatible search inside PDFs, Office documents, archives, 3D models, LLM checkpoints, databases and e-mail (git build)"
arch=('x86_64' 'aarch64')
url="https://github.com/danalec/rgx"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'rustup')
provides=('rgx-search')
conflicts=('rgx-search' 'rgx-search-bin' 'rgx-search-avx2-bin' 'rgx-search-v2-bin' 'rgx-search-v4-bin' 'rgx-search-znver4-bin')
source=("git+${url}.git")
sha256sums=('SKIP')
# makepkg's lto option adds -flto to CFLAGS, and the bundled sqlite3 and zstd C
# is then GCC LTO bytecode, which the default rust-lld linker cannot read.
options=('!lto')

pkgver() {
    cd "$srcdir/rgx"
    git describe --long --tags --abbrev=8 | sed 's/^rgx-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/rgx"
    # rustup's shims live here when rustup, not the `rust` package, is the
    # toolchain source; the distribution's /usr/bin/cargo still wins otherwise.
    export RUSTUP_TOOLCHAIN=stable
    export PATH="$HOME/.cargo/bin:$PATH"
    cargo build --release --locked
}

check() {
    cd "$srcdir/rgx"
    ./target/release/rgx --version
}

package() {
    cd "$srcdir/rgx"
    install -Dm755 target/release/rgx "$pkgdir/usr/bin/rgx"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
