# Maintainer: hiruocha <hiruocha[at]outlook[dot]com>

pkgname=nipaplay-reload
pkgver=1.11.4
pkgrel=1
pkgdesc="A cross platform danmaku video player"
arch=('x86_64')
url="https://github.com/AimesSoft/NipaPlay-Reload"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-reload}")

depends=('gtk3'
         'mpv'
         'ffmpeg'
         'libass'
         'sqlite'
         'libkeybinder3'
         'alsa-lib'
         'libayatana-appindicator'
         'libevdev'
         'gstreamer'
         'libc++')
makedepends=('clang'
             'cmake'
             'ninja'
             'pkg-config'
             'fvm'
             'git'
             'llvm'
             'cargo'
             'python'
             'patchelf')
source=("git+https://github.com/AimesSoft/NipaPlay-Reload.git#tag=v$pkgver"
        "git+https://github.com/AimesSoft/media-kit.git"
        "git+https://github.com/AimesSoft/libmpv-darwin-build.git"
        "git+https://github.com/AimesSoft/mpv.git"
        "git+https://github.com/AimesSoft/libplacebo.git"
        "fix-dart-path.patch"
        "use-system-cargo.patch")
sha256sums=('23816a89a8d14dacb149c4526d00068856648c4c574db82c47eee7d4b3213dae'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '5571b73e8f03a9fa1d4821486bbb0cf1c362180f6c68d26e9477d7cf35b71d51'
            'c1a31687404dd9cf73cd415ead0a4940410b3a1a19e000d539e610e6bfd422b0')

prepare() {
  cd "$srcdir/NipaPlay-Reload"

  git submodule init
  git config submodule.third_party/media-kit-upstream.url "$srcdir/media-kit"
  git config submodule.third_party/libmpv-darwin-build.url "$srcdir/libmpv-darwin-build"
  git config submodule.third_party/mpv.url "$srcdir/mpv"
  git config submodule.third_party/libplacebo.url "$srcdir/libplacebo"
  git -c protocol.file.allow=always submodule update

  patch -Np1 -i "$srcdir/fix-dart-path.patch"
  patch -Np1 -i "$srcdir/use-system-cargo.patch"

  local flutter_version
  flutter_version=$(tr -d '[:space:]' < .flutter-version-linux)
  fvm install "$flutter_version"
  fvm use "$flutter_version"

  python .github/workflows/scripts/generate-build-info-json.py assets/build_info.json

  fvm dart run tool/configure_flutter_dependencies.dart linux
  fvm flutter pub get
}

build() {
  cd "$srcdir/NipaPlay-Reload"
  fvm flutter build linux --release -v
}

package() {
  cd "$srcdir/NipaPlay-Reload"

  install -dm755 "$pkgdir/opt/${pkgname%-reload}"
  cp -r build/linux/x64/release/bundle/* "$pkgdir/opt/${pkgname%-reload}/"

  find "$pkgdir/opt/${pkgname%-reload}" -name '*.so' -exec patchelf --remove-rpath {} \;

  install -Dm755 assets/linux/launcher.sh "$pkgdir/opt/${pkgname%-reload}/launcher.sh"

  install -Dm644 assets/linux/io.github.MCDFsteve.NipaPlay-Reload.desktop \
    "$pkgdir/usr/share/applications/io.github.MCDFsteve.NipaPlay-Reload.desktop"
  install -Dm644 assets/images/logo512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.MCDFsteve.NipaPlay-Reload.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
