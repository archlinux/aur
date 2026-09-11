# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>

pkgname=openvr-ignition-git
pkgver=r81.1.1.0.r2.gdc343bb
pkgrel=1
pkgdesc="Allows you to run Windows-only SteamVR drivers on Linux, using Wine/Proton"
arch=('x86_64')
url="https://github.com/BnuuySolutions/Ignition"
license=('MIT')
makedepends=(
  git
  cmake
  ninja
  clang
  lld
  xwin
)
source=(
  "ignition::git+https://github.com/BnuuySolutions/Ignition"
)
sha512sums=(
  'SKIP'
)
provides=('openvr-ignition')
conflicts=('openvr-ignition')

pkgver() {
  cd "$srcdir/ignition"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//')"
}

build() {
  cd "$srcdir/ignition"

  if [[ ! -f "$HOME/.xwin-cache/splat/crt/lib/x86_64/msvcrt.lib" ]]; then
    mkdir -p "$HOME/.xwin-cache"
    xwin --accept-license --cache-dir "$HOME/.xwin-cache/dl" splat --output "$HOME/.xwin-cache/splat"
  fi

  export CC=clang
  export CXX=clang++

  cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
  cmake --build build --config Release
}

package() {
  cd "$srcdir/ignition"

  install -d "$pkgdir/opt/ignition"
  install -m 755 -t "$pkgdir/opt/ignition" \
    build/Ignition-Linux-Windows/*
}
