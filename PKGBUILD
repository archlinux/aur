# Maintainer: Kenny <onlyusemycontroler@gmail.com>
#
# Builds from the tagged source. For the prebuilt binaries, see `lightforge-bin`.

pkgname=lightforge
pkgver=1.0.0beta.12
pkgrel=1
# The upstream tag. AUR versions may not contain a hyphen, so `1.0.0-beta.5`
# becomes `1.0.0beta.5` here — which `vercmp` orders *before* `1.0.0`, so the
# eventual stable release upgrades cleanly and needs no `epoch`.
_tag=v1.0.0-beta.12
pkgdesc='Install, update and play World of Warcraft on Linux, and a home for all your other Battle.net games'
arch=('x86_64')
url='https://github.com/LightforgeProject/lightforge'
license=('GPL-3.0-or-later')
# The launcher opens Vulkan, Wayland and X11 at run time rather than linking
# them, so there is nothing to depend on but libc and libudev (gamepads) — and
# it falls back to software rendering by itself when there is no GPU it can use.
depends=('glibc' 'gcc-libs' 'fontconfig' 'ttf-font' 'systemd-libs' 'python')
makedepends=('cargo')
optdepends=(
  'lib32-gnutls: 32-bit runtime for Battle.net (needs multilib)'
  'lib32-freetype2: 32-bit runtime for Battle.net (needs multilib)'
  'lib32-vulkan-icd-loader: 32-bit runtime for Battle.net (needs multilib)'
  'mangohud: the in-game overlay Lightforge can enable per game'
  'xdg-desktop-portal-impl: the file and folder pickers'
)
conflicts=('lightforge-bin')
# `makepkg` adds `-flto=auto` to CFLAGS by default, and `ring` compiles C and
# assembly of its own: the objects come out as LLVM bitcode and the link fails
# with a screen of `undefined symbol: ring_core_0_17_14__*`. Cargo does its own
# LTO anyway — `lto = "thin"` in the workspace's release profile.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
# Of GitHub's generated source archive for the tag, which is not
# byte-identical to anything produced locally. Regenerate with `updpkgsums`
# once the tag is pushed, before uploading.
sha256sums=('8fed967cd89cbfb05021b47b4fde92ae12e88f9bb7c61026f606a5f6eb9dcb3b')
_srcdir="$pkgname-${_tag#v}"

prepare() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The tests that reach Blizzard's CDN are `#[ignore]`d; what runs here is
  # offline and takes seconds.
  cargo test --frozen --release --workspace
}

package() {
  cd "$_srcdir"

  install -Dm755 target/release/lightforge-gui "$pkgdir/usr/bin/lightforge-gui"
  install -Dm755 target/release/lightforge     "$pkgdir/usr/bin/lightforge"

  install -Dm644 packaging/pro.tuxcore.Lightforge.desktop \
    "$pkgdir/usr/share/applications/pro.tuxcore.Lightforge.desktop"
  install -Dm644 packaging/pro.tuxcore.Lightforge.metainfo.xml \
    "$pkgdir/usr/share/metainfo/pro.tuxcore.Lightforge.metainfo.xml"

  local size
  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "packaging/icons/hicolor/${size}x${size}/apps/pro.tuxcore.Lightforge.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/pro.tuxcore.Lightforge.png"
  done
  install -Dm644 packaging/icons/hicolor/scalable/apps/pro.tuxcore.Lightforge.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/pro.tuxcore.Lightforge.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    README.md RELEASES.md TROUBLESHOOTING.md docs/CLI.md
}
