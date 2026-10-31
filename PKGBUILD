# TEMPLATE ONLY: approved release source and checksum are required for each release.
# Source/checksum approval is required before even metadata generation proceeds.
pkgname=pivra
pkgver=0.2.3
pkgrel=1
pkgdesc='Native GNOME photo, animation and video viewer'
arch=('x86_64')
url='https://github.com/onbeskarakterli/Pivra'
license=('GPL-3.0-only')
# GNOME4/glycin and toolkit evidence includes user-reported Arch validation.
# Remaining provider ownership is still open: see README.md.
depends=('gtk4>=4.16' 'libadwaita>=1.2' 'glib2' 'gdk-pixbuf2'
         'gnome-desktop-4' 'glycin' 'bubblewrap' 'libseccomp' 'lcms2'
         'fontconfig' 'cairo' 'graphene' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('cargo' 'pkgconf' 'python>=3.11')
checkdepends=('desktop-file-utils')
_target='x86_64-unknown-linux-gnu'
_recipe_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
# Per-recipe persistent Cargo caches survive makepkg --cleanbuild.
# Cargo validates compiler options, lockfile and dependency fingerprints.
_cache_dir="$_recipe_dir/.pivra-cache"
_cache_setup() {
  if [[ -L "$_cache_dir" || ( -e "$_cache_dir" && ! -d "$_cache_dir" ) ]]; then
    printf 'ERROR: unsafe Cargo cache path: %s\n' "$_cache_dir" >&2
    return 1
  fi
  (umask 077; mkdir -p "$_cache_dir/cargo-home" "$_cache_dir/cargo-target") || return 1
  export CARGO_HOME="$_cache_dir/cargo-home"
  export CARGO_TARGET_DIR="$_cache_dir/cargo-target"
}


release_commit=''
release_url=''
release_sha256=''
if [[ ! -r "$_recipe_dir/release-source.conf" ]]; then
  printf '%s\n' 'BLOCKED: approved release-source.conf is missing; this is not a publishable AUR recipe.' >&2
  return 1 2>/dev/null || exit 1
fi
# Trusted packaging configuration, never downloaded or derived from moving dev.
# shellcheck source=/dev/null
source "$_recipe_dir/release-source.conf"
if [[ ! $release_commit =~ ^[0-9a-f]{40}$ || ! $release_sha256 =~ ^[0-9a-f]{64}$ ||
      $release_url != "https://github.com/onbeskarakterli/Pivra/archive/$release_commit.tar.gz" ]]; then
  printf '%s\n' 'BLOCKED: approved immutable commit URL and real archive SHA-256 are required.' >&2
  return 1 2>/dev/null || exit 1
fi
source=("pivra-$pkgver.tar.gz::$release_url" 'collect-licenses.py')
sha256sums=("$release_sha256" 'e0bad72c99f4629b0668f59450e53a75022ea746efe57191ab8da34fb5cf1201')

prepare() {
  _cache_setup || return 1
  cd "$srcdir/Pivra-$release_commit" || return 1
  # Do not publish a package whose declared version differs from the pinned source.
  local source_version
  source_version=$(python -c 'import pathlib, tomllib; print(tomllib.loads(pathlib.Path("Cargo.toml").read_text())["package"]["version"])') || return 1
  if [[ "$source_version" != "$pkgver" ]]; then
    printf 'ERROR: PKGBUILD version %s does not match Cargo.toml version %s\n' "$pkgver" "$source_version" >&2
    return 1
  fi
  cargo fetch --locked || return 1
}

build() {
  export PIVRA_DISTRIBUTION_BUILD=1
  _cache_setup || return 1
  export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }--remap-path-prefix=$srcdir=/usr/src/debug/pivra"
  cd "$srcdir/Pivra-$release_commit" || return 1
  pkg-config --atleast-version=4.16 gtk4 || return 1
  pkg-config --atleast-version=1.2 libadwaita-1 || return 1
  pkg-config --exists gnome-desktop-4 gio-2.0 gobject-2.0 gdk-pixbuf-2.0 lcms2 libseccomp || return 1
  # Do not silently use a static LCMS fallback or an SDK override.
  if [[ -n ${LCMS2_STATIC+x} || -n ${LCMS2_LIB_DIR+x} ]]; then
    printf '%s\n' 'BLOCKED: LCMS2 overrides must not change the shared-library contract.' >&2
    return 1
  fi
  local flags
  local -a compiler cppflags cflags ldflags pkg_cflags pkg_libs
  read -r -a compiler <<< "${CC:-cc}"
  read -r -a cppflags <<< "${CPPFLAGS:-}"
  read -r -a cflags <<< "${CFLAGS:-}"
  read -r -a ldflags <<< "${LDFLAGS:-}"
  flags=$(pkg-config --cflags gnome-desktop-4 gio-2.0 gobject-2.0 gdk-pixbuf-2.0) || return 1
  read -r -a pkg_cflags <<< "$flags"
  flags=$(pkg-config --libs gnome-desktop-4 gio-2.0 gobject-2.0 gdk-pixbuf-2.0) || return 1
  read -r -a pkg_libs <<< "$flags"
  mkdir -p "$srcdir/build" || return 1
  "${compiler[@]}" "${cppflags[@]}" "${cflags[@]}" "${pkg_cflags[@]}" -Wall -Wextra -Werror \
    native/thumbnail_factory.c -o "$srcdir/build/pivra-thumbnail-factory" \
    "${ldflags[@]}" "${pkg_libs[@]}" || return 1
  cargo build --release --locked --offline --target "$_target" --bin pivra || return 1
  python - "$CARGO_TARGET_DIR/$_target/release/pivra" <<'PY' || return 1
import pathlib
import sys
if b'/out/pivra-thumbnail-factory' in pathlib.Path(sys.argv[1]).read_bytes():
    sys.exit('FAIL: viewer embeds a Cargo OUT_DIR thumbnail-helper path')
PY
  test -x "$srcdir/build/pivra-thumbnail-factory" || return 1
  readelf -d "$CARGO_TARGET_DIR/$_target/release/pivra" > "$srcdir/build/pivra.dynamic" || return 1
  grep -F 'liblcms2.so.2' "$srcdir/build/pivra.dynamic" >/dev/null || return 1
  grep -F 'libseccomp.so.2' "$srcdir/build/pivra.dynamic" >/dev/null || return 1
  cargo metadata --locked --offline --format-version 1 > "$srcdir/build/metadata.json" || return 1
  python "$srcdir/collect-licenses.py" --metadata "$srcdir/build/metadata.json" \
    --lock Cargo.lock --cargo-home "$CARGO_HOME" \
    --notices "$srcdir/build/third-party" --sources "$srcdir/build/crate-sources" || return 1
}

