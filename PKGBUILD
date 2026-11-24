# Maintainer: Shaun Lastra <shaun@lastra.us>

# Two packages from one build: hoja, and the thumbnailer for 3D printing files.
# The thumbnailer is a package of its own because it is not a part of hoja.
# hoja finds it as it finds every other thumbnailer, and other file managers
# use it too.
pkgbase=hoja-git
pkgname=(hoja-git hoja-model-thumbnailer-git)
_pkgname=hoja
pkgver=r245.073131f
pkgrel=1
pkgdesc='GPU-accelerated file manager with splittable panes, built on GPUI'
arch=('x86_64')
url='https://github.com/slastra/hoja'
license=('GPL-3.0-or-later')

# Linked directly. Everything else the binary pulls in — brotli, bzip2, expat,
# libpng, zlib, libxcb — arrives through these.
depends=(
  'fontconfig'
  'freetype2'
  'libxkbcommon'
  'libxkbcommon-x11'
  # Loaded at run time by the renderer rather than linked, so it is invisible
  # to ldd. Without it the window never opens.
  'vulkan-icd-loader'
)
# Not listed, but relied on: util-linux, for `setsid -f` (every launch detaches
# through it, so without it nothing opens at all) and `lsblk` (the place finder's
# drive list). It is a dependency of `base`, which Arch guarantees, and base
# members are conventionally left out of depends.

# hoja shells out for these, and works without each one: no git means no
# version-control colouring, no udisks means drives can be listed but not
# mounted, and so on. None is required to start. Video and PDF pictures come
# from whatever freedesktop thumbnailer is installed: ffmpegthumbnailer and
# papers are one choice each, and totem, gst-thumbnailers or evince do as well.
optdepends=(
  'hoja-model-thumbnailer-git: pictures of STL, 3MF and G-code files'
  'git: colour file names by version control status'
  'xdg-utils: open files with their default application'
  'wl-clipboard: copy and paste files with other applications'
  'libnotify: desktop notification when a long transfer finishes'
  'udisks2: mount attached drives from the place finder'
  'shared-mime-info: identify file types for the Open With menu'
  'ffmpegthumbnailer: pictures of videos in previews and the grid'
  'papers: pictures of PDFs in previews and the grid'
  'poppler: page count and page shape of a PDF preview'
  'vulkan-radeon: Vulkan driver for AMD graphics'
  'nvidia-utils: Vulkan driver for NVIDIA graphics'
  'vulkan-intel: Vulkan driver for Intel graphics'
)

makedepends=('git' 'cargo' 'clang' 'cmake' 'pkgconf' 'wayland-protocols')

# Arch turns LTO on by default, which puts -flto in the flags the cc crate uses
# for C and assembly. Wasmtime — pulled in through GPUI — implements its
# unwinding longjmp in hand-written assembly, and LTO drops it, so the link
# fails on an undefined wasmtime_longjmp symbol. Cargo applies its own LTO from
# the release profile regardless, so nothing is lost.
options=('!lto')
provides=('hoja')
conflicts=('hoja')
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  # --locked: Cargo.lock is committed, and it pins the GPUI dependency to one
  # revision. Resolving afresh would silently build against a different one.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # No --all-features: neither crate declares any, so it does nothing today and
  # would silently opt in to whichever one gets added first.
  # Not the whole workspace: hoja-drag and hoja-transfer are libraries that
  # hoja links, and a plain `cargo build` at the root builds hoja alone.
  cargo build --frozen --release -p hoja -p hoja-model-thumbnailer
}

check() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  # Only the application's own tests. The transfer engine's suite deliberately
  # straddles two filesystems — it puts one directory under CARGO_TARGET_TMPDIR
  # and another under /tmp to force EXDEV and exercise the copy fallback — so it
  # asserts something about the machine it runs on, not about the code, and
  # fails where a build root has both on the same filesystem.
  cargo test --frozen --release -p hoja -p hoja-model-thumbnailer
}

package_hoja-git() {
  cd "$_pkgname"
  install -Dm755 target/release/hoja "$pkgdir/usr/bin/hoja"
  install -Dm644 packaging/hoja.desktop \
    "$pkgdir/usr/share/applications/hoja.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_hoja-model-thumbnailer-git() {
  pkgdesc='Thumbnailer for STL, 3MF and G-code files, drawn on the CPU'
  depends=('glibc' 'libgcc')
  optdepends=()
  provides=('hoja-model-thumbnailer')
  conflicts=('hoja-model-thumbnailer')
  cd "$_pkgname"
  install -Dm755 target/release/hoja-model-thumbnailer \
    "$pkgdir/usr/bin/hoja-model-thumbnailer"
  install -Dm644 packaging/hoja-model.thumbnailer \
    "$pkgdir/usr/share/thumbnailers/hoja-model.thumbnailer"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
