pkgbase=rust-dos
pkgname=('rust-dos' 'libretro-rust-dos')
pkgver=1.5.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/dividebysandwich/rust-dos"
license=('GPL-2.0-or-later')
makedepends=('cargo')
# makepkg's LTO makes GCC bitcode of the C code in ring (RetroAchievements'
# HTTPS), which Rust's linker can't link; cargo does its own LTO.
options=('!lto')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Update with updpkgsums once v$pkgver is tagged.
sha256sums=('e3c52b790766e041b15a313435d09e5c86c83001e61aa861162d9bc61ac3496c')

prepare() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    local target="$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --locked --target "$target"
    # The libretro core is a workspace of its own, with its own Cargo.lock.
    cargo fetch --locked --target "$target" --manifest-path libretro/Cargo.toml
}

build() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # rust-dos-relay is the LAN relay for servers, which needs neither a
    # display nor SDL or a sound library.
    CARGO_TARGET_DIR=target cargo build --frozen --release --bin "$pkgbase" --bin "$pkgbase-relay"
    # The core, without SDL or ALSA, which the frontend has in their place.
    CARGO_TARGET_DIR=target-libretro cargo build --frozen --release --manifest-path libretro/Cargo.toml
}

check() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    CARGO_TARGET_DIR=target cargo test --frozen --release
    CARGO_TARGET_DIR=target-libretro cargo test --frozen --release --manifest-path libretro/Cargo.toml
}

package_rust-dos() {
    pkgdesc="A fast x86 DOS emulator with optional VR support featuring 386 to Pentium CPUs, DPMI host, VGA/VESA/S3/Voodoo, SB16/GUS/MT-32/GM, IDE, PnP, PCI, Win3x, Win95, NE2000 with NAT, IPX and serial multiplayer, RetroAchievements, save states, rewind, and WASM."
    # SDL2 opens the window, the sound device and the OpenGL context of the
    # CRT shaders. ALSA (alsa-lib) sends MIDI out of the system's MIDI ports
    # (midisynth=host in [sound]). munt's libmt32emu plays the Roland MT-32
    # (midisynth=mt32); rust-dos loads it when the MT-32 is chosen, and it
    # needs the MT-32's ROMs, which aren't packaged (mt32roms= in [sound]).
    # Everything else (fonts, disk noises, Ultrasound patches) is built in.
    depends=('alsa-lib' 'glibc' 'hicolor-icon-theme' 'libgcc' 'munt' 'sdl2')
    optdepends=('soundfont-fluid: General MIDI SoundFont for the MPU-401 (soundfont= in [sound])'
                'fluidsynth: software synthesizer to play the MIDI sent out of a MIDI port (midisynth=host)'
                'openxr: OpenXR loader for VR headsets through SteamVR or Monado (mode=headset in [vr])')

    cd "$pkgbase-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0755 "target/release/$pkgname-relay" "$pkgdir/usr/bin/$pkgname-relay"
    install -Dm0644 "packaging/linux/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm0644 "packaging/linux/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 CONFIGURATION.md "$pkgdir/usr/share/doc/$pkgname/CONFIGURATION.md"
    install -Dm0644 rust-dos.conf.example "$pkgdir/usr/share/doc/$pkgname/rust-dos.conf.example"
}

package_libretro-rust-dos() {
    pkgdesc="Rust-DOS fast x86 DOS emulator as a libretro core, for RetroArch and the other libretro frontends"
    # munt's libmt32emu plays the MT-32 (midisynth=mt32), loaded when it is
    # chosen. SoundFonts and MT-32 ROMs go in RetroArch's system/rust-dos
    # folder, set in rust-dos.conf there.
    depends=('glibc' 'libgcc')
    optdepends=('retroarch: the libretro frontend'
                'munt: Roland MT-32 emulation (midisynth=mt32)'
                'soundfont-fluid: General MIDI SoundFont for the MPU-401 (soundfont= in rust-dos.conf)')

    cd "$pkgbase-$pkgver"
    install -Dm0644 target-libretro/release/librust_dos_libretro.so "$pkgdir/usr/lib/libretro/rust_dos_libretro.so"
    # Until libretro-core-info has it.
    install -Dm0644 libretro/rust_dos_libretro.info "$pkgdir/usr/share/libretro/info/rust_dos_libretro.info"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 libretro/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
