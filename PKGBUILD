# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>

pkgname=openvr-ignition-git
pkgver=r79.1.0.0.r15.gaf79ea1
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

  # export CC=clang
  # export CXX=clang++

  cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/opt/ignition
  cmake --build build --config Release --target driver_ignition ignition_server_windows

  export CFLAGS=""
  export CXXFLAGS=""
  export LDFLAGS=""
  cmake -S projects/ignition_bridge -B build-bridge -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/ignition \
    -DCMAKE_TOOLCHAIN_FILE="$srcdir/ignition/clang-x86-64-pc-windows-msvc.cmake" \
    -DIGNITION_ROOT="$srcdir/ignition" \
    -DCMAKE_RUNTIME_OUTPUT_DIRECTORY="$srcdir/ignition/build-bridge/Windows/bin" \
    -DCMAKE_LIBRARY_OUTPUT_DIRECTORY="$srcdir/ignition/build-bridge/Windows/lib" \
    -DCMAKE_ARCHIVE_OUTPUT_DIRECTORY="$srcdir/ignition/build-bridge/Windows/lib" \
    -DCMAKE_TRY_COMPILE_CONFIGURATION=Release
  cmake --build build-bridge --config Release --target ignition_bridge
}

package() {
    install -d "$pkgdir/opt/ignition"
    install -m 755 -t "$pkgdir/opt/ignition" \
        ${srcdir}/ignition/support/driver_install.sh \
        ${srcdir}/ignition/support/driver_uninstall.sh \
        ${srcdir}/ignition/support/install_ignition.sh \
        ${srcdir}/ignition/support/launch_serverhelper.sh \
        ${srcdir}/ignition/support/proton \
        ${srcdir}/ignition/support/wine_hidraw.reg \
        ${srcdir}/ignition/build/Windows/bin/ignition_server.exe \
        ${srcdir}/ignition/build/Linux/lib/libdriver_ignition.so \
        ${srcdir}/ignition/build-bridge/Windows/bin/ignition_bridge.dll \

}
