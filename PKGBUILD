pkgname=rust-dos
pkgver=0.5.0
pkgrel=1
pkgdesc="An x86 DOS emulator written in Rust, with Sound Blaster, AdLib, Gravis Ultrasound, General MIDI, Roland MT-32 and Tandy sound, CGA composite colours and CRT shaders"
arch=('x86_64' 'aarch64')
url="https://github.com/dividebysandwich/rust-dos"
license=('GPL-2.0-or-later')
# SDL2 opens the window, the sound device and the OpenGL context of the CRT
# shaders. ALSA (alsa-lib) sends MIDI out of the system's MIDI ports
# (midisynth=host in [sound]). munt's libmt32emu plays the Roland MT-32
# (midisynth=mt32); rust-dos loads it when the MT-32 is chosen, and it needs
# the MT-32's ROMs, which aren't packaged (mt32roms= in [sound]). Everything
# else (fonts, disk noises, Ultrasound patches) is built in.
depends=('alsa-lib' 'glibc' 'hicolor-icon-theme' 'libgcc' 'munt' 'sdl2')
makedepends=('cargo')
optdepends=('soundfont-fluid: General MIDI SoundFont for the MPU-401 (soundfont= in [sound])'
            'fluidsynth: software synthesizer to play the MIDI sent out of a MIDI port (midisynth=host)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Update with updpkgsums once v0.5.0 is tagged.
sha256sums=('bbedd2c9f770809a030d4284f1e45df1cc43e3cb2913ce302406a384d7d88ca6')

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
    export CARGO_TARGET_DIR=target
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
