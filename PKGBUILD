# Maintainer: hiruocha <hiruocha[at]outlook[dot]com>

pkgname=nipaplay-reload
pkgver=1.11.9
pkgrel=2
pkgdesc="A cross platform danmaku video player"
arch=('x86_64')
url="https://github.com/AimesSoft/NipaPlay-Reload"
license=('MIT' 'MPL-2.0' 'ISC')
conflicts=("${pkgname%-reload}")

depends=('gtk3'
         'mpv'
         'ffmpeg'
         'sqlite'
         'libkeybinder3'
         'alsa-lib'
         'libayatana-appindicator'
         'libevdev'
         'gstreamer'
         'libpulse'
         'vulkan-icd-loader'
         'libepoxy'
         'wayland'
         'freetype2'
         'harfbuzz'
         'fribidi'
         'fontconfig'
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
             'patchelf'
             'meson'
             'vulkan-headers')
source=("git+https://github.com/AimesSoft/NipaPlay-Reload.git#tag=v$pkgver"
        "git+https://github.com/AimesSoft/Erika.git#tag=v0.2.1"
        "git+https://github.com/AimesSoft/media-kit.git"
        "git+https://github.com/AimesSoft/libmpv-darwin-build.git"
        "git+https://github.com/AimesSoft/mpv.git"
        "git+https://github.com/AimesSoft/libplacebo.git"
        "libass-0.17.5.tar.xz::https://github.com/libass/libass/releases/download/0.17.5/libass-0.17.5.tar.xz"
        "fix-dart-path.patch"
        "use-system-cargo.patch"
        "fix-registrar-view.patch")
sha256sums=('c5361af2e2811868d1189bedc91388b6df1c2ee39dd8d1e0da1f868bf60f8bd1'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2dca25c0e0c837ddf00b52011b3f82cac1e4ddd3ad018227806b0c2288864acc'
            '5571b73e8f03a9fa1d4821486bbb0cf1c362180f6c68d26e9477d7cf35b71d51'
            'c1a31687404dd9cf73cd415ead0a4940410b3a1a19e000d539e610e6bfd422b0'
            '3c64bb3e13b5cd0a7dc167309c8798741d40e0c17f5b9f5c88fdabf5eef8b9e2')

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
  patch -Np1 -i "$srcdir/fix-registrar-view.patch"

  local flutter_version
  flutter_version=$(tr -d '[:space:]' < .flutter-version-linux)
  fvm install "$flutter_version"
  fvm use "$flutter_version"

  python .github/workflows/scripts/generate-build-info-json.py assets/build_info.json

  fvm dart run tool/configure_flutter_dependencies.dart linux
  fvm flutter pub get
}

build() {
  cd "$srcdir/Erika"
  install -d third_party/cache
  cp "$srcdir/libass-0.17.5.tar.xz" third_party/cache/

  bash scripts/build_linux_libass.sh

  export LIBCLANG_PATH="$(llvm-config --libdir)"
  cargo build --locked --release -p erika_capi
  export ERIKA_LIBRARY_DIR="$srcdir/Erika/target/release"

  cd "$srcdir/NipaPlay-Reload"
  fvm flutter build linux --release -v --dart-define=NIPAPLAY_LINUX_ERIKA=true
}

package() {
  cd "$srcdir/NipaPlay-Reload"

  install -dm755 "$pkgdir/opt/${pkgname%-reload}"
  cp -r build/linux/x64/release/bundle/* "$pkgdir/opt/${pkgname%-reload}/"

  find "$pkgdir/opt/${pkgname%-reload}" -name '*.so' -exec patchelf --remove-rpath {} \;

  while IFS= read -r -d '' _f; do
    grep -q -e "$srcdir" -e "$pkgdir" "$_f" 2>/dev/null || continue
    SRCD="$srcdir" SRCR="${srcdir//?/x}" PKGD="$pkgdir" PKGR="${pkgdir//?/x}" \
      perl -0777 -pi -e 's/\Q$ENV{SRCD}\E/$ENV{SRCR}/g; s/\Q$ENV{PKGD}\E/$ENV{PKGR}/g' "$_f"
  done < <(find "$pkgdir" -type f -print0)

  install -Dm755 assets/linux/launcher.sh "$pkgdir/opt/${pkgname%-reload}/launcher.sh"

  install -Dm644 assets/linux/io.github.MCDFsteve.NipaPlay-Reload.desktop \
    "$pkgdir/usr/share/applications/io.github.MCDFsteve.NipaPlay-Reload.desktop"
  install -Dm644 assets/images/logo512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/io.github.MCDFsteve.NipaPlay-Reload.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/Erika/third_party/src/linux-libass-0.17.5/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.libass"
}
