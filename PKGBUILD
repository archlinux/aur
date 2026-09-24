# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=concat
pkgver=0.2.4
pkgrel=1
pkgdesc="Free and open-source CapCut replacement, a video editor with a Rust engine"
arch=('x86_64')
url="https://github.com/jub0t/Concat"
license=('AGPL-3.0-or-later')
# Nothing is spawned at run time: FFmpeg is linked, whisper.cpp and
# sherpa-onnx are compiled in. alsa-lib is cpal's playback backend;
# fontconfig and freetype are the font side of the renderer; libglvnd and
# vulkan-icd-loader are the two backends wgpu picks between, and the rest is
# what winit opens by name for whichever session the user is in. dbus is the
# XDG portal, which is how the file dialogs and "reveal in file manager"
# work without a toolkit. onnxruntime runs the cutout models and is linked
# dynamically, see ORT_LIB_LOCATION in build().
depends=('ffmpeg' 'onnxruntime' 'alsa-lib' 'fontconfig' 'freetype2'
         'libglvnd' 'vulkan-icd-loader' 'libxkbcommon' 'libxkbcommon-x11'
         'libx11' 'libxcursor' 'libxi' 'libxrender' 'wayland' 'dbus'
         'gcc-libs' 'glibc' 'hicolor-icon-theme')
# clang: bindgen (FFmpeg headers, whisper.cpp) needs libclang.
# cmake: whisper.cpp is compiled in, by its own CMake build.
makedepends=('rust' 'cmake' 'clang' 'pkgconf')
# !debug: the app profile strips symbols itself, so there is nothing left to
# split into a debug package.
# !lto: makepkg's lto puts -flto=auto into CFLAGS, and ring - the crypto
# behind the model downloads' TLS - compiles hand-written assembly through
# cc, which comes out as bitcode and links to nothing. Rust's own LTO is set
# in the app profile and is unaffected.
options=('!debug' '!lto')
# Only tags that start with a version are packaged, and pkgver drops their
# hyphens (v0.2.2-alpha.1 -> 0.2.2alpha.1), which pacman sorts older than a
# later plain 0.2.2, so no epoch is needed. See pkg.sh.
_tag="v0.2.4"
# sherpa-onnx-sys (the text-to-speech backend) does not build its C++ side:
# it downloads a prebuilt static-lib archive from its own release page unless
# it is handed one. Handing it one keeps that binary under makepkg's
# checksums instead of arriving unverified from a build script. The version
# follows upstream's Cargo.lock and is synced by pkg.sh.
_sherpa="1.13.7"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jub0t/Concat/archive/refs/tags/${_tag}.tar.gz"
        "https://github.com/k2-fsa/sherpa-onnx/releases/download/v${_sherpa}/sherpa-onnx-v${_sherpa}-linux-x64-static-lib.tar.bz2")
noextract=("sherpa-onnx-v${_sherpa}-linux-x64-static-lib.tar.bz2")
sha256sums=('31d29842832a8f9304cff47722f64ec3f45df7279a484a62037921eca3a7c575' 'd1be7a69ac2b30120058d8302e624239a3064085383cfa47994a14fdc44c32d6')

_srcname="Concat-${_tag#v}"

prepare() {
  cd "$_srcname/src"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$_srcname/src"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # the checksummed archive from source[1], instead of a download in build()
  export SHERPA_ONNX_ARCHIVE_DIR="$srcdir"
  # ort, the ONNX Runtime binding behind the cutout models, downloads a
  # prebuilt runtime from its build script unless it is pointed at one. Arch
  # has the library, so it is linked against that instead - dynamically, so
  # the package follows onnxruntime's updates rather than freezing a copy.
  # Upstream's flake.nix does the same with nixpkgs' onnxruntime.
  export ORT_LIB_LOCATION=/usr/lib
  export ORT_PREFER_DYNAMIC_LINK=1
  # and if that ever stops being picked up, fail the build instead of
  # quietly falling back to the download
  export ORT_SKIP_DOWNLOAD=1
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
  # stripped. See src/Cargo.toml for what each knob is for.
  cargo build --profile app -p concat --frozen \
    --no-default-features --features wgpu
}

package() {
  cd "$_srcname"

  install -Dm755 "src/target/app/concat" "$pkgdir/usr/bin/concat"

  # The desktop entry upstream's release workflow writes into its Linux
  # packages; there is none in the tree, because the Nix build generates its
  # own. Reproduced here, with the Exec line pointing at this package's
  # binary rather than at the /opt folder upstream's .deb installs.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/concat.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Concat
Comment=Video editor
Exec=concat %U
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
