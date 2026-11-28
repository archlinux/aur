# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=waaiya
pkgver=0.2.19
pkgrel=1
pkgdesc="Removes musical instruments from everything your computer plays and keeps the voice (speech, Quran recitation)"
arch=('x86_64')
url="https://github.com/oksyassine/waaiya"
license=('AGPL-3.0-or-later' 'MIT' 'Apache-2.0' 'BSD-3-Clause')
depends=('at-spi2-core'
         'bash'
         'cairo'
         'fontconfig'
         'glib2'
         'glibc'
         'gtk3'
         'hicolor-icon-theme'
         'libepoxy'
         'libgcc'
         'libpulse'
         'libstdc++'
         'onnxruntime'
         'pango'
         'systemd')
makedepends=('clang'
             'cmake'
             'fvm'
             'git'
             'ninja'
             'unzip')
checkdepends=('python'
              'python-numpy'
              'procps-ng')
optdepends=('pipewire-pulse: sound server'
            'pulseaudio: sound server'

            'libnotify: desktop notice when filtering stops'

            'libx11: screen blur on X11'
            'libxext: screen blur on X11'
            'libxrandr: screen blur on X11'
            'libxdamage: screen blur on X11'
            'wayland: screen blur on Wayland'
            'pipewire: screen blur on Wayland')
_models_tag=models-v1
_vision_tag=models-vision-v1
_flutterver=3.41.5
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$url/releases/download/$_models_tag/dfn3_stream_int8.onnx"
        "$url/releases/download/$_models_tag/dfn3_stream_int8.state_init.bin"
        "$url/releases/download/$_models_tag/detector_v1.onnx"
        "$url/releases/download/$_models_tag/voice_v1_fp16.onnx"
        "$url/releases/download/$_models_tag/voice_v1_fp16.state_init.bin"
        "$url/releases/download/$_vision_tag/person_yolox_nano.onnx"
        "$url/releases/download/$_vision_tag/gender_v2.onnx"
        "$url/releases/download/$_vision_tag/nsfw_marqo_int8.onnx"
        "org.islamicmute.waaiya_desktop.desktop")
sha256sums=('b82486839630fd3e399f0a22ce9e8bd9cdfabc66a3e6966ada75074b9a68cef6'
            'd3cb83617f8c21f2ec1f7a027560c9443f4346a34f6e324d481d8fcf3a320ed0'
            '43350d1f808ed0f92f7cea0a6c33a378c3c63decd46652750c19ab9183797aea'
            'df8e56bd2ce1cef3e2522293b962cfc8b0edde39a88a82659a30ac577658f939'
            'a849608386b55381f0db594c63e15a7530f4c258f8adc4ac59c1babf0c061f3b'
            '43350d1f808ed0f92f7cea0a6c33a378c3c63decd46652750c19ab9183797aea'
            '84ffd72339c81f196c1db930dac1bc9b9e90d8aadd9f46ba74a169d6f2b9aa73'
            '057dd0a0da51caddd6d8173dcb89a9d9addb9f52333070ce773d500cb0362d93'
            '827c9e6ba79202b6edc2e01efc9ffb74c2eb040599d52d4436e7d2a9eb577d16'
            '9cc57fd4cda9242aa8058a28d2424bd036de2ec3118cc8a90614f676881b2f16')

prepare() {
  cd "$pkgname-$pkgver"
  # Build against Arch's ONNX Runtime instead of the one scripts/fetch_deps.sh downloads
  mkdir -p third_party/onnxruntime/lib
  ln -sfn /usr/include/onnxruntime third_party/onnxruntime/include
  ln -sf /usr/lib/libonnxruntime.so /usr/lib/libonnxruntime.so.1 third_party/onnxruntime/lib/
  ln -sf /usr/share/licenses/"$(pacman -Qqo /usr/lib/libonnxruntime.so)"/{LICENSE,ThirdPartyNotices.txt} third_party/onnxruntime/
  # Put the release models where scripts/fetch_deps.sh would
  install -Dm644 "$srcdir"/dfn3_stream_int8.{onnx,state_init.bin} -t models/dfn3/
  install -Dm644 "$srcdir"/detector_v1.onnx -t models/detector/
  install -Dm644 "$srcdir"/voice_v1_fp16.{onnx,state_init.bin} -t models/voice/v3/
  install -Dm644 "$srcdir"/{person_yolox_nano,gender_v2,nsfw_marqo_int8}.onnx -t models/vision/
  # The "no pactl" test expects no pactl in /usr/bin, but libpulse ships one: use a copy of /usr/bin without it
  sed -i "s|'PATH': '\${p('bin')}:/usr/bin:/bin'|'PATH': '\${p('bin')}:$srcdir/test-path'|" desktop/test/linux_engine_test.dart
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS="$CFLAGS -std=c11 -D_POSIX_C_SOURCE=200809L $LDFLAGS" make all
  export FVM_CACHE_PATH="$srcdir/fvm-cache" PUB_CACHE="$srcdir/pub-cache"
  fvm install "$_flutterver" --fvm-skip-input
  fvm spawn "$_flutterver" --disable-analytics
  cd desktop
  fvm spawn "$_flutterver" build linux --release
  bash tool/bundle_engine.sh build/linux/x64/release/bundle
}

check() {
  cd "$pkgname-$pkgver"
  CFLAGS="$CFLAGS -std=c11 -D_POSIX_C_SOURCE=200809L $LDFLAGS" make build/test-mono build/test-failclosed build/test-detector build/test-cover build/test-blur-core build/no-network.so
  build/test-mono models/dfn3/dfn3_stream_int8.onnx
  build/test-failclosed models/dfn3/dfn3_stream_int8.onnx
  build/test-cover
  build/test-blur-core
  linux/test_no_network.sh
  python models/vision/test_cover.py
  python linux/test_daemon_fake.py
  python linux/test_filter_off_apps.py
  mkdir -p "$srcdir"/test-path
  find /usr/bin -maxdepth 1 ! -type d ! -name pactl -exec ln -sf {} "$srcdir"/test-path/ \;
  export FVM_CACHE_PATH="$srcdir/fvm-cache" PUB_CACHE="$srcdir/pub-cache"
  cd ui
  fvm spawn "$_flutterver" test
  cd ../desktop
  fvm spawn "$_flutterver" test --concurrency=1
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir"/usr/lib/$pkgname "$pkgdir"/usr/bin
  cp -a desktop/build/linux/x64/release/bundle/. "$pkgdir"/usr/lib/$pkgname/
  rm "$pkgdir"/usr/lib/$pkgname/install-desktop-entry.sh
  ln -s /usr/lib/$pkgname/waaiya_desktop "$pkgdir"/usr/bin/waaiya-desktop
  ln -s /usr/lib/$pkgname/engine/linux/bin/waaiya "$pkgdir"/usr/bin/waaiya
  install -Dm644 ../org.islamicmute.waaiya_desktop.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 desktop/linux/runner/resources/waaiya.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/org.islamicmute.waaiya_desktop.png
  install -Dm644 android/app/licences/DeepFilterNet-LICENSE-MIT.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 models/detector/efficientat/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/EfficientAT-LICENSE.txt
  install -Dm644 "$srcdir"/fvm-cache/versions/$_flutterver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/Flutter-LICENSE.txt
}
