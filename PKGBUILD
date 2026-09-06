# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=concat-git
pkgver=0.2.1.r12.geef4579
pkgrel=1
pkgdesc="Free and open-source CapCut replacement, a video editor with a Rust engine (git)"
arch=('x86_64')
url="https://github.com/jub0t/Concat"
license=('AGPL-3.0-or-later')
# Nothing is spawned at run time: FFmpeg is linked, whisper.cpp and
# sherpa-onnx are compiled in. alsa-lib is cpal's playback backend;
# fontconfig and freetype are the font side of the renderer; libglvnd and
# vulkan-icd-loader are the two backends wgpu picks between, and the rest is
# what winit opens by name for whichever session the user is in. dbus is the
# XDG portal, which is how the file dialogs and "reveal in file manager"
# work without a toolkit.
depends=('ffmpeg' 'alsa-lib' 'fontconfig' 'freetype2' 'libglvnd'
         'vulkan-icd-loader' 'libxkbcommon' 'libxkbcommon-x11' 'libx11'
         'libxcursor' 'libxi' 'libxrender' 'wayland' 'dbus' 'gcc-libs'
         'glibc' 'hicolor-icon-theme')
# clang: bindgen (FFmpeg headers, whisper.cpp) needs libclang.
# cmake: whisper.cpp is compiled in, by its own CMake build.
makedepends=('rust' 'cmake' 'clang' 'pkgconf' 'git')
provides=('concat')
conflicts=('concat')
# !debug: the app profile strips symbols itself, so there is nothing left to
# split into a debug package.
# !lto: makepkg's lto puts -flto=auto into CFLAGS, and ring - the crypto
# behind the model downloads' TLS - compiles hand-written assembly through
# cc, which comes out as bitcode and links to nothing. Rust's own LTO is set
# in the app profile and is unaffected.
options=('!debug' '!lto')
source=("${pkgname}::git+https://github.com/jub0t/Concat.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 --tags --match 'v[0-9]*' \
    | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "$pkgname/engine"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname/engine"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # ggml (whisper.cpp's kernels) tunes itself to the machine it is compiled
  # on unless told otherwise. A package is not always built on the machine it
  # runs on, and a binary that faults on a CPU without AVX-512 is a bad trade
  # for kernels nobody measured. Off, it compiles to the portable baseline.
  export GGML_NATIVE=OFF

  # --features wgpu: FemtoVG over wgpu instead of the default Skia renderer.
  # skia-bindings downloads prebuilt binaries from its build script, which a
  # package cannot do; the wgpu renderer is pure Rust. This is the same
  # choice, for the same reason, that upstream's flake.nix makes.
  #
  # --profile app: upstream's shipping profile - fat LTO, panic=abort,
  # stripped. See engine/Cargo.toml for what each knob is for.
  #
  # sherpa-onnx-sys, the text-to-speech backend, ships no C++ build: its build
  # script downloads a prebuilt static-lib archive from its own release page.
  # concat pins that archive as a checksummed source; here the version moves
  # with main, so the build script fetches it - build() needs the network.
  cargo build --profile app -p concat --frozen \
    --no-default-features --features wgpu
}

package() {
  cd "$pkgname"

  install -Dm755 "engine/target/app/concat" "$pkgdir/usr/bin/concat"

  # The desktop entry upstream's release workflow writes into the Linux
  # tarball; there is none in the tree, because the Nix build generates its
  # own. Reproduced here so this package and concat-bin install the same one.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/concat.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Concat
Comment=Video editor
Exec=concat
Icon=concat
Categories=AudioVideo;Video;
Terminal=false
EOF

  install -Dm644 "assets/icons/concat_logo_256.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/concat.png"
  install -Dm644 "assets/concat_logo_512.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/concat.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE-EXCEPTIONS.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-EXCEPTIONS.md"
  install -Dm644 THIRD_PARTY_NOTICES.md \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
}
