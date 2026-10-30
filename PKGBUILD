# Maintainer: onbeskarakterli <onbeskarakterli@gmail.com>
# Stable Pivra 0.1.0 release package for Arch Linux.
# Immutable upstream commit and SHA-256 are pinned in this PKGBUILD.
pkgname=pivra
pkgver=0.1.0
pkgrel=1
pkgdesc='Native GNOME JPEG/PNG image viewer'
arch=('x86_64')
url='https://github.com/onbeskarakterli/Pivra'
license=('GPL-3.0-only')
# Dependencies and native build validated for the v0.1.0 Arch release.
depends=('gtk4>=4.16' 'libadwaita>=1.2' 'glib2' 'gdk-pixbuf2'
         'gnome-desktop-4' 'glycin' 'bubblewrap' 'libseccomp' 'lcms2'
         'fontconfig' 'cairo' 'graphene' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('cargo' 'pkgconf' 'python>=3.11')
checkdepends=('desktop-file-utils')
_target="${CARCH}-unknown-linux-gnu"
_release_commit='18b9bc2e021aeeeb02dc42198db4522a67ed9e1b'
source=("pivra-$pkgver.tar.gz::https://github.com/onbeskarakterli/Pivra/archive/$_release_commit.tar.gz"
        'collect-licenses.py')
sha256sums=('f8a31e5569ead7ae90b4a292c108ddfd77a45bc59327d2af10e88dc6d459cbf9' 'e0bad72c99f4629b0668f59450e53a75022ea746efe57191ab8da34fb5cf1201')

prepare() {
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/Pivra-$_release_commit/target"
  cd "$srcdir/Pivra-$_release_commit" || return 1
  cargo fetch --locked || return 1
}

build() {
  export PIVRA_DISTRIBUTION_BUILD=1
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/Pivra-$_release_commit/target"
  cd "$srcdir/Pivra-$_release_commit" || return 1
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
  python - "target/$_target/release/pivra" <<'PY' || return 1
import pathlib
import sys
if b'/out/pivra-thumbnail-factory' in pathlib.Path(sys.argv[1]).read_bytes():
    sys.exit('FAIL: viewer embeds a Cargo OUT_DIR thumbnail-helper path')
PY
  test -x "$srcdir/build/pivra-thumbnail-factory" || return 1
  readelf -d "target/$_target/release/pivra" > "$srcdir/build/pivra.dynamic" || return 1
  grep -F 'liblcms2.so.2' "$srcdir/build/pivra.dynamic" >/dev/null || return 1
  grep -F 'libseccomp.so.2' "$srcdir/build/pivra.dynamic" >/dev/null || return 1
  cargo metadata --locked --offline --format-version 1 > "$srcdir/build/metadata.json" || return 1
  python "$srcdir/collect-licenses.py" --metadata "$srcdir/build/metadata.json" \
    --lock Cargo.lock --cargo-home "$CARGO_HOME" \
    --notices "$srcdir/build/third-party" --sources "$srcdir/build/crate-sources" || return 1
}

check() {
  export PIVRA_DISTRIBUTION_BUILD=1
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/Pivra-$_release_commit/target"
  cd "$srcdir/Pivra-$_release_commit" || return 1
  CARGO_INCREMENTAL=0 cargo test --locked --offline --target "$_target" || return 1
  cargo check --locked --offline --target "$_target" || return 1
  desktop-file-validate data/io.github.onbeskarakterli.Pivra.desktop || return 1
}

package() {
  cd "$srcdir/Pivra-$_release_commit" || return 1
  install -Dm755 "target/$_target/release/pivra" "$pkgdir/usr/bin/pivra" || return 1
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
  install -Dm644 "${BASH_SOURCE[0]}" \
    "$pkgdir/usr/share/doc/pivra/corresponding-source/PKGBUILD" || return 1
  install -Dm644 "$srcdir/collect-licenses.py" \
    "$pkgdir/usr/share/doc/pivra/corresponding-source/collect-licenses.py" || return 1
  local doc
  for doc in PIVRA_V0.1_RELEASE_NOTES.md PIVRA_V0.1_DEPENDENCY_LICENSE_AUDIT.md; do
    install -Dm644 "docs/releases/$doc" "$pkgdir/usr/share/doc/pivra/$doc" || return 1
  done
}
