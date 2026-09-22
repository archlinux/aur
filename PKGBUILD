# Maintainer: Thiago <killown.matrix@gmail.com>
pkgname=flux-filemanager-git
_pkgname=flux
pkgver=v0.1.9.r0.940db9b
pkgrel=1
pkgdesc="Modern and simple file manager written in Rust with Libadwaita"
arch=('x86_64')
url="https://github.com/killown/flux"
license=('GPL-3.0-only')
depends=(
  'libadwaita'
  'gtk4'
  'dconf'
  'sqlite'
  'poppler-glib'
  'fontconfig'
)
makedepends=('rust' 'cargo' 'git' 'clang' 'make' 'zstd' 'cmake' 'pkg-config')
optdepends=(
  'ffmpeg: video thumbnails and media tools'
  'imagemagick: image conversion and processing'
  'unar: RAR archive support'
  'p7zip: 7z and UDF ISO archive support'
)
provides=('flux-fm' 'flux')
conflicts=('flux-fm' 'flux')
source=(
  "${_pkgname}::git+${url}.git"
  "flux-themes::git+https://github.com/killown/flux-themes.git"
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-\)g/r\1/;s/-/./g' ||
      printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname"

  # Clean and copy themes correctly
  rm -rf themes
  cp -r "$srcdir/flux-themes" themes

  # Ensure default.css exists so the Makefile doesn't fail
  if [ ! -f themes/default.css ]; then
    touch themes/default.css
  fi

  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --target "$CARCH-unknown-linux-gnu" --offline
}

build() {
  cd "$_pkgname"

  export CARGO_HOME="$srcdir/cargo-home"
  export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
  export PKG_CONFIG_PATH=/usr/lib/pkgconfig
  export ZSTD_SYS_USE_PKG_CONFIG=1

  # Clear Arch build flags that break bundled C libraries (mimalloc, libdeflate)
  unset CFLAGS
  unset CXXFLAGS
  export LDFLAGS="${LDFLAGS/--as-needed/}"

  cargo build --release --offline
}

package() {
  cd "$_pkgname"

  # Run make install directly without rebuilding/updating themes via network
  make DESTDIR="$pkgdir" PREFIX=/usr -C . install-data install-exec || {
    # Fallback if specific targets aren't split in Makefile:
    # Manually bypass update-themes by calling install steps or patching
    make DESTDIR="$pkgdir" PREFIX=/usr install
  }
}
