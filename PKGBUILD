# Maintainer: Yi donghoon <icq4ever@gmail.com>
pkgname=orbbecsdk-v2-bin
pkgver=2.8.6
pkgrel=1
pkgdesc="Orbbec SDK v2 (libobsensor) — prebuilt cross-platform SDK for Orbbec 3D cameras (Femto, Gemini, Astra)"
arch=('x86_64' 'aarch64')
url="https://github.com/orbbec/OrbbecSDK_v2"
license=('Apache-2.0')
depends=('libusb' 'gcc-libs')
provides=('orbbecsdk' 'libobsensor')
conflicts=('orbbecsdk' 'libobsensor')
install="${pkgname}.install"
options=('!strip')   # prebuilt vendor binaries; do not touch

# Build id baked into the v2.8.6 release asset/dir names (shared by both arches).
_build=202604271452_6399409

source_x86_64=("OrbbecSDK_v${pkgver}_linux_x86_64.tar.gz::${url}/releases/download/v${pkgver}/OrbbecSDK_v${pkgver}_${_build}_linux_x86_64.tar.gz")
source_aarch64=("OrbbecSDK_v${pkgver}_linux_arm64.tar.gz::${url}/releases/download/v${pkgver}/OrbbecSDK_v${pkgver}_${_build}_linux_arm64.tar.gz")
sha256sums_x86_64=('2faf400920594d42a08c2eb057ddf08d2affd3c8215c5482c9d4e6ad94d72d5a')
sha256sums_aarch64=('a052221d4bdea6afb2f8b338bcd6e635afffcebbacab1483422b986e680fb441')

# Map Arch's CARCH onto the SDK tarball's arch token and resolve the extracted dir.
_srcdir() {
  local a
  case "$CARCH" in
    x86_64)  a=x86_64 ;;
    aarch64) a=arm64  ;;
  esac
  echo "${srcdir}/OrbbecSDK_v${pkgver}_${_build}_linux_${a}"
}

package() {
  local sdk; sdk="$(_srcdir)"

  # --- Runtime libraries + extension plugins -------------------------------
  # The SDK resolves its extensions/ plugins relative to libOrbbecSDK.so, so
  # they must sit alongside the .so. /usr/lib/extensions keeps that layout.
  install -d "${pkgdir}/usr/lib"
  cp -dr "${sdk}/lib/"libOrbbecSDK.so* "${pkgdir}/usr/lib/"
  cp -dr "${sdk}/lib/extensions"       "${pkgdir}/usr/lib/"

  # --- CMake package config ------------------------------------------------
  # OrbbecSDKConfig.cmake computes its import prefix as parent(parent(config)).
  # Placed in /usr/lib/, that resolves the prefix to /usr (so include=/usr/include,
  # lib=/usr/lib) — exactly what we install below.
  install -m644 "${sdk}/lib/OrbbecSDKConfig.cmake"          "${pkgdir}/usr/lib/"
  install -m644 "${sdk}/lib/OrbbecSDKConfig-release.cmake"  "${pkgdir}/usr/lib/"
  install -m644 "${sdk}/lib/OrbbecSDKVersion.cmake"         "${pkgdir}/usr/lib/"

  # Thin wrapper at the location CMake actually searches, so plain
  # `find_package(OrbbecSDK CONFIG)` works with no -DOrbbecSDK_DIR needed.
  # It just include()s the real config; CMAKE_CURRENT_LIST_FILE then points at
  # /usr/lib/OrbbecSDKConfig.cmake, keeping the prefix math correct.
  install -d "${pkgdir}/usr/lib/cmake/OrbbecSDK"
  cat > "${pkgdir}/usr/lib/cmake/OrbbecSDK/OrbbecSDKConfig.cmake" <<'EOF'
# Redirect to the SDK's real config in /usr/lib so that its relative
# import-prefix calculation (parent of parent of the config file) yields /usr.
include("${CMAKE_CURRENT_LIST_DIR}/../../OrbbecSDKConfig.cmake")
EOF

  # --- Headers -------------------------------------------------------------
  install -d "${pkgdir}/usr/include"
  cp -dr "${sdk}/include/libobsensor" "${pkgdir}/usr/include/"

  # --- udev rules (non-root USB access; Linux equivalent of macOS sudo) -----
  install -Dm644 "${sdk}/shared/99-obsensor-libusb.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/99-obsensor-libusb.rules"

  # --- License -------------------------------------------------------------
  install -Dm644 "${sdk}/lib/OrbbecSDKConfig.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/OrbbecSDKConfig.md" 2>/dev/null || true
}
