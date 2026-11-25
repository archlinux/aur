# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=apkscope-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Android APK decompiler, xrefs, API recon and MCP server, with native viewer"
arch=('x86_64' 'aarch64')
url="https://github.com/suffixing/apkscope"
license=('Apache-2.0')
depends=(
  'glibc'
  'libgcc'
  # winit and glutin open these at runtime, so they appear in no NEEDED entry and
  # namcap cannot see them, yet the viewer cannot start without them: winit's X11
  # connection opens libX11, libXcursor, libX11-xcb and libXi with `?`, and its XKB
  # context needs the X11 bridge, which ships as a package of its own rather than
  # inside libxkbcommon.
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxi'
  'wayland'
)
provides=('apkscope')
conflicts=('apkscope')
# Upstream ships stripped binaries, and makepkg's strip step rewrites the ELF
# container even when it removes nothing, which would break byte identity with the
# checksums the release publishes - the one property a -bin package exists to keep.
options=('!strip' '!debug')
# The release asset names carry no version, so every source is aliased with $pkgver:
# makepkg accepts a file already in $SRCDEST without checking its checksum, and an
# unversioned alias would hand a bumped PKGBUILD the previous release's binary.
source=("NOTICE::$url/raw/v$pkgver/NOTICE")
sha256sums=('4a44da57791f5b44965c0eb0af6ac43e65a643af7a44afdc6cca28bdb17d687c')
sha256sums_x86_64=('3e09e41a69478023986e56c9ce79f99e246468976635129060cd2f4105fd5c78')
sha256sums_aarch64=('c7dc7927398f14bc07743228569748b1bd36c348ef9fd8a8bdc950b1636280d4')

source_x86_64=("apkscope_linux_x86_64-$pkgver::$url/releases/download/v$pkgver/apkscope_linux_x86_64")

source_aarch64=("apkscope_linux_aarch64-$pkgver::$url/releases/download/v$pkgver/apkscope_linux_aarch64")

# The musl assets are not packaged: they are built without the `gui` feature and
# refuse `apkscope gui` outright, because a static binary cannot load the desktop's
# X11/Wayland/GL libraries at runtime.

package() {
  install -Dm755 "$srcdir/apkscope_linux_$CARCH-$pkgver" "$pkgdir/usr/bin/apkscope"
  # Apache-2.0 section 4(d) requires passing the NOTICE on, and it carries trademark
  # terms the license text does not.
  install -Dm644 "$srcdir/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}

# Upstream tags releases without bumping the crate manifest, so pkgver follows the
# release tag while `apkscope --version` reports the manifest number.
# updpkgsums hashes only the build host's architecture and rewrites every *sums
# array, so after a bump re-check the other architecture against the release's
# checksums.txt.
latestver() {
  gh api repos/suffixing/apkscope/releases/latest --jq '.tag_name' |
      sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p'
}
