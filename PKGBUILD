# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=concat-git
pkgver=0.2.0.alpha.16.r0.g8938ec3
pkgrel=1
pkgdesc="Free and open-source CapCut replacement, a Tauri video editor with a Rust engine (git)"
arch=('x86_64')
url="https://github.com/jub0t/Concat"
license=('MPL-2.0')
# glib-networking is what gives the webview a TLS backend; alsa-lib is the
# engine's cpal playback backend; every media operation spawns the ffmpeg
# pair - see the WOLFCUT_SYSTEM_TOOLS note below. The model downloads carry
# their own TLS (rustls), so nothing here links openssl.
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'libsoup3' 'gdk-pixbuf2' 'cairo'
         'dbus' 'glib-networking' 'alsa-lib' 'ffmpeg' 'gcc-libs' 'glibc'
         'hicolor-icon-theme')
makedepends=('rust' 'npm' 'pkgconf' 'git')
# wgpu picks its backend at run time: Vulkan first, GL as the fallback. Both
# loaders come from the driver stack every desktop already has, so neither is
# a hard dependency of the editor.
optdepends=('whisper-cpp: on-device auto-captions and transcription'
            'vulkan-icd-loader: Vulkan compositor backend'
            'libglvnd: OpenGL compositor backend')
provides=('concat')
conflicts=('concat')
# !debug: the release profile already sets strip = true, so there is nothing
# left to split into a debug package.
# !lto: makepkg's lto puts -flto=auto into CFLAGS, and ring - the crypto
# behind the model downloads' TLS - compiles hand-written assembly through
# cc, which comes out as bitcode and links to nothing. Rust's own LTO is set
# in the release profile and is unaffected.
options=('!debug' '!lto')
source=("${pkgname}::git+https://github.com/jub0t/Concat.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 --tags --match 'v[0-9]*' \
    | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "$pkgname/desktop"

  # the frontend toolchain (vite, tsc, tailwind) and the crate registry
  npm ci --cache "$srcdir/npm-cache"

  export RUSTUP_TOOLCHAIN=stable
  cd src-tauri
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname/desktop"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # build.rs refuses a release build without a staged ffmpeg/whisper-cli,
  # because a bundle that ships without them is broken when launched from a
  # desktop file with no PATH to fall back on. A distribution package is the
  # documented exception: the lookups fall back to PATH, and ffmpeg and
  # whisper-cpp are packaged for Arch already.
  export WOLFCUT_SYSTEM_TOOLS=1

  # vite build -> desktop/dist, which tauri-build embeds into the binary
  npm run build

  cd src-tauri
  # sherpa-onnx-sys, the text-to-speech backend, ships no C++ build: its build
  # script downloads a prebuilt static-lib archive from its own release page.
  # concat pins that archive as a checksummed source; here the version moves
  # with main, so the build script fetches it - build() needs the network.
  cargo build --release --frozen
}

package() {
  cd "$pkgname"

  # same paths the upstream .deb installs: the project is mid-rename and its
  # executable, desktop entry and icons all still carry the old name
  install -Dm755 "desktop/src-tauri/target/release/wolfcut-desktop" \
    "$pkgdir/usr/bin/wolfcut-desktop"

  # the AUR package is named after the project, the executable after what the
  # project used to be called - keep it reachable under both
  ln -s wolfcut-desktop "$pkgdir/usr/bin/concat"

  # tauri only writes a desktop entry when it bundles, and the one it puts in
  # the .deb has an empty Categories=. This is that entry with the categories
  # upstream's Nix build sets.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/WolfCut.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=WolfCut
Comment=Free and open source video editor
Exec=wolfcut-desktop
Icon=wolfcut-desktop
Terminal=false
Categories=AudioVideo;AudioVideoEditing;
StartupWMClass=wolfcut-desktop
EOF

  install -Dm644 "desktop/src-tauri/icons/32x32.png" \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/wolfcut-desktop.png"
  install -Dm644 "desktop/src-tauri/icons/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/wolfcut-desktop.png"
  install -Dm644 "desktop/src-tauri/icons/128x128@2x.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/wolfcut-desktop.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
