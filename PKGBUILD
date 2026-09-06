pkgname=sfptool
pkgver=1.4.3
pkgrel=1
pkgdesc="Desktop utility for reading and programming SFP and QSFP transceivers"
arch=('x86_64' 'aarch64')
url="https://jonasled.dev/jonasled/sfp-tool"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
makedepends=('cargo' 'cmake' 'conan' 'desktop-file-utils' 'emscripten' 'fmt' 'git' 'binutils' 'ninja' 'nlohmann-json' 'nodejs' 'patchelf' 'pkgconf' 'python' 'rust' 'libsoup3' 'webkit2gtk-4.1' 'yarn')
provides=('sfptool')
conflicts=('sfptool-bin')
source=(
  "sfp-tool-v${pkgver}.tar.gz::https://jonasled.dev/jonasled/sfp-tool/-/archive/v1.4.3/sfp-tool-v1.4.3.tar.gz"
  "transceivertool-7ba6762349a6ac9ad73f4c1a4d7d67bdfc966986.tar.gz::https://github.com/robinchrist/TransceiverTool/archive/7ba6762349a6ac9ad73f4c1a4d7d67bdfc966986.tar.gz"
  "cppcodec-v0.2.tar.gz::https://github.com/tplgy/cppcodec/archive/refs/tags/v0.2.tar.gz"
)
sha256sums=('65a2e04f57f9a4643827f6ff5ddfd6f3c372d17204dfce45903acb54ba047d9c' '73639400c97390ec24ffc3fd566f877bf06064ea961278f555c9d6c8fee49bb8' '0edaea2a9d9709d456aa99a1c3e17812ed130f9ef2b5c2d152c230a5cbc5c482')

prepare() {
  cd "$srcdir/sfp-tool-v${pkgver}"
  rm -rf external/TransceiverTool external/cppcodec
  mkdir -p external
  mv "$srcdir/TransceiverTool-7ba6762349a6ac9ad73f4c1a4d7d67bdfc966986" external/TransceiverTool
  mv "$srcdir/cppcodec-0.2" external/cppcodec
}

build() {
  cd "$srcdir/sfp-tool-v${pkgver}/software/App/SFP-Tool"
  export CPP_CODEC_DIR="$srcdir/sfp-tool-v${pkgver}/external/cppcodec"
  export CARGO_TARGET_DIR="$srcdir/target"
  export npm_config_cache="$srcdir/npm-cache"
  yarn install --frozen-lockfile --cache-folder "$npm_config_cache"
  bash scripts/build-transceiver-wasm.sh
  python - <<'PY'
import json
from pathlib import Path

config_path = Path("src-tauri/tauri.conf.json")
config = json.loads(config_path.read_text())
config["version"] = "1.4.3"
config.setdefault("bundle", {})["createUpdaterArtifacts"] = False
config_path.write_text(json.dumps(config, indent=2))
PY
  yarn tauri build --bundles deb
}

package() {
  cd "$srcdir/target/release/bundle/deb"
  local deb_arch
  local data_archive
  case "$CARCH" in
    x86_64) deb_arch="amd64" ;;
    aarch64) deb_arch="arm64" ;;
    *) echo "Unsupported architecture: $CARCH" >&2; return 1 ;;
  esac
  ar x sfp-tool_*.deb
  tar -xvf data.tar.* -C "$pkgdir/"
}
