pkgname=sfptool
pkgver=0.9.2
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64' 'aarch64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('custom:unlicensed')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedepends=('cargo' 'cmake' 'desktop-file-utils' 'emscripten' 'fmt' 'git' 'javascriptcoregtk-4.1' 'ninja' 'nlohmann-json' 'nodejs' 'patchelf' 'pkgconf' 'python' 'rust' 'libsoup3' 'webkit2gtk-4.1' 'yarn')
provides=('sfptool')
conflicts=('sfptool-bin')
source=(
  "sfp-tool-v${pkgver}.tar.gz::https://jonasled.dev/jonasled/sfp-tool/-/archive/v0.9.2/sfp-tool-v0.9.2.tar.gz"
  "transceivertool-ae0163efc991402f1e0231078e69379471613ee4.tar.gz::https://github.com/robinchrist/TransceiverTool/archive/ae0163efc991402f1e0231078e69379471613ee4.tar.gz"
  "cppcodec-v0.2.tar.gz::https://github.com/tplgy/cppcodec/archive/refs/tags/v0.2.tar.gz"
)
sha256sums=('bbae9c70ab6586628bbde8622f98dc081fa569c93cc5733f81638c5ec54b3c95' '77b030fc853dbd3f94d31d99c66e3e2a7c81c7c1654ba5cae01581b0959018ac' '0edaea2a9d9709d456aa99a1c3e17812ed130f9ef2b5c2d152c230a5cbc5c482')

prepare() {
  cd "$srcdir/sfp-tool-v${pkgver}"
  rm -rf external/TransceiverTool external/cppcodec
  mkdir -p external
  mv "$srcdir/TransceiverTool-ae0163efc991402f1e0231078e69379471613ee4" external/TransceiverTool
  mv "$srcdir/cppcodec-0.2" external/cppcodec
}

build() {
  cd "$srcdir/sfp-tool-v${pkgver}/software/App/SFP-Tool"
  export CPP_CODEC_DIR="$srcdir/sfp-tool-v${pkgver}/external/cppcodec"
  export CARGO_TARGET_DIR="$srcdir/target"
  export npm_config_cache="$srcdir/npm-cache"
  yarn install --frozen-lockfile --cache-folder "$npm_config_cache"
  bash scripts/build-transceiver-wasm.sh
  yarn tauri build --bundles deb
}

package() {
  cd "$srcdir/sfp-tool-v${pkgver}/software/App/SFP-Tool/src-tauri/target/release/bundle/deb"
  local deb_arch
  local data_archive
  case "$CARCH" in
    x86_64) deb_arch="amd64" ;;
    aarch64) deb_arch="arm64" ;;
    *) echo "Unsupported architecture: $CARCH" >&2; return 1 ;;
  esac
  local deb_file="sfp-tool_${pkgver}_${deb_arch}.deb"
  data_archive="$(bsdtar -tf "$deb_file" | grep '^data.tar\.' | head -n1)"
  bsdtar -xOf "$deb_file" "$data_archive" | bsdtar -xf - -C "$pkgdir"
}
