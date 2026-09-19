# Maintainer: Dusan Borovcanin <borovcanindusan1@gmail.com>

# The binary the Release workflow builds, repackaged. `dbar` builds the same
# tag from source for anyone who would rather compile it themselves.
#
# pkgver and sha256sums are rewritten by scripts/aur-publish.sh when a tag is
# released, so the copy in the repository always describes a real release
# rather than a placeholder nobody can install.

pkgname=dbar-bin
_pkgname=dbar
pkgver=0.9.3
pkgrel=1
pkgdesc="A small, event-driven Wayland status bar for Sway, SwayFX, niri and Hyprland (prebuilt)"
# The Release workflow publishes one binary, and it is x86-64.
arch=('x86_64')
url="https://github.com/dborovcanin/dbar"
license=('Apache-2.0')
# Exactly what readelf -d records, and no more: libpipewire-0.3.so, libgcc_s.so
# and libc. `gcc-libs` would name the same libgcc_s through a metapackage that
# also drags in libasan, libtsan, libobjc and libgfortran, none of which dbar
# links against.
depends=('glibc' 'libgcc' 'libpipewire')
optdepends=(
  'noto-fonts: the default font family and the Latin fallback'
  'noto-fonts-emoji: colour emoji in window titles and track names'
  'noto-fonts-cjk: Chinese, Japanese and Korean window titles'
  'ttf-nerd-fonts-symbols: Nerd Font glyphs in workspace names'
  'sway: one of the compositors dbar reads workspaces and window titles from'
  'niri: one of the compositors dbar reads workspaces and window titles from'
  'hyprland: one of the compositors dbar reads workspaces and window titles from'
)
# The release profile already strips, so makepkg has nothing to take out and
# no symbols to split into a debug package.
options=('!strip' '!debug')
provides=("dbar=$pkgver")
conflicts=('dbar' 'dbar-git')
# The tag archive comes along for the licence, the README and the examples:
# the release asset is the binary on its own.
source=("$_pkgname-$pkgver-linux-x86_64::$url/releases/download/v$pkgver/dbar-linux-x86_64"
  "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29a02f613d34b268a919bb133c7c27d3e67b0b0ef2d227acd42bfc6d03334f15'
            '152b8e50f5bc12a07eca05e82cb411d1723c59564f3f3b029acabe06792f0150')

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver-linux-x86_64" "$pkgdir/usr/bin/$_pkgname"

  cd "$_pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 spec.md "$pkgdir/usr/share/doc/$_pkgname/spec.md"
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/examples" examples/*.toml
  install -Dm755 -t "$pkgdir/usr/share/doc/$_pkgname/examples" examples/*.sh
}
