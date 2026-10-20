# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=xtool
pkgver=1.22.2
pkgrel=1
pkgdesc="Cross-platform Xcode replacement."
arch=('x86_64')
url="https://xtool.sh/"
license=('MIT')
depends=(
  'usbmuxd'
  'swift-bin'
  'unzip'
  'xadi'
)
makedepends=(
  'git'
  'clang'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/xtool-org/$pkgname/archive/refs/tags/$pkgver.tar.gz"
)
b2sums=('1d69afff18da2219a6e0f995e10eef970fd1e5548cd751f545d4c321285ba98610623118848b336a60d61f8b0d8c23b047eae55ad5467aafd94d2acade4e270f')

build() {
  cd "$pkgname-$pkgver"

  # Find the compiler through PATH; swift-bin's installation layout may vary.
  local swift_cmd swiftc_cmd
  swift_cmd="$(command -v swift)"
  swiftc_cmd="$(command -v swiftc)"
  [[ -x "$swift_cmd" && -x "$swiftc_cmd" ]] || {
    error "swift/swiftc are not available in PATH"
  }
  export SWIFT_EXEC="$swiftc_cmd"
  export SWIFT_DRIVER_SWIFT_EXEC="$swiftc_cmd"

  # swift-bin installs resources below the toolchain's runtime resource path;
  # derive it so this works across swift-bin layout changes and architectures.
  local swift_runtime_path
  swift_runtime_path="$("$swiftc_cmd" -print-target-info | sed -n 's/.*"runtimeResourcePath"[[:space:]]*:[[:space:]]*"\([^\"]*\)".*/\1/p')"
  [[ -n "$swift_runtime_path" ]] || {
    error "could not determine Swift runtime resource path"
  }
  local swift_macros="$swift_runtime_path/host/plugins/libSwiftMacros.so"
  [[ -f "$swift_macros" ]] || {
    error "SwiftMacros plugin is missing: $swift_macros"
  }
  local swift_plugin_server="$swift_runtime_path/host/libSwiftInProcPluginServer.so"
  [[ -f "$swift_plugin_server" ]] || {
    error "Swift in-process plugin server is missing: $swift_plugin_server"
  }

  # Populate .build/checkouts before building.
  "$swift_cmd" package resolve

  # SwiftPM appends its own (unrelocated) plugin paths after -Xswiftc flags.
  # Swift's driver appends this environment variable last, allowing the
  # swift-bin paths to take precedence.
  export ADDITIONAL_SWIFT_DRIVER_FLAGS="-in-process-plugin-server-path $swift_plugin_server -plugin-path $swift_runtime_path/host/plugins"

  "$swift_cmd" build -c release --product xtool \
    -Xswiftc -plugin-path \
    -Xswiftc "$swift_runtime_path/host/plugins" \
    -Xswiftc -load-plugin-library \
    -Xswiftc "$swift_macros" \
    -Xswiftc -in-process-plugin-server-path \
    -Xswiftc "$swift_plugin_server" \
    -Xswiftc -package-name \
    -Xswiftc xtool
}

package() {
  cd "$pkgname-$pkgver"

  # xtool.desktop
  install -Dm644 "Linux/xtool.desktop" "$pkgdir/usr/share/applications/xtool.desktop"
  # xtool.png
  install -Dm644 "Linux/xtool.png" "$pkgdir/usr/share/pixmaps/xtool.png"

  install -Dm755 ".build/release/xtool" "$pkgdir/usr/bin/xtool"

  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
