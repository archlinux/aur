# Maintainer: drzoidberg <drzoidberg+aur@cloudblock.dev>
pkgname=polify-git
pkgver=0.2.7.r0.g9ea65ba
pkgrel=1
pkgdesc="Cross-platform music manager with multi-source library, audio fingerprinting, and ID3 tag editing"
arch=('x86_64' 'aarch64')
url="https://buildhut.fly.dev/apps/Polify"
license=('MIT')
depends=('gtk3' 'libepoxy' 'xz' 'mpv' 'ffmpeg' 'sqlite' 'libsecret'
         'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav')
makedepends=('git' 'flutter' 'make' 'patchelf')
provides=('polify')
conflicts=('polify' 'polify-bin')
source=("polify::git+https://git.sr.ht/~drzoidberg/Polify")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/polify"
  local _tag
  if _tag="$(git describe --long --tags 2>/dev/null)"; then
    printf '%s' "$_tag" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "%s.r%s.%s" \
           "$(sed -n 's/^version:[[:space:]]*//p' pubspec.yaml | cut -d+ -f1)" \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "$srcdir/polify"
  make version-info
  flutter pub get
  flutter build linux --release
}

package() {
  cd "$srcdir/polify"

  # Flutter build output: x64 on x86_64, arm64 on aarch64
  local _archdir
  case "$CARCH" in
    x86_64)  _archdir="x64" ;;
    aarch64) _archdir="arm64" ;;
  esac

  local _bundle="build/linux/$_archdir/release/bundle"

  # Application bundle
  install -d "$pkgdir/usr/lib/polify"
  cp -r "$_bundle"/* "$pkgdir/usr/lib/polify/"
  chmod -R 755 "$pkgdir/usr/lib/polify"

  # Remove broken symlink that Flutter's bundler left behind
  rm -f "$pkgdir/usr/lib/polify/lib/libonnxruntime.so"

  # Bundle the real libonnxruntime shared library (Flutter only copies the
  # broken symlink, not the resolved target)
  local _onnxrt_libdir
  _onnxrt_libdir="$(find "build/linux/$_archdir/release/plugins/flutter_onnxruntime" \
    -path '*/onnxruntime-linux-*/lib' -type d -print -quit 2>/dev/null)"
  if [[ -n "$_onnxrt_libdir" ]]; then
    # Copy the versioned real library (e.g. libonnxruntime.so.1.22.0)
    local _onnxrt_real
    _onnxrt_real="$(find "$_onnxrt_libdir" -name 'libonnxruntime.so.*.*.*' \
      -not -type l -print -quit 2>/dev/null)"
    if [[ -n "$_onnxrt_real" ]]; then
      local _realname
      _realname="$(basename "$_onnxrt_real")"
      install -Dm755 "$_onnxrt_real" "$pkgdir/usr/lib/polify/lib/$_realname"
      ln -sf "$_realname" "$pkgdir/usr/lib/polify/lib/libonnxruntime.so.1"
      ln -sf "libonnxruntime.so.1" "$pkgdir/usr/lib/polify/lib/libonnxruntime.so"
    fi

    # Copy optional execution providers library (loaded via dlopen at runtime)
    local _providers
    _providers="$(find "$_onnxrt_libdir" -name 'libonnxruntime_providers_shared.so' \
      -not -type l -print -quit 2>/dev/null)"
    if [[ -n "$_providers" ]]; then
      install -Dm755 "$_providers" "$pkgdir/usr/lib/polify/lib/"
    fi
  fi

  # Fix RUNPATH: remove build directory references so the linker finds
  # co-located libraries in $ORIGIN (the lib/ directory)
  # - Main binary: needs $ORIGIN/lib to find plugins
  # - Plugin .so files: need $ORIGIN to find co-located libraries
  patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/usr/lib/polify/polify" 2>/dev/null || true
  find "$pkgdir/usr/lib/polify/lib" -type f \( -name '*.so' -o -name '*.so.*' \) \
    -exec patchelf --set-rpath '$ORIGIN' {} + 2>/dev/null || true

  # Strip debug symbols and unneeded metadata
  find "$pkgdir/usr/lib/polify" -type f \( -name '*.so' -o -name '*.so.*' \
    -o -not -name '*.*' \) -exec strip --strip-unneeded {} + 2>/dev/null || true

  # Symlink to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/polify/polify "$pkgdir/usr/bin/polify"

  # Desktop entry and icon
  install -Dm644 linux/polify.desktop "$pkgdir/usr/share/applications/polify.desktop"
  install -Dm644 assets/launcher_icon.png "$pkgdir/usr/share/pixmaps/polify.png"
}
