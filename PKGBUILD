# Maintainer: jmx4013 <jmx4013@proton.me>

pkgname=fushi
pkgver=3.0.1
pkgrel=1
pkgdesc='Immersion language-learning suite: EPUB reader, video subtitle lookup, audiobook sync, and one-tap Anki mining'
arch=('x86_64')
url='https://github.com/hajisensai/Fushi'
license=('GPL-3.0-or-later')
depends=('gtk3' 'libkeybinder3' 'mpv' 'wpewebkit')
makedepends=('clang' 'cmake' 'ninja' 'pkg-config' 'unzip' 'libwpe' 'wpebackend-fdo')
optdepends=('qbittorrent: fallback torrent engine when the bundled libtorrent is unavailable')
source=("https://github.com/hajisensai/Fushi/archive/refs/tags/v3.0.1.tar.gz#/fushi-3.0.1.tar.gz"
        'https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.47.6-stable.tar.xz'
        'fix-fushidicts-cstdint.patch'
        'wpe-inappwebview-linux.patch'
        'fushi.desktop')
sha256sums=('ab3885431c5b46a6b9ff437379f0e2d1affec59c6430ef814067eb9493941958'
            'f1631b9c2c8b3529323db412b0d1beacf4a748f8783b0d7cf599a8fd5f461675'
            '8334fd0a75f8cfdfff0873b3c9ae9f0d19acfffdf59c07d4cb4d95b1e3ed2391'
            '6e4f78055d6279642240691b743f381ae855e1b241c9e4bc60d9ebb8b41845c8'
            'c96cbc90cca94c8e7d661003e65b9206ae6f060a29f409e509f1f5b6393dc3ec')

prepare() {
  cd "${srcdir}/Fushi-${pkgver}"
  patch -p1 -i "${srcdir}/fix-fushidicts-cstdint.patch"
  patch -p1 -i "${srcdir}/wpe-inappwebview-linux.patch"
}

# Project is locked to Flutter 3.47.6 (the AUR flutter package is a different,
# older release), so the pinned SDK tarball is carried as a source. Dart SDK is
# bundled in that tarball; everything else resolves via pub.
#
# The v2.1.1 tag's pubspec still says 2.0.0+1210 (upstream stamps versions via
# CI flags, not pubspec), so without a fix the app would see itself as 2.0.0 and
# prompt an update to the manifest's 2.1.1 forever. flutter build --build-name/
# --build-number do NOT apply to Linux (version.json is generated from pubspec),
# so the bundle's data/flutter_assets/version.json is rewritten at package time
# to mirror the official desktop release: version=<pkgver>, build_number=<seq>
# (the releaseSequence of latest-stable-fushi.json, which the in-app updater
# compares). Bump _release_seq together with pkgver when updating.
_release_seq=19816
build() {
  export FLUTTER_ROOT="${srcdir}/flutter"
  export PATH="${FLUTTER_ROOT}/bin:${PATH}"
  export PUB_CACHE="${srcdir}/pub-cache"
  cd "${srcdir}/Fushi-${pkgver}"
  bash tool/bootstrap.sh
  cd fushi
  flutter build linux --release
}

package() {
  local srcdir_app="${srcdir}/Fushi-${pkgver}"
  local bundle="${srcdir_app}/fushi/build/linux/x64/release/bundle"
  local dest="${pkgdir}/usr/lib/fushi"
  install -dm755 "${dest}"
  cp -a "${bundle}/." "${dest}/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/lib/fushi/fushi "${pkgdir}/usr/bin/fushi"
  # Linux has no version pipeline: overwrite the pubspec-derived version.json
  # so PackageInfo (and thus the in-app updater) reports the real release.
  printf '{"app_name":"fushi","version":"3.0.1","build_number":"19816","package_name":"fushi"}' > "${dest}/data/flutter_assets/version.json"
  install -Dm644 "${srcdir_app}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/fushi.desktop" "${pkgdir}/usr/share/applications/fushi.desktop"
  install -Dm644 "${srcdir_app}/fushi/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png" \
    "${pkgdir}/usr/share/pixmaps/fushi.png"
  # flutter_onnxruntime copies only the dev symlink (-> libonnxruntime.so.1);
  # the versioned real lib never lands in the bundle, so the bundle's symlink is
  # broken at runtime. Ship the real .so.1.22.0 into the same lib dir.
  local ort_lib
  ort_lib=$(find "${srcdir_app}/fushi/build/linux/x64/release/plugins/flutter_onnxruntime" \
    -type d -path '*onnxruntime-linux-x64*/lib' | head -1)
  cp -a "${ort_lib}/." "${dest}/lib/"
}