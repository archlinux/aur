# Maintainer: jmx4013 <jmx4013@proton.me>
# Beta track of the post-rename Fushi (v2.2.4-beta.13362). Conflicts with the
# stable `fushi` package; installs into the same /usr/lib/fushi layout.

pkgname=fushi-beta
pkgver=2.5.0beta14675
pkgrel=1
pkgdesc='Immersion language-learning suite: EPUB reader, video subtitle lookup, audiobook sync, and one-tap Anki mining (beta)'
arch=('x86_64')
url='https://github.com/hajisensai/Fushi'
license=('GPL-3.0-or-later')
depends=('gtk3' 'libkeybinder3' 'mpv' 'wpewebkit')
conflicts=('fushi')
provides=('fushi')
makedepends=('clang' 'cmake' 'ninja' 'pkg-config' 'unzip' 'libwpe' 'wpebackend-fdo')
optdepends=('qbittorrent: fallback torrent engine when the bundled libtorrent is unavailable')
source=('https://github.com/hajisensai/Fushi/archive/refs/tags/v2.5.0-beta.14675.tar.gz#/fushi-2.5.0beta14675.tar.gz'
        'https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.44.0-stable.tar.xz'
        'fix-fushidicts-cstdint.patch'
        'wpe-inappwebview-linux.patch'
        'fushi.desktop')
sha256sums=('f0e8d7abc1032186feaa513b96ced2a13c23c26e2085a6091f3bb9fac146a484'
            'e1ec95e6c550458a34de93580cb85dac24da0e9bedb9bb42811f050ac5a0c7d5'
            '8334fd0a75f8cfdfff0873b3c9ae9f0d19acfffdf59c07d4cb4d95b1e3ed2391'
            '12157c9050b3d984803b59e2d4e1b344af4be4218b36a8c168b862d802ca1556'
            'c96cbc90cca94c8e7d661003e65b9206ae6f060a29f409e509f1f5b6393dc3ec')

prepare() {
  cd "${srcdir}/Fushi-2.5.0-beta.14675"
  patch -p1 -i "${srcdir}/fix-fushidicts-cstdint.patch"
  patch -p1 -i "${srcdir}/wpe-inappwebview-linux.patch"
}

build() {
  export FLUTTER_ROOT="${srcdir}/flutter"
  export PATH="${FLUTTER_ROOT}/bin:${PATH}"
  export PUB_CACHE="${srcdir}/pub-cache"
  cd "${srcdir}/Fushi-2.5.0-beta.14675"
  bash tool/bootstrap.sh
  cd fushi
  flutter build linux --release
}

package() {
  local srcdir_app="${srcdir}/Fushi-2.5.0-beta.14675"
  local bundle="${srcdir_app}/fushi/build/linux/x64/release/bundle"
  local dest="${pkgdir}/usr/lib/fushi"
  install -dm755 "${dest}"
  cp -a "${bundle}/." "${dest}/"
  # Linux has no version pipeline: overwrite the pubspec-derived version.json
  # so PackageInfo (and thus the in-app updater) reports the beta release.
  printf '{"app_name":"fushi","version":"2.5.0-beta.14675","build_number":"14675","package_name":"fushi"}' > "${dest}/data/flutter_assets/version.json"
  install -Dm644 "${srcdir_app}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/fushi.desktop" "${pkgdir}/usr/share/applications/fushi.desktop"
  install -Dm644 "${srcdir_app}/fushi/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png" \
    "${pkgdir}/usr/share/pixmaps/fushi.png"
  # flutter_onnxruntime copies only the dev symlink (-> libonnxruntime.so.1);
  # the versioned real lib never lands in the bundle, so the bundle's symlink is
  # broken at runtime. Ship the real .so alongside.
  local ort_lib
  ort_lib=$(find "${srcdir_app}/fushi/build/linux/x64/release/plugins/flutter_onnxruntime" \
    -type d -path '*onnxruntime-linux-x64*/lib' | head -1)
  cp -a "${ort_lib}/." "${dest}/lib/"
}