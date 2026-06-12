# Maintainer: robertfoster
pkgname=opencie
pkgver=0.1.0 # renovate: datasource=github-tags depName=M0Rf30/opencie extractVersion=^v(?<version>.+)$
pkgrel=1
pkgdesc="Digital signatures and verification with the Italian Electronic Identity Card (CIE)"
arch=('x86_64' 'aarch64')
url="https://github.com/M0Rf30/opencie"
license=('GPL-2.0-or-later')
depends=('opencie-pkcs11' 'gtk3' 'pcsclite')
makedepends=('fvm' 'clang' 'cmake' 'ninja' 'pkgconf' 'git' 'patchelf')
# Flutter SDK version to build with (matches upstream CI); fetched via fvm.
_flutter=3.41.9 # renovate: datasource=github-tags depName=flutter/flutter
source=("$pkgname-$pkgver.tar.gz::https://github.com/M0Rf30/opencie/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7c925768d30b4cc23b896a2f4af438cf21a9833e5b43fa893edca7fa976225a')

build() {
  cd "$pkgname-$pkgver"
  export FLUTTER_SUPPRESS_ANALYTICS=true
  # flutter_webrtc's bundled libwebrtc headers (rtc_types.h) use uint32_t
  # without including <cstdint>, which fails on the current toolchain's
  # libstdc++ (no transitive include). Force-include it for all C++ targets.
  export CXXFLAGS="-include cstdint ${CXXFLAGS:-}"
  # No global flutter package: use fvm to fetch the pinned SDK and build.
  fvm install "$_flutter"
  fvm spawn "$_flutter" config --enable-linux-desktop
  fvm spawn "$_flutter" pub get
  # The native PKCS#11 library is provided by the opencie-pkcs11 package
  # (/usr/lib/libopencie-pkcs11.so) and loaded via dlopen at runtime, so it is
  # intentionally not bundled here (the linux build only warns when it is
  # absent, then we drop any bundled copy in package()).
  fvm spawn "$_flutter" build linux --release
}

package() {
  cd "$pkgname-$pkgver"
  local bundle="build/linux/${CARCH/x86_64/x64}/release/bundle"
  bundle="${bundle/aarch64/arm64}"

  install -d "$pkgdir/usr/lib/opencie"
  cp -r "$bundle/." "$pkgdir/usr/lib/opencie/"
  # Strip build-tree ($srcdir) references makepkg warns about:
  #  - Flutter bakes the build dir into plugin RUNPATHs; at runtime every
  #    bundled lib sits in the same dir, so reset those to $ORIGIN.
  local so rpath
  for so in "$pkgdir/usr/lib/opencie/lib/"*.so; do
    rpath=$(patchelf --print-rpath "$so" 2>/dev/null || true)
    [[ "$rpath" == *"$srcdir"* ]] && patchelf --set-rpath '$ORIGIN' "$so"
  done
  #  - The Dart AOT snapshot (libapp.so) embeds the absolute path of the
  #    generated dart_plugin_registrant as a diagnostic URI (never opened).
  #    Overwrite the $srcdir prefix in place with an equal-length byte run so
  #    snapshot string offsets stay intact.
  local libapp="$pkgdir/usr/lib/opencie/lib/libapp.so"
  if [[ -f "$libapp" ]]; then
    local pad
    pad=$(printf '%*s' "${#srcdir}" '' | tr ' ' '/')
    SRC="$srcdir" PAD="$pad" perl -0777 -pi -e 's/\Q$ENV{SRC}\E/$ENV{PAD}/g' "$libapp"
  fi

  # use the system libopencie-pkcs11.so, not a bundled copy
  rm -f "$pkgdir/usr/lib/opencie/lib/libopencie-pkcs11.so"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/opencie/opencie "$pkgdir/usr/bin/opencie"

  install -Dm644 flatpak/io.github.m0rf30.opencie.desktop \
    "$pkgdir/usr/share/applications/io.github.m0rf30.opencie.desktop"
  install -Dm644 flatpak/io.github.m0rf30.opencie.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.m0rf30.opencie.metainfo.xml"
  install -Dm644 linux/runner/resources/io.github.m0rf30.opencie.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.m0rf30.opencie.png"
}
