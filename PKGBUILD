# Maintainer: Algorant <Algorantic@proton.me>
pkgname=codemogger-git
pkgver=r13.5156917
pkgrel=1
pkgdesc="Local code indexing/search for AI coding agents. Uses Turso for vector storage."
arch=('x86_64' 'aarch64')
url="https://github.com/glommer/codemogger"
license=('MIT')
depends=('bun')
makedepends=('git')
provides=('codemogger')
conflicts=('codemogger')
options=(!strip !debug)
source=("git+https://github.com/glommer/codemogger.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/codemogger"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/codemogger"
  bun install --frozen-lockfile --production

  # Patch transformers cache location to user-writable XDG cache dir.
  python - <<'PY'
from pathlib import Path
p = Path('src/embed/local.ts')
s = p.read_text()
s = s.replace(
    'import { pipeline, type FeatureExtractionPipeline } from "@huggingface/transformers"',
    'import { pipeline, env, type FeatureExtractionPipeline } from "@huggingface/transformers"'
)
needle = 'const MODEL_ID = "Xenova/all-MiniLM-L6-v2"\n\nlet _pipe: FeatureExtractionPipeline | null = null\n'
insert = '''const MODEL_ID = "Xenova/all-MiniLM-L6-v2"\n\nconst DEFAULT_CACHE_ROOT = `${process.env.XDG_CACHE_HOME ?? `${process.env.HOME ?? "."}/.cache`}/codemogger`\nenv.cacheDir = process.env.TRANSFORMERS_CACHE ?? process.env.HF_HOME ?? `${DEFAULT_CACHE_ROOT}/transformers`\nenv.useBrowserCache = false\nenv.useFSCache = true\n\nlet _pipe: FeatureExtractionPipeline | null = null\n'''
if needle in s:
    s = s.replace(needle, insert)
else:
    raise SystemExit('expected snippet not found in src/embed/local.ts')
p.write_text(s)
PY

  # Keep only native Linux prebuilds to reduce package size.
  local _nodearch
  case "$CARCH" in
    x86_64) _nodearch="x64" ;;
    aarch64) _nodearch="arm64" ;;
    *) _nodearch="" ;;
  esac

  if [[ -n "$_nodearch" ]]; then
    # Tree-sitter and other native addons
    while IFS= read -r -d '' _prebuilds_dir; do
      find "$_prebuilds_dir" -mindepth 1 -maxdepth 1 -type d ! -name "linux-${_nodearch}" -exec rm -rf {} +
    done < <(find node_modules -type d -name prebuilds -print0)

    # onnxruntime-node bundles per-OS/arch binaries
    local _ort_dir="node_modules/onnxruntime-node/bin/napi-v3"
    if [[ -d "$_ort_dir" ]]; then
      find "$_ort_dir" -mindepth 1 -maxdepth 1 -type d ! -name "linux" -exec rm -rf {} +
      if [[ -d "$_ort_dir/linux" ]]; then
        find "$_ort_dir/linux" -mindepth 1 -maxdepth 1 -type d ! -name "$_nodearch" -exec rm -rf {} +
      fi
    fi

    # sharp prebuilds include both glibc and musl variants; keep only glibc for Arch
    rm -rf node_modules/@img/sharp-linuxmusl-* \
           node_modules/@img/sharp-libvips-linuxmusl-*
  fi

  # SDK example files are not needed at runtime and trigger noisy namcap "node" warnings
  rm -rf node_modules/@modelcontextprotocol/sdk/dist/esm/examples \
         node_modules/@modelcontextprotocol/sdk/dist/cjs/examples
}

package() {
  cd "$srcdir/codemogger"

  install -d "$pkgdir/usr/lib/codemogger"
  cp -r bin src node_modules package.json bun.lock bunfig.toml \
    "$pkgdir/usr/lib/codemogger"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/codemogger" << 'EOF'
#!/usr/bin/env sh
set -eu

_cache_root="${XDG_CACHE_HOME:-$HOME/.cache}/codemogger"
export HF_HOME="${HF_HOME:-$_cache_root/huggingface}"
export TRANSFORMERS_CACHE="${TRANSFORMERS_CACHE:-$_cache_root/transformers}"

mkdir -p "$HF_HOME" "$TRANSFORMERS_CACHE"

exec bun run /usr/lib/codemogger/bin/codemogger.ts "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/codemogger"
}
