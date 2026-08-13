# Maintainer: Floofy floofyiv9@proton.me
pkgname=spencers-macro-git
pkgver=3.3.0.r15.fe47b8f
pkgrel=1
pkgdesc="Spencer Macro Utilities (git version)"
arch=('x86_64')
url="https://github.com/Spencer0187/Spencer-Macro-Utilities"
license=('GPL-3.0-only')
provides=('spencers-macro')
conflicts=('spencers-macro')
depends=(
  'libx11'
  'libxext'
  'libxrandr'
  'libxcursor'
  'libxfixes'
  'libxi'
  'libxss'
  'libxtst'
  'libxinerama'
  'libxkbcommon'
  'libglvnd'
  'mesa'
  'libpipewire'
  'dbus'
  'libei'
  'systemd-libs'
  'gcc-libs'
  'glibc'
)
makedepends=(
  'base-devel'
  'git'
  'cmake'
  'pkg-config'
  'go'
  'pipewire'
  'libei'
)
optdepends=(
  'pipewire: Wayland screen pixel reads via PipeWire ScreenCast'
  'libei: Wayland RemoteDesktop EIS input support'
)
source=(
  "$pkgname::git+https://github.com/Spencer0187/Spencer-Macro-Utilities.git"
  "spencers-macro.desktop"
  "spencers-macro.png"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$srcdir/$pkgname"
  if git describe --tags --long --match='[vV][0-9]*' 2>/dev/null |
    grep -q .; then
    git describe --tags --long --match='[vV][0-9]*' |
      sed -E 's/^[vV]//; s/-([0-9]+)-g([0-9a-f]+)$/.r\1.\2/'
  else
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname"

  export HOME="$srcdir/.gohome"
  export GOCACHE="$srcdir/.gocache"
  export GOTMPDIR="$srcdir/.gotmp"
  mkdir -p "$HOME" "$GOCACHE" "$GOTMPDIR"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DSMU_BUNDLE_SDL3=ON \
    -DSMU_LINK_SDL3_STATIC=OFF \
    -DSMU_ENABLE_SOURCE_TREE_FALLBACK=OFF

  cmake --build build --target package-linux-dir --parallel "$(nproc)"
}

package() {
  # The package-linux-dir target writes here:
  local pkgDir="$srcdir/$pkgname/build/SpencerMacroUtilities"
  local instDir="$pkgdir/usr/lib/spencers-macro"

  install -d "$instDir"
  cp -a "$pkgDir/." "$instDir/"

  chmod 755 \
    "$instDir/suspend" \
    "$instDir/run.sh" \
    "$instDir/scripts/install_linux_permissions.sh"
  [[ -f "$instDir/nethelper" ]] && chmod 755 "$instDir/nethelper"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/spencers-macro" <<'EOF'
#!/bin/bash
exec /usr/lib/spencers-macro/run.sh "$@"
EOF

  install -Dm644 "$srcdir/spencers-macro.desktop" \
    "$pkgdir/usr/share/applications/spencers-macro.desktop"
  install -Dm644 "$srcdir/spencers-macro.png" \
    "$pkgdir/usr/share/pixmaps/spencers-macro.png"
}
