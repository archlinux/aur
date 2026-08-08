# Maintainer: Milk Brewster - milkii on Freenode
pkgname=phiola-git
_pkgname=phiola
pkgver=2.8.13.r0.gbdbcd5e
pkgrel=1
pkgdesc="Fast audio player, recorder, converter and streaming server (fmedia successor)"
arch=('x86_64')
url="https://github.com/stsaz/phiola"
license=('BSD-2-Clause')
depends=('alsa-lib' 'dbus' 'gtk3' 'zstd' 'pulseaudio' 'jack2' 'libdeflate')
makedepends=('git' 'lld' 'make' 'gcc' 'patch' 'dos2unix' 'curl' 'unzip' 'cmake')
provides=('phiola' 'phiola-git')
conflicts=('phiola' 'phiola-git')
source=(
  "git+https://github.com/stsaz/phiola"
  "git+https://github.com/stsaz/netmill"
  "git+https://github.com/stsaz/avpack"
  "git+https://github.com/stsaz/ffaudio"
  "git+https://github.com/stsaz/ffpack"
  "git+https://github.com/stsaz/ffgui"
  "git+https://github.com/stsaz/ffsys"
  "git+https://github.com/stsaz/ffbase"
)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  # The upstream Makefile uses build dirs (alib3, ffpack, netmill-3pt) that
  # conflict with source dirs of the same name. The Makefile runs
  # 'make -C $(BUILD_DIR) -f $(SOURCE_DIR)/Makefile' which fails because
  # relative paths in $(SOURCE_DIR) are wrong from within $(BUILD_DIR).
  # Fix: use absolute paths for all source references.
  PHI_ABS="$(pwd)"
  sed -i "s|ALIB3_BIN := alib3|ALIB3_BIN := $PHI_ABS/alib3|" src/afilter/Makefile src/acodec/Makefile
  sed -i "s|ALIB3 := \$(PHIOLA)/alib3|ALIB3 := $PHI_ABS/alib3|" src/afilter/Makefile src/acodec/Makefile
  sed -i "s|FFPACK_BIN := ffpack|FFPACK_BIN := $PHI_ABS/ffpack|" src/dfilter/Makefile
  sed -i "s|FFPACK := \$(ROOT_DIR)/ffpack|FFPACK := $PHI_ABS/../ffpack|" src/dfilter/Makefile
  # Disable HTTP SSL to avoid building OpenSSL from source
  export PHI_HTTP_SSL=0
  # Disable LTO (causes visibility issues with ffpack/zstd symbols on GCC 16)
  make -j$(($(nproc) - 2)) CFLAGS_USER="-fno-lto" LINKFLAGS_USER="-fno-lto" build
  make app
}

package() {
  cd "$srcdir/$_pkgname"
  APP_DIR=phiola-2

  # Install to /opt/phiola-2 (upstream layout)
  install -dm755 "$pkgdir/opt/phiola-2"
  cp -ar "$APP_DIR"/* "$pkgdir/opt/phiola-2/"

  # Symlink binary
  install -dm755 "$pkgdir/usr/bin"
  ln -sf /opt/phiola-2/phiola "$pkgdir/usr/bin/phiola"

  # Desktop file
  install -Dm644 src/gui/res/phiola.desktop "$pkgdir/usr/share/applications/phiola.desktop"

  # Icon
  install -Dm644 res/phiola.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/phiola.svg"

  # Bash completion
  if [[ -f "$pkgdir/opt/phiola-2/phiola" ]]; then
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    "$pkgdir/opt/phiola-2/phiola" __bash_completion > "$pkgdir/usr/share/bash-completion/completions/phiola" 2>/dev/null || true
  fi
}
