# Maintainer: serverjonas <https://github.com/serverjonas>
# Contributor: serverjonas <https://github.com/serverjonas>

pkgname=newshow-git
pkgver=0.1.0.r5.g626cccc
pkgrel=1
pkgdesc='High-performance terminal video player in Rust (pure ANSI/Unicode output)'
arch=('x86_64' 'aarch64')
url='https://github.com/serverjonas/newshow'
license=('MIT')
groups=()
# NOTE on runtime dependencies:
# The Cargo.toml enables the "build" feature of ffmpeg-next, which makes
# ffmpeg-sys-next compile FFmpeg 7.1 *statically* into the binary
# (--enable-static --disable-shared --disable-autodetect; verified in
# config.h and with ldd). The resulting binary therefore only links
# against glibc (libc/libm) and libgcc_s:
depends=('glibc' 'gcc-libs')
# If you ever switch to system FFmpeg (remove the "build" feature), replace
# the line above with:
#   depends=('glibc' 'gcc-libs' 'ffmpeg')
makedepends=(
  'rust'         # Rust toolchain + cargo (project is edition 2021)
  'clang'        # libclang for bindgen (ffmpeg-sys-next generates its FFI bindings)
  'git'          # ffmpeg-sys-next clones FFmpeg 7.1 from git during the build
  'gcc'          # C compiler for the bundled FFmpeg build
  'make'         # FFmpeg build system
  'perl'         # FFmpeg build system (version-script generation, tests)
  'nasm'         # x86_64 assembly for the bundled FFmpeg build
  'pkg-config'   # probed by ffmpeg-sys-next (only used if not building bundled FFmpeg)
)
checkdepends=()
# No check(): the project ships no unit tests, and `cargo test` would compile
# the entire bundled FFmpeg a second time in the debug profile.
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!lto')  # the project defines its own optimized release profile (codegen-units=1)
install=
changelog=
source=("$pkgname::git+https://github.com/serverjonas/newshow.git")
noextract=()
validpgpkeys=()
sha256sums=('SKIP')

# License note: the project itself is MIT (see LICENSE). The statically
# bundled FFmpeg is "LGPL version 2.1 or later". Since the package always
# builds from source, LGPL static-linking obligations are satisfied.

pkgver() {
  cd "$pkgname"
  # No git tags upstream yet -> 0.1.0.r<commits>.g<hash>
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  # Download/verify all crates.io dependencies up front, honoring Cargo.lock
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host:/--target=/p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # RUSTC_WRAPPER (e.g. sccache) breaks the bundled FFmpeg build
  # (see README / project build notes).
  env -u RUSTC_WRAPPER cargo build --release --frozen
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/show "$pkgdir/usr/bin/newshow"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