check() {
  export PIVRA_DISTRIBUTION_BUILD=1
  _cache_setup || return 1
  cd "$srcdir/Pivra-$release_commit" || return 1
  CARGO_INCREMENTAL=0 cargo test --release --locked --offline --target "$_target" || return 1
  desktop-file-validate data/io.github.onbeskarakterli.Pivra.desktop || return 1
}

package() {
  _cache_setup || return 1
  cd "$srcdir/Pivra-$release_commit" || return 1
  install -Dm755 "$CARGO_TARGET_DIR/$_target/release/pivra" "$pkgdir/usr/bin/pivra" || return 1
  install -Dm755 "$srcdir/build/pivra-thumbnail-factory" "$pkgdir/usr/bin/pivra-thumbnail-factory" || return 1
  install -Dm644 data/io.github.onbeskarakterli.Pivra.desktop \
    "$pkgdir/usr/share/applications/io.github.onbeskarakterli.Pivra.desktop" || return 1
  local variant name
  for variant in scalable symbolic; do
    name=io.github.onbeskarakterli.Pivra
    [[ $variant == symbolic ]] && name+=-symbolic
    install -Dm644 "data/icons/hicolor/$variant/apps/$name.svg" \
      "$pkgdir/usr/share/icons/hicolor/$variant/apps/$name.svg" || return 1
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pivra/LICENSE" || return 1
  install -d "$pkgdir/usr/share/licenses/pivra/third-party" \
    "$pkgdir/usr/share/doc/pivra/corresponding-source/crates" || return 1
  cp -r --no-preserve=ownership "$srcdir/build/third-party/." \
    "$pkgdir/usr/share/licenses/pivra/third-party/" || return 1
  cp -r --no-preserve=ownership "$srcdir/build/crate-sources/." \
    "$pkgdir/usr/share/doc/pivra/corresponding-source/crates/" || return 1
  install -Dm644 "$srcdir/pivra-$pkgver.tar.gz" \
    "$pkgdir/usr/share/doc/pivra/corresponding-source/pivra-$pkgver.tar.gz" || return 1
  install -Dm644 "$_recipe_dir/PKGBUILD" \
    "$pkgdir/usr/share/doc/pivra/corresponding-source/PKGBUILD" || return 1
  install -Dm644 "$_recipe_dir/release-source.conf" \
    "$pkgdir/usr/share/doc/pivra/corresponding-source/release-source.conf" || return 1
  install -Dm644 "$srcdir/collect-licenses.py" \
    "$pkgdir/usr/share/doc/pivra/corresponding-source/collect-licenses.py" || return 1
  local doc
  for doc in PIVRA_V0.2.1_RELEASE_NOTES.md; do
    install -Dm644 "docs/releases/$doc" "$pkgdir/usr/share/doc/pivra/$doc" || return 1
  done
}
