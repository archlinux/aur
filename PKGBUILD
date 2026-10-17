# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=yapfast
pkgver=0.1.0
pkgrel=1
_commit=74848a170d545c153f99f4a1211277d450f05f82
_id=io.github.yapfast.Yapfast
# The prebuilt native parts the release is built against (nix/flake.nix at this commit): LiveKit's
# libwebrtc, and the Skia 0.153.3 archive Cargo.toml pins. Both are x86_64 Linux only.
_webrtc=webrtc-51ef663
_skia=skia-binaries-b7f043e0b1e2a850e702-x86_64-unknown-linux-gnu-ganesh-gl-jpegd-jpege-pdf-vulkan.tar.gz
pkgdesc='Native Discord client that stays light on memory'
arch=(x86_64)
url='https://yapfast.com'
license=(GPL-3.0-or-later OFL-1.1)
# Atkinson Hyperlegible Next, the UI typeface, is embedded in the binary from ui/fonts (OFL-1.1).
# DT_NEEDED carries only glibc, fontconfig, freetype2, glib2, libgcc, libpulse and libstdc++; the rest
# is opened with dlopen, which is why namcap calls each of them unneeded. A Wayland session loads
# libwayland-client and libxkbcommon, an X11 one libX11, libxcb, libXcursor, libXi and
# libxkbcommon-x11, and a call loads alsa-lib. LD_DEBUG=files shows which ones a session takes.
depends=(
  alsa-lib fontconfig freetype2 glib2 glibc hicolor-icon-theme libgcc libpulse libstdc++
  libx11 libxcb libxcursor libxi libxkbcommon libxkbcommon-x11 wayland
)
optdepends=(
  'libglvnd: render with the GPU'
  'vulkan-icd-loader: render with the GPU'
  'noto-fonts-emoji: colour emoji'
  'pipewire: screen sharing'
  'libdrm: screen sharing'
  'mesa: screen sharing (libgbm)'
  'libxcomposite: screen sharing on X11'
  'libxdamage: screen sharing on X11'
  'libxext: screen sharing on X11'
  'libxfixes: screen sharing on X11'
  'libxrandr: screen sharing on X11'
)
makedepends=(rust clang cmake curl llvm21 pkgconf protobuf python)
# webrtc-sys compiles C++ with clang while rustc links with its own LLVM; LTO objects are not
# interchangeable between them.
options=(!lto)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/yapfast/yapfast/archive/$_commit.tar.gz"
  "$_webrtc-linux-x64-release.zip::https://github.com/livekit/rust-sdks/releases/download/$_webrtc/webrtc-linux-x64-release.zip"
  "https://github.com/rust-skia/skia-binaries/releases/download/0.153.3/$_skia"
)
# skia-safe reads the archive itself, as SKIA_BINARIES_URL; extracting it only litters $srcdir.
noextract=("$_skia")
sha256sums=('dff9dc701948b102daff6a5e7af8f7ecf2d08aef185963169912e07173e91673'
            'dce9d9414cd8e2cc9a471c054481851b257ad2a879112ce5be56369b4fefdaed'
            '9ebe4c448cc9f789bad241cbd11739cdf759e27db5719c23a7635e096d5807b3')

prepare() {
  cd "$pkgname-$_commit"
  # rust-toolchain.toml pins 1.97.1 and would make a rustup shim download it; build with the
  # toolchain Arch ships.
  export RUSTUP_TOOLCHAIN=stable
  # Cargo.lock's crates.io and git dependencies cannot be declared in source=(); fetch them here so
  # the build itself runs offline.
  cargo fetch --locked --target host-tuple
  # Skia's prebuilt archive defines the same libjpeg symbols as libwebrtc's, and the two land in one
  # binary: nix/prepare-skia-native.py renames the table to one Skia owns, then proves byte for byte
  # that nothing but that symbol name moved. The helper pins LLVM 21.1.7; Arch's llvm21 is a later
  # 21.x, and the byte-level check it runs is the actual guarantee.
  sed "s/'LLVM version 21.1.7\\\\n'/'LLVM version 21.'/" nix/prepare-skia-native.py > "$srcdir/prepare-skia.py"
  grep -q "'LLVM version 21.'" "$srcdir/prepare-skia.py"
  YAPFAST_SKIA_SOURCE="$srcdir/$_skia" YAPFAST_SKIA_OUTPUT="$srcdir/skia" \
    YAPFAST_SKIA_OBJCOPY=/usr/lib/llvm21/bin/llvm-objcopy YAPFAST_SKIA_NM=/usr/lib/llvm21/bin/llvm-nm \
    python "$srcdir/prepare-skia.py"
}

build() {
  cd "$pkgname-$_commit"
  export RUSTUP_TOOLCHAIN=stable CC=clang CXX=clang++ PROTOC=/usr/bin/protoc
  # The prebuilt native stacks the build links against, instead of the network ones their build
  # scripts would fetch.
  export LK_CUSTOM_WEBRTC="$srcdir/linux-x64-release"
  export SKIA_BINARIES_URL="file://$srcdir/skia/$_skia"
  # Rust's panic locations and C/C++'s __FILE__ would otherwise name the builder's directories.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  export CFLAGS="${CFLAGS:-} -ffile-prefix-map=$srcdir=/usr/src/debug/$pkgname"
  export CXXFLAGS="${CXXFLAGS:-} -ffile-prefix-map=$srcdir=/usr/src/debug/$pkgname"
  # Cargo's release profile strips at link time (Cargo.toml), leaving makepkg's debug option with
  # nothing to split, so makepkg gets the symbols instead.
  check_option debug y && export CARGO_PROFILE_RELEASE_STRIP=false
  # The Discord-only feature set the releases ship.
  cargo build --frozen --release --no-default-features --features desktop,discord
}

# No check(): upstream's tests need a display and its fake Discord server (nix/package.nix).

package() {
  cd "$pkgname-$_commit"
  install -Dm755 target/release/yapfast "$pkgdir/usr/bin/yapfast"
  install -Dm644 packaging/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_id.svg"
  install -Dm644 "packaging/linux/$_id.desktop" "$pkgdir/usr/share/applications/$_id.desktop"
  install -Dm644 ui/fonts/LICENSE-OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-OFL.txt"
}

latestver() {
  gh api --paginate repos/yapfast/yapfast/tags --jq '.[].name' |
    sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}
