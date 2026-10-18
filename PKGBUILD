# Maintainer: ClipForge contributors
#
# NOT used by anything in this repo (no Makefile target or CI job builds
# from this file) — it's a template to copy into a separate AUR package
# git repository (ssh://aur@aur.archlinux.org/clipforge.git), which is
# where AUR packages actually live. Unlike packaging/linux/pacman/PKGBUILD
# (which builds from an already-checked-out clone of this repo), an AUR
# package repo only ever contains PKGBUILD + .SRCINFO, so this one has to
# download its own copy of the source instead of assuming one exists.
#
# Split package, mirroring packaging/linux/pacman/PKGBUILD: `clipforge` is
# the default build, `clipforge-kde` additionally compiles Slint's "qt"
# style in (the `qt-style` Cargo feature) so std-widgets controls render via
# the user's actual KDE QStyle. `yay -S clipforge-kde` installs the variant
# directly — pacman has no pip-style `pkg[extra]` syntax, but a split
# package from one PKGBUILD is the equivalent: one source recipe, one clean
# install command per variant.
#
# Before publishing a new version:
#   1. Bump pkgver to match the vX.Y.Z tag you're packaging (reset pkgrel to 1).
#   2. Run `updpkgsums` in this directory to replace the sha256sums placeholder
#      with the real hash of that tag's source tarball.
#   3. Run `makepkg --printsrcinfo > .SRCINFO` and commit both files.
pkgbase=clipforge
pkgname=('clipforge' 'clipforge-kde')
pkgver=1.3.1
pkgrel=1
arch=('x86_64')
url="https://github.com/ivanharvard/clipforge"
license=('MIT')
makedepends=('cargo' 'qt6-base')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ivanharvard/clipforge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5c62d3682b8182bae010f612a9d1fd0a5a84f75b5d04a4c00465a19c553e72f')
# See packaging/linux/pacman/PKGBUILD for why LTO is disabled: it corrupts
# qttypes' C++ codegen in the clipforge-kde build.
options=('!lto')

prepare() {
  cd "$pkgbase-$pkgver"
  # AUR's own build tooling disallows network access inside build(); prepare()
  # still has it, so fetch every crate here and let build() run with --frozen.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgbase-$pkgver"
  cargo build --frozen --release --bin clipforge-app
  cargo build --frozen --release --bin clipforge-app --features qt-style --target-dir target/qt-style
}

_install_common() {
  install -Dm644 packaging/linux/appimage/clipforge.desktop \
    "$pkgdir/usr/share/applications/clipforge.desktop"
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "packaging/shared/icons/clipforge-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/clipforge.png"
  done
}

package_clipforge() {
  pkgdesc="Quick single-clip video trimmer"
  depends=('ffmpeg' 'mpv')
  conflicts=('clipforge-kde')

  cd "$pkgbase-$pkgver"
  install -Dm755 target/release/clipforge-app "$pkgdir/usr/bin/clipforge-app"
  _install_common
}

package_clipforge-kde() {
  pkgdesc="Quick single-clip video trimmer, with native KDE Application Style controls"
  depends=('ffmpeg' 'mpv' 'qt6-base')
  provides=('clipforge')
  conflicts=('clipforge')

  cd "$pkgbase-$pkgver"
  install -Dm755 target/qt-style/release/clipforge-app "$pkgdir/usr/bin/clipforge-app"
  _install_common
}
