# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=yogurt
pkgver=0.3.36
pkgrel=1
pkgdesc='AI meeting notes that stay on your computer'
arch=(x86_64)
url='https://yogurt.so'
license=(MIT Apache-2.0 BlueOak-1.0.0 BSD-3-Clause ISC OFL-1.1 Python-2.0 Unicode-3.0
  LicenseRef-MIT-Commons-Clause)
_electron=electron44
depends=($_electron glibc hicolor-icon-theme libgcc libpulse libstdc++ opus
  pulse-native-provider vulkan-icd-loader)
makedepends=(cmake git nodejs patchelf pnpm rust shaderc spirv-headers vulkan-headers)
optdepends=('vulkan-driver: speech to text and notes on the GPU'
  'xorg-xwayland: floating recorder widget and call detection on Wayland')
# pinned by app/scripts/whisper-build.mjs and app/scripts/native.mjs
_whisper=d1be6fde11ac6e0407606b4e42fe72d34add8037
_vad=9ffd54a1e1ee413ddf265af9913beaf518d1639b/ggml-silero-v6.2.0.bin
_words=72f0bc868bf00586cba1e50057d8f1998b4abe80/share/dict/web2
source=("$pkgname-$pkgver.tar.gz::https://github.com/FrigadeHQ/yogurt/archive/refs/tags/v$pkgver.tar.gz"
  "git+https://github.com/ggml-org/whisper.cpp.git#commit=$_whisper"
  "https://huggingface.co/ggml-org/whisper-vad/resolve/$_vad"
  "$pkgname-web2::https://raw.githubusercontent.com/freebsd/freebsd-src/$_words"
  system-install.patch
  yogurt.desktop
  yogurt.sh)
b2sums=('bf13a03f9671a2ee78370f8cea35592c06e152f6bc0b9539ecc916cbbe06199bfbdb14bd3fc6cd0e30218026a048efa2052dae8c44f8a4185f224ae22ab9e1e2'
        '3cf4a45b6b1544b72cd7c623e206868fc9ee13d2a9608eec4092c896c1755787afbef206c9136d3b41d29c87929b077bdafb39ded96a615699df084b4a3d73b8'
        '176e7dbdb234269710a14541563bfe058e97692dbac9ab04340cf7c7ac3da6a71d990cd2129d26c7a374a3d2fcae3445b92b204fa4cbd420201b05afafd5c97e'
        '9cf9d06f5dddee12c1cdb3d906ecfc426a13d89866879d59cd826b7cf425be2941bb5e136e9e03de00b2237a615ccaa5775e244c61386b2dab0c5966f87d6556'
        'db3caf2a31f25be523ddf3ea664ff6ae10f08f6cf604e85c8d051921d7189b00f944414b9dcbac6fa025313ca37b0296e89d4cca8989673072a18f1f9635e244'
        '0bf401484fe7b438583e59d3e2beeca86455982e5138a3f08cbf85388b8a2336d5187576ffa0ca25dd51d754b91940ca4328ae5f89fe234f4b2d95a4f74f12c0'
        '76d904bce970359af83b3e2a0ccb6e0ae44eacb05a574bc224a9f834dcd99580ae917113c1697e9964fc67a044da8911976dbb6afd177445f15d6cbab0c64486')

_env() {
  export CARGO_HOME="$srcdir/cargo" CARGO_TARGET_DIR=target RUSTUP_TOOLCHAIN=stable
  export XDG_CACHE_HOME="$srcdir/cache" XDG_DATA_HOME="$srcdir/data"
  export XDG_STATE_HOME="$srcdir/state"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1 NODE_LLAMA_CPP_SKIP_DOWNLOAD=true
}

_pinned() {
  grep -qF -- "$1" "app/$2" || { echo "app/$2 no longer pins $1" >&2; return 1; }
}

prepare() {
  cd $pkgname-$pkgver

  # launch at login and the relaunch from AI apps are tied to $APPIMAGE upstream
  patch -Np1 -i ../system-install.patch

  # stop when upstream moves a pin mirrored above: its build scripts would
  # download the new input themselves, and the Electron major has to follow
  _pinned "$_whisper" scripts/whisper-build.mjs
  _pinned "$_vad" scripts/whisper-build.mjs
  _pinned "$_words" scripts/native.mjs
  _pinned "\"electron\": \"${_electron#electron}." package.json
  ln -sfT "$srcdir"/whisper.cpp app/native/.whisper-build
  install -Dm644 ../${_vad##*/} -t app/resources/vad
  install -Dm644 ../$pkgname-web2 app/resources/dict/words

  # system toolchain and libopus instead of the pinned and bundled ones
  rm app/native/*/rust-toolchain.toml app/native/yogurt-audio-linux/.cargo/config.toml

  _env
  pnpm install --frozen-lockfile
  local manifest
  for manifest in app/native/*/Cargo.toml; do
    cargo fetch --locked --manifest-path "$manifest" --target "$(rustc --print host-tuple)"
  done
}

build() {
  cd $pkgname-$pkgver
  _env
  export CARGO_NET_OFFLINE=true

  pnpm -C app build
  # unpacked: the app finds its helpers in resources/ next to out/, as in a
  # source checkout, because process.resourcesPath belongs to the system Electron
  pnpm -C app exec electron-builder --linux dir --publish never \
    -c.asar=false -c.npmRebuild=false \
    -c.electronDist=/usr/lib/$_electron -c.electronVersion="$(< /usr/lib/$_electron/version)"
}

package() {
  cd $pkgname-$pkgver/app
  local res=dist/linux-unpacked/resources lib="$pkgdir"/usr/lib/$pkgname size

  install -d "$lib"/resources
  cp -a $res/app/. "$lib"
  # by exclusion, so a resource added by a later release is not left behind
  find $res -mindepth 1 -maxdepth 1 ! -name app ! -name licenses ! -name app-update.yml \
    ! -name default_app.asar ! -name Credits.html -exec cp -a -t "$lib"/resources {} +
  # NVIDIA's CUDA runtime (540 MB; those cards use the Vulkan backend) and a
  # musl build of a module whose glibc build is installed next to it
  rm -r "$lib"/node_modules/@node-llama-cpp/linux-x64-cuda* \
    "$lib"/node_modules/@reflink/reflink-linux-x64-musl
  # the prebuilt llama.cpp libraries also search the working directory and
  # the Vulkan SDK path of the machine that built them
  find "$lib"/node_modules/@node-llama-cpp \( -name '*.so' -o -name '*.node' \) \
    -exec patchelf --set-rpath '$ORIGIN' {} +

  install -Dm755 "$srcdir"/yogurt.sh "$pkgdir"/usr/bin/$pkgname
  sed -i "s/@ELECTRON@/$_electron/" "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir"/yogurt.desktop -t "$pkgdir"/usr/share/applications
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 build/icons/${size}x$size.png \
      "$pkgdir"/usr/share/icons/hicolor/${size}x$size/apps/$pkgname.png
  done

  install -Dm644 ../LICENSE ../THIRD_PARTY_NOTICES.md $res/licenses/* \
    -t "$pkgdir"/usr/share/licenses/$pkgname
  rm "$pkgdir"/usr/share/licenses/$pkgname/NVIDIA-CUDA-runtime.txt
}

# vim:set ts=2 sw=2 et:
