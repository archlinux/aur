# Maintainer: loooph <loooph@gmx.de>
pkgname=memtest_vulkan-git
pkgver=v0.5.0
pkgrel=1
pkgdesc="Vulkan compute tool for testing video memory stability"
arch=('x86_64' 'aarch64')
url="https://github.com/GpuZelenograd/memtest_vulkan"
license=('Zlib')
depends=(
    'glibc'
    'gcc-libs'
    'vulkan-driver'
)
makedepends=(
    'git'
    'cargo'
)
_basename=${pkgname%-git}
provides=("$_basename")
conflicts=("$_basename")
source=("git+${url}")
sha256sums=('SKIP')


pkgver() {
    cd "$srcdir/$_basename"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$_basename"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$_basename"
    cargo build --frozen --release --bin "$_basename"
}


check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$_basename"
    cargo test --frozen --all-features --workspace
}


package() {
    cd "$srcdir/$_basename"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_basename"
    # memtest_vulkan will run in verbose mode if "verbose" is in the binary name
    ln -s "/usr/bin/$_basename" "$pkgdir/usr/bin/${_basename}_verbose"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"

}
