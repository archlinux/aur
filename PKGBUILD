# Maintainer: Envoy5371 <aur.underpass328 at simplelogin dot com>
pkgname=niform
pkgver=0.2.0
pkgrel=1
pkgdesc='Shader-based audio visualizer for Wayland'
arch=('x86_64')
url='https://gitlab.com/khailz04/niform'
license=('MIT')
depends=('gcc-libs' 'glibc' 'libpulse' 'wayland')
optdepends=(
    'libglvnd: OpenGL rendering backend'
    'vulkan-icd-loader: Vulkan rendering backend'
)
makedepends=('cargo' 'libxkbcommon')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('f65b9b112643ee3e694ab5bfb47bd9af367c9a63bdaa91caeacfc2d4ea1daf6eeb830f8295a5513ba069854b670c3b4852e0739cd5df3b2f428077aacf61c7d5')

_archive="$pkgname-v$pkgver"

prepare() {
    cd "$_archive"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_archive"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$_archive"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$_archive"
    install -Dm0755 target/release/niform         "$pkgdir/usr/bin/niform"
    install -Dm0644 contrib/niform.service        "$pkgdir/usr/lib/systemd/user/niform.service"
    install -Dm0644 LICENSE                       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 CHANGELOG.md                  "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm0644 shaders/*.wgsl -t             "$pkgdir/usr/share/niform/shaders/"
}
