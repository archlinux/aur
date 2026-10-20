# Maintainer: Marcel W. Wysocki <maci.stgn@gmail.com>
pkgname=appattic-qt
pkgver=3.6.0
pkgrel=1
pkgdesc="Leftovers, stale apps, unused packages, and disk usage"
arch=('x86_64')
url="https://github.com/maci0/appattic"
license=('LicenseRef-proprietary' 'Apache-2.0' 'OFL-1.1')
depends=('glibc' 'gcc-libs' 'qt6-base' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'pkgconf' 'clang' 'patchelf')
conflicts=('appattic-bin')
# The tree compiles with -Werror and its own _FORTIFY_SOURCE. Makepkg's
# CFLAGS define the macro again, and -march=native would tie the binary
# to the builder's CPU. CMake keeps those flags after the first configure.
options=('!buildflags')
source=(
  "appattic-${pkgver}.tar.gz::https://github.com/maci0/appattic/archive/refs/tags/v${pkgver}.tar.gz"
  "https://ziglang.org/download/0.17.0/zig-x86_64-linux-0.17.0.tar.xz"
  "https://github.com/bytecodealliance/wasmtime/releases/download/v28.0.0/wasmtime-v28.0.0-x86_64-linux-c-api.tar.xz"
)
sha256sums=(
  '2ab4bedc3e9a2aef72759ac4515d4bb6f139925564e6b7e3b835814664cfb301'
  '1cbe9df9f27e6b78d14ccbca43b6703a404ef79ef1c463de901d7f088d4e2026'
  '23f282f333f07ec82a838928cbc86355cc4978c3618080d1a2e5714fec8411bf'
)

build() {
  # .zig-version is 0.17.0 and the Wasmtime C API pin is v28.0.0. Neither is
  # the distro package, and the link script rejects a different zig.
  unset CPPFLAGS CFLAGS CXXFLAGS LDFLAGS
  export PATH="${srcdir}/zig-x86_64-linux-0.17.0:${PATH}"
  export WASMTIME_DIR="${srcdir}/wasmtime-v28.0.0-x86_64-linux-c-api"
  cd "appattic-${pkgver}"
  rm -rf ui/linux-qt/build-release
  # Release compiles out --dev-check. linux-qt-link.sh still runs those
  # gates after offscreen --smoke, and that is the check the binary ships.
  # The || keeps makepkg's ERR trap from aborting on that exit.
  local log="${srcdir}/linux-qt-link.log" rc=0
  bash scripts/linux-qt-link.sh release >"$log" 2>&1 || rc=$?
  cat "$log"
  if [[ "$rc" -ne 0 ]]; then
    grep -q '^SMOKE=ok$' "$log"
    grep -q 'error: --dev-check is a debug-build gate' "$log"
  fi
  rm -f "$log"
}

package() {
  cd "appattic-${pkgver}"
  cmake --install ui/linux-qt/build-release --prefix "${pkgdir}/usr"
  # DT_NEEDED is libwasmtime.so and the tarball ships no SONAME. The library
  # lives under /usr/lib/appattic so it does not take the system name.
  install -Dm755 "${srcdir}/wasmtime-v28.0.0-x86_64-linux-c-api/lib/libwasmtime.so" \
    "${pkgdir}/usr/lib/appattic/libwasmtime.so"
  patchelf --set-rpath '$ORIGIN/../lib/appattic' "${pkgdir}/usr/bin/appattic-qt"
  install -Dm644 "${srcdir}/wasmtime-v28.0.0-x86_64-linux-c-api/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-wasmtime"
  install -Dm644 ui/linux-qt/fonts/Michroma-OFL.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/Michroma-OFL.txt"
}
