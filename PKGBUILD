# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=xtool
pkgver=1.20.1
pkgrel=1
pkgdesc="Cross-platform Xcode replacement."
arch=('x86_64')
url="https://xtool.sh/"
license=('MIT')
depends=(
  'usbmuxd'
  'swift-bin'
  'zip'
  'xadi'
)
makedepends=(
  'git'
  'clang'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/xtool-org/$pkgname/archive/refs/tags/$pkgver.tar.gz"
  "swift-bin-toolset.json"
)
b2sums=(
  '4eec131e4dfc453b51869dadc09c14db453c5e085ded834b89a714a7e24a87f49031ca841bf922ff977df291859dd80e6410ade461cd775dd2f02b35ed15d387'
  'dc77d0b3b7d6cbde56f954d02e6fc490b5c60796ae0f376d5aa2d7d8a805df7e701b76db7b7664a4a1c91fffadba993b483aaaf8021b0d45cb94393502cb5b4e'
)

build() {
  cd "$pkgname-$pkgver"

  # Use swift-bin's real toolchain binaries.  The compatibility symlink can
  # make SwiftPM derive /usr/lib/swift/host instead of /usr/lib/swift/lib/swift/host.
  local swift_bin_dir=/usr/lib/swift/bin
  [[ -x "$swift_bin_dir/swift" && -x "$swift_bin_dir/swiftc" ]] || {
    error "swift-bin toolchain binaries are missing from $swift_bin_dir"
  }
  export PATH="$swift_bin_dir:$PATH"
  export SWIFT_EXEC="$swift_bin_dir/swiftc"
  export SWIFT_DRIVER_SWIFT_EXEC="$swift_bin_dir/swiftc"

  # swift-bin installs resources below the toolchain's runtime resource path;
  # derive it so this works across swift-bin layout changes and architectures.
  local swift_runtime_path
  swift_runtime_path="$(swiftc -print-target-info | sed -n 's/.*"runtimeResourcePath"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')"
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
  "$swift_bin_dir/swift" package resolve

  # SwiftPM appends its own (unrelocated) plugin paths after -Xswiftc flags.
  # Swift's driver appends this environment variable last, allowing the
  # swift-bin paths to take precedence.
  export ADDITIONAL_SWIFT_DRIVER_FLAGS="-in-process-plugin-server-path $swift_plugin_server -plugin-path $swift_runtime_path/host/plugins"

  "$swift_bin_dir/swift" build --toolset "$srcdir/swift-bin-toolset.json" -c release --product xtool \
    -Xswiftc -plugin-path \
    -Xswiftc "$swift_runtime_path/host/plugins" \
    -Xswiftc -load-plugin-library \
    -Xswiftc "$swift_macros" \
    -Xswiftc -in-process-plugin-server-path \
    -Xswiftc "$swift_plugin_server" \
    -Xswiftc -tools-directory \
    -Xswiftc "$swift_bin_dir" \
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
