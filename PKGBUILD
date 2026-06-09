pkgname=sfptool
pkgver=1.4.2
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
  "sfp-tool-v${pkgver}.tar.gz::https://jonasled.dev/jonasled/sfp-tool/-/archive/v1.4.2/sfp-tool-v1.4.2.tar.gz"
  "transceivertool-ae0163efc991402f1e0231078e69379471613ee4.tar.gz::https://github.com/robinchrist/TransceiverTool/archive/ae0163efc991402f1e0231078e69379471613ee4.tar.gz"
  "cppcodec-v0.2.tar.gz::https://github.com/tplgy/cppcodec/archive/refs/tags/v0.2.tar.gz"
)
sha256sums=('f2cb7f505a7afe0d85df634f621dca160596a4dde44fd64bd756723da38b3df1' '77b030fc853dbd3f94d31d99c66e3e2a7c81c7c1654ba5cae01581b0959018ac' '0edaea2a9d9709d456aa99a1c3e17812ed130f9ef2b5c2d152c230a5cbc5c482')

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
  python - <<'PY'
import json
from pathlib import Path

config_path = Path("src-tauri/tauri.conf.json")
config = json.loads(config_path.read_text())
config["version"] = "1.4.2"
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
