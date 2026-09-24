# Maintainer: dividebysandwich <josef.jahn@gmail.com>

pkgname=rust-dos
pkgver=0.4.1
pkgrel=1
pkgdesc="An x86 DOS emulator written in Rust, with Sound Blaster, AdLib, Gravis Ultrasound and General MIDI sound and CRT shaders"
arch=('x86_64' 'aarch64')
url="https://github.com/dividebysandwich/rust-dos"
license=('GPL-2.0-or-later')
# SDL2 opens the window, the sound device and the OpenGL context of the CRT
# shaders. Everything else (fonts, disk noises, Ultrasound patches) is built in.
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'sdl2')
makedepends=('cargo')
optdepends=('soundfont-fluid: General MIDI SoundFont for the MPU-401 (soundfont= in [sound])')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4be473e90787260bade31457fb879af7e73fe31c90f7da0a4747b16d7d693560')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin "$pkgname"
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 "packaging/linux/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm0644 "packaging/linux/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 rust-dos.conf.example "$pkgdir/usr/share/doc/$pkgname/rust-dos.conf.example"
}
