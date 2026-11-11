# Maintainer: Borys Kharchenko (https://github.com/arximus88)
# Builds from the main branch of the upstream repository.
pkgname=slicenv-git
pkgver=0.1.1.r80.g7bf7230
pkgrel=2
pkgdesc='Fast native 3D printing slicer front-end for OrcaSlicer and Bambu Studio engines (git)'
arch=('x86_64')
url='https://github.com/arximus88/slicenv'
license=('AGPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'wayland'
         'vulkan-icd-loader' 'hicolor-icon-theme' 'python' 'curl' 'tar' 'xdg-utils')
# manifold-csg-sys clones and builds manifold3d (cmake, C++17) during cargo build.
makedepends=('git' 'cargo' 'cmake' 'clang' 'pkgconf' 'librsvg' 'openssl' 'zstd' 'fontconfig' 'freetype2')
optdepends=('squashfs-tools: faster unpacking of AppImage slicer engines'
            'vulkan-driver: GPU rendering (mesa, nvidia-utils, ...)')
provides=('slicenv')
conflicts=('slicenv' 'slicenv-bin')
options=('!lto' '!debug')
source=("slicenv::git+https://github.com/arximus88/slicenv.git")
sha256sums=('SKIP')

pkgver() {
  cd slicenv
  local base
  base=$(sed -n '/^\[workspace.package\]/,/^\[/s/^version = "\(.*\)"/\1/p' Cargo.toml)
  printf '%s.r%s.g%s' "$base" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd slicenv
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd slicenv
  export CARGO_TARGET_DIR=${CARGO_TARGET_DIR:-target}
  # Keep $srcdir out of the binaries (panic locations, debug paths).
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src"
  cargo build --release --locked -p app -p mcp
}

check() {
  cd slicenv
  export CARGO_TARGET_DIR=${CARGO_TARGET_DIR:-target}
  # Throwaway HOME: the check must not touch the build user's configuration.
  local home
  home=$(mktemp -d)
  HOME=$home XDG_CONFIG_HOME=$home/config XDG_DATA_HOME=$home/data XDG_CACHE_HOME=$home/cache \
    "$CARGO_TARGET_DIR/release/slicenv" --version
  HOME=$home XDG_CONFIG_HOME=$home/config XDG_DATA_HOME=$home/data XDG_CACHE_HOME=$home/cache \
    "$CARGO_TARGET_DIR/release/slicenv-mcp" --version
  rm -rf "$home"
}

package() {
  cd slicenv
  local t=${CARGO_TARGET_DIR:-target} id=app.borys.slicenv a=crates/app/assets/app
  install -Dm755 "$t/release/slicenv" "$pkgdir/usr/bin/slicenv"
  install -Dm755 "$t/release/slicenv-mcp" "$pkgdir/usr/bin/slicenv-mcp"
  sed 's|@EXEC@|slicenv|' "$a/$id.desktop" | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$id.desktop"
  install -Dm644 "$a/$id.metainfo.xml" "$pkgdir/usr/share/metainfo/$id.metainfo.xml"
  install -Dm644 "$a/slicenv.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$id.svg"
  for s in 16 24 32 48 64 128 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${s}x$s/apps"
    rsvg-convert -w "$s" -h "$s" "$a/slicenv.svg" -o "$pkgdir/usr/share/icons/hicolor/${s}x$s/apps/$id.png"
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD-PARTY-NOTICES.md packaging/THIRD-PARTY-RUST-CRATES.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  python3 -I tools/third-party-licenses.py --texts "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-LICENSES.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/slicenv/README.md"
}
