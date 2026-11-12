# Maintainer: executter <executter at hotmail dot com>

pkgname=bankperfect
pkgver=9.11.2
pkgrel=1
pkgdesc='Personal bank account manager: transactions, reconciliation, budgets and reports'
arch=('x86_64')
url='https://github.com/fabiochelly/bankperfect'
# Cargo links every crate statically: the binary contains BankPerfect,
# the Luau interpreter and about 300 crates. Inventory taken from
# "cargo tree -e normal,no-proc-macro" for this target (see package()),
# with libzstd taken from the system.
license=(
  # BankPerfect, Luau (luau0-src), Hack font (egui) and many crates
  'MIT'
  # Most crates
  'MIT OR Apache-2.0'
  # Inter font (BankPerfect), Noto Emoji (egui)
  'OFL-1.1'
  # Ubuntu Light font (egui). SPDX: Ubuntu-font-1.0 (list 3.25), which
  # the licenses package does not list yet, hence the custom route.
  'LicenseRef-Ubuntu-font-1.0'
  # Hack font, derived from Bitstream Vera (egui)
  'Bitstream-Vera'
  # winit, codespan-reporting, owned_ttf_parser, spirv, zopfli, ring (with ISC)
  'Apache-2.0'
  # bytemuck, cursor-icon, glow, miniz_oxide, raw-window-handle, tinyvec
  'MIT OR Apache-2.0 OR Zlib'
  # rustix, linux-raw-sys
  'Apache-2.0 WITH LLVM-exception OR Apache-2.0 OR MIT'
  # rustls
  'Apache-2.0 OR ISC OR MIT'
  # zerocopy
  'BSD-2-Clause OR Apache-2.0 OR MIT'
  # adler2
  '0BSD OR MIT OR Apache-2.0'
  # memchr, byteorder-lite
  'MIT OR Unlicense'
  # moxcms, pxfm
  'Apache-2.0 OR BSD-3-Clause'
  # self_cell
  'Apache-2.0 OR GPL-2.0-only'
  # curve25519-dalek, ed25519-dalek, subtle, zstd bindings, WHATWG data
  # (encoding_rs)
  'BSD-3-Clause'
  # ring, libloading, rustls-webpki, simple_asn1, untrusted
  'ISC'
  # foldhash, zlib-rs
  'Zlib'
  # nucleo-matcher, option-ext
  'MPL-2.0'
  # bip39, bitcoin_hashes, hex-conservative
  'CC0-1.0'
  # Unicode data (unicode-ident)
  'Unicode-3.0'
  # Mozilla root certificates (webpki-roots)
  'CDLA-Permissive-2.0'
)
depends=(
  'dbus'  # dlopen'd: file dialogs through the XDG portal (rfd)
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'  # dlopen'd: EGL, OpenGL rendering
  'libstdc++'
  # dlopen'd: X11 and Wayland windowing (winit, x11rb)
  'libx11'
  'libxcb'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  'wayland'
  'vulkan-icd-loader'  # dlopen'd: Vulkan rendering (wgpu)
  'xdg-desktop-portal'
  'xdg-utils'  # opens links and exported spreadsheets
  'zstd'
)
makedepends=('cargo')
optdepends=(
  'vulkan-driver: Vulkan rendering, OpenGL is used otherwise'
  'zenity: file dialogs without an XDG portal backend'
)
# cc-rs builds Luau and ring with CFLAGS: with -flto their objects only
# hold GCC bytecode, which the linker of rustc (lld) cannot read.
options=('!lto')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('40af91e88e360d76ed09a80b9827d5c873e81fa461b5ae7f0f4d03c84096154a')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Link the system libzstd instead of the copy bundled with zstd-sys
  export ZSTD_SYS_USE_PKG_CONFIG=1
  # Cargo strips the debug information of release builds by default:
  # leave that to makepkg, which moves it to the debug package.
  export CARGO_PROFILE_RELEASE_STRIP=false
  cargo build --frozen --release -p bankperfect
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export ZSTD_SYS_USE_PKG_CONFIG=1
  # Debug profile: building the tests in release would rebuild the
  # binary with the features of the dev-dependencies. The tests on old
  # .bp files only run when such files sit next to the sources, and the
  # screenshot tests (GPU) are ignored by default.
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable

  install -Dm755 target/release/bankperfect -t "$pkgdir/usr/bin"
  install -Dm644 packaging/linux/bankperfect.desktop \
    -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/linux/bankperfect-mime.xml \
    "$pkgdir/usr/share/mime/packages/bankperfect.xml"
  local _icons=crates/bp-app/assets/icon _size
  for _size in 16 32 48 64 128 256 512; do
    install -Dm644 "$_icons/bankperfect-$_size.png" \
      "$pkgdir/usr/share/icons/hicolor/${_size}x$_size/apps/bankperfect.png"
  done
  install -Dm644 "$_icons/bankperfect.svg" \
    -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"

  local _lic="$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE crates/bp-app/assets/fonts/Inter-OFL.txt -t "$_lic"

  # License files of the crates linked into the binary, and an index
  # with the license each one declares. Some crates (egui, mlua-sys...)
  # ship no license file: the index is all there is for them.
  local _host _crate _spdx _dir
  _host=$(rustc --print host-tuple)
  {
    cargo tree --frozen -p bankperfect -e normal,no-proc-macro \
      --target "$_host" --prefix none --format '{p}|{l}'
    # Built by mlua-sys as a static library
    cargo tree --frozen -e build,normal,no-proc-macro --target "$_host" \
      -i luau0-src --depth 0 --prefix none --format '{p}|{l}'
  } | sed -nE 's/ \(\*\)$//; s/^([^ ]+) v([^ |]+)\|(.*)$/\1-\2 \3/p' \
    | sort -u > crates.txt
  # The pipeline hides a failure of cargo tree
  [[ $(wc -l < crates.txt) -gt 250 ]]
  install -Dm644 crates.txt -t "$_lic"
  while read -r _crate _spdx; do
    for _dir in "${CARGO_HOME:-$HOME/.cargo}"/registry/src/*/"$_crate"; do
      [[ -d $_dir ]] && break
    done
    find "$_dir" -maxdepth 1 -type f -iregex \
      '.*/\(licen[cs]e\|copying\|copyright\|notice\|unlicense\)[^/]*' \
      -exec install -Dm644 -t "$_lic/crates/$_crate" {} +
    # The default egui fonts keep their licenses next to them
    if [[ $_crate == epaint_default_fonts-* ]]; then
      install -Dm644 "$_dir"/fonts/*.txt -t "$_lic/crates/$_crate"
    fi
  done < crates.txt
}
