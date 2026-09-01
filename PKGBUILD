# Maintainer: jmx4013 <jmx4013@proton.me>

pkgname=fushi
pkgver=2.1.1
pkgrel=1
pkgdesc='Immersion language-learning suite: EPUB reader, video subtitle lookup, audiobook sync, and one-tap Anki mining'
arch=('x86_64')
url='https://github.com/hajisensai/Fushi'
license=('GPL-3.0-or-later')
depends=('gtk3' 'libkeybinder3' 'mpv')
makedepends=('clang' 'cmake' 'ninja' 'pkg-config' 'unzip')
optdepends=('qbittorrent: fallback torrent engine when the bundled libtorrent is unavailable')
source=("https://github.com/hajisensai/Fushi/archive/refs/tags/v${pkgver}.tar.gz#/fushi-${pkgver}.tar.gz"
        'https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.44.0-stable.tar.xz'
        'fix-hoshidicts-includes.patch'
        'fushi.desktop')
sha256sums=('540e087ecdf33293a5cd8329049fcc7b05da5337429eb6db68ef650cbbaa4844'
            'e1ec95e6c550458a34de93580cb85dac24da0e9bedb9bb42811f050ac5a0c7d5'
            'ebaa703fe2bf866265c01d47e2bb2bf1195b654fce98fe7ad3ced2dfd8c81038'
            'd433c22716392af6845ad58ec5b243487c21076a7b1017d704ef84b14909afaf')

prepare() {
  cd "${srcdir}/Fushi-${pkgver}"
  patch -p1 -i "${srcdir}/fix-hoshidicts-includes.patch"
}

# Project is locked to Flutter 3.44.0 (the AUR flutter package is a different,
# older release), so the pinned SDK tarball is carried as a source. Dart SDK is
# bundled in that tarball; everything else resolves via pub.
build() {
  export FLUTTER_ROOT="${srcdir}/flutter"
  export PATH="${FLUTTER_ROOT}/bin:${PATH}"
  export PUB_CACHE="${srcdir}/pub-cache"
  cd "${srcdir}/Fushi-${pkgver}"
  bash tool/bootstrap.sh
  cd hibiki
  flutter build linux --release
}

package() {
  local srcdir_app="${srcdir}/Fushi-${pkgver}"
  local bundle="${srcdir_app}/hibiki/build/linux/x64/release/bundle"
  local dest="${pkgdir}/usr/lib/fushi"
  install -dm755 "${dest}"
  cp -a "${bundle}/." "${dest}/"
  install -Dm644 "${srcdir_app}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/fushi.desktop" "${pkgdir}/usr/share/applications/fushi.desktop"
  install -Dm644 "${srcdir_app}/hibiki/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png" \
    "${pkgdir}/usr/share/pixmaps/fushi.png"
  # flutter_onnxruntime copies only the dev symlink (-> libonnxruntime.so.1);
  # the versioned real lib never lands in the bundle, so the bundle's symlink is
  # broken at runtime. Ship the real .so.1.22.0 into the same lib dir.
  local ort_lib
  ort_lib=$(find "${srcdir_app}/hibiki/build/linux/x64/release/plugins/flutter_onnxruntime" \
    -type d -path '*onnxruntime-linux-x64*/lib' | head -1)
  cp -a "${ort_lib}/." "${dest}/lib/"
}