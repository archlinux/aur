# Maintainer: Your Name <you@example.com>

pkgname=strata-engine-git
pkgver=0.1.39.r845.g6f32ec07
pkgrel=1
pkgdesc='Run Qwen3.8-Flash-Next (125B MoE) on one consumer NVIDIA GPU plus system RAM, with a local OpenAI/Anthropic-compatible API (git version)'
arch=('x86_64')
url='https://github.com/Niko1221/Strata'
# Strata and the ggml code it builds on are MIT. data/experimental-speed-projection is under the
# Qwen Community License, and every model you download has its own license (see the project's docs).
license=('MIT')
depends=(
  'cuda>=13'            # libcudart and libcublas 13 (the engine is built against CUDA 13)
  'nvidia-utils>=580'   # nvidia-smi and a driver new enough for CUDA 13
  'gcc-libs'
  'python'
  'python-numpy'
  'python-jinja'
  'python-regex'
  'python-yaml'
  'python-tqdm'
  'python-requests'
  'python-pillow'
  'python-psutil'
)
makedepends=('git' 'cmake' 'ninja' 'gcc' 'python')
optdepends=(
  'cmake: recompile the engine when your GPU is outside the architectures built here'
  'ninja: recompile the engine when your GPU is outside the architectures built here'
  'gcc: recompile the engine when your GPU is outside the architectures built here'
  'nodejs: run npx-based MCP servers from the web chat'
)
provides=('strata-engine')
conflicts=('strata-engine')
options=('!lto' '!debug')

# llama.cpp commit that Strata pins (LLAMA_CPP_COMMIT in setup.py). prepare() stops if upstream moves it.
_llama_commit=3cf03257f219afbe7334045ff7c6a06ac68c627d

# CUDA architectures compiled into the engine, as a fat binary. Default is upstream's Docker set:
# RTX 20 (75), A-series (80), RTX 30 (86), RTX 40 (89), RTX 50 (120).
# Narrow it to your card for a much faster build: _cuda_archs=89 makepkg -si
: "${_cuda_archs:=75;80;86;89;120}"

# Also build strata-vision, the image encoder (adds 10-20 minutes). Skip it: _build_vision=0 makepkg -si
: "${_build_vision:=1}"

source=("Strata::git+https://github.com/Niko1221/Strata.git"
        "llama.cpp::git+https://github.com/ggml-org/llama.cpp.git#commit=${_llama_commit}")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd Strata
  local _v
  _v=$(grep -oP 'project\(strata VERSION \K[0-9.]+' CMakeLists.txt)
  printf '%s.r%s.g%s' "$_v" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd Strata
  local _pinned
  _pinned=$(grep -oP '^LLAMA_CPP_COMMIT = "\K[0-9a-f]{40}' setup.py)
  if [[ $_pinned != "$_llama_commit" ]]; then
    error "Strata now pins llama.cpp $_pinned"
    error "Set _llama_commit to that value in this PKGBUILD and rebuild."
    return 1
  fi
}

build() {
  export PATH="/opt/cuda/bin:$PATH"
  local _nvcc=/opt/cuda/bin/nvcc
  local _jobs=$(( $(nproc) / 2 ))
  (( _jobs < 2 )) && _jobs=2   # nvcc is memory hungry, so use half the cores like upstream's setup.py

  # Upstream's own build uses CMake defaults: ggml adds -march=native and Strata adds per-file
  # AVX2/AVX-512 flags. Arch's -march=x86-64 and -Werror=format-security would fight with that.
  unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS

  # If nvcc rejects the host compiler, point CMake at a supported one: CUDAHOSTCXX=/usr/bin/g++-NN
  cmake -S Strata -B build-engine -G Ninja -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CUDA_COMPILER="$_nvcc" \
    -DCMAKE_CUDA_ARCHITECTURES="$_cuda_archs" \
    -DSTRATA_ENABLE_CUDA=ON \
    -DSTRATA_BUILD_TESTS=OFF \
    -DSTRATA_GGML_DIR="$srcdir/llama.cpp"
  cmake --build build-engine --target strata -j "$_jobs"

  if [[ $_build_vision == 1 ]]; then
    cmake -S Strata/tools/vision -B build-vision -G Ninja -Wno-dev \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_CUDA_COMPILER="$_nvcc" \
      -DCMAKE_CUDA_ARCHITECTURES="$_cuda_archs" \
      -DSTRATA_VISION_CUDA=ON \
      -DLLAMA_DIR="$srcdir/llama.cpp"
    cmake --build build-vision --target strata-vision -j "$_jobs"
  fi
}

package() {
  local _share="$pkgdir/usr/share/strata"
  local _engine="$pkgdir/usr/lib/strata/engine"
  install -d "$_share" "$_engine" "$pkgdir/usr/bin"

  # --- the read-only application tree -------------------------------------------------------------
  cd "$srcdir/Strata"
  cp -r serve tools data include src third_party "$_share/"
  install -Dm644 -t "$_share" CMakeLists.txt setup.py chat.py requirements.txt

  # llama.cpp at the pinned commit: gguf-py for the tools, plus enough of the tree to recompile
  # the engine or the image encoder on a GPU generation that was not built here.
  install -d "$_share/third_party/llama.cpp"
  git -C "$srcdir/llama.cpp" archive HEAD | tar -x -C "$_share/third_party/llama.cpp"
  (
    cd "$_share/third_party/llama.cpp"
    rm -rf docs media models tests benches pocs examples tools/ui scripts ci skills app
  )

  # --- the compiled engine ------------------------------------------------------------------------
  install -Dm755 "$srcdir/build-engine/strata" "$_engine/strata"
  if [[ $_build_vision == 1 ]]; then
    install -Dm755 "$srcdir/build-vision/bin/strata-vision" "$_engine/strata-vision"
  fi

  # BUILD.json is how setup.py decides an engine is current ("source": "local" plus a hash of the
  # sources it was built from), so it computes the hash with upstream's own functions.
  cd "$_share"
  PYTHONDONTWRITEBYTECODE=1 python - "$_cuda_archs" "$_build_vision" "$_engine/BUILD.json" <<'PYEOF'
import json, sys
sys.path.insert(0, ".")
import setup

archs = [int(a.split("-")[0]) for a in sys.argv[1].replace(",", ";").split(";") if a.split("-")[0].isdigit()]
vision = sys.argv[2] == "1"
meta = {
    "source": "local",
    "version": setup.source_version(),
    "archs": archs,
    "vision": "gpu" if vision else "none",
    "cuda_dirs": ["/opt/cuda/bin", "/opt/cuda/lib64"],
    "src": setup.source_hash(setup.ENGINE_SOURCES),
    "vision_src": setup.source_hash(setup.VISION_SOURCES) if vision else None,
}
with open(sys.argv[3], "w") as f:
    json.dump(meta, f, indent=1)
PYEOF
  echo "$pkgver-$pkgrel" > "$_share/PKG_VERSION"

  # --- launcher -----------------------------------------------------------------------------------
  # Upstream's setup.py writes models, configs, logs and build folders next to itself, so it cannot
  # run from /usr. The launcher builds a small per-user folder of symlinks to the installed files
  # and runs setup.py from there. Python packages come from pacman, so setup.py's pip step is a no-op.
  cat > "$pkgdir/usr/bin/strata" <<'EOF'
#!/bin/bash
# Launcher for the strata-git package.
#   strata                 first run: pick a model and install it; later runs: start the server
#   strata --setup         install another model or change settings
#   strata --help          every option (the same ones as upstream's ./setup.sh)
#   strata chat            terminal chat with a running server
# Files live in ${STRATA_HOME:-~/.local/share/strata}; model files go to Strata-data next to app/
# (about 70-120 GB, change it with --data-dir).
set -e

share=/usr/share/strata
lib=/usr/lib/strata
home="${STRATA_HOME:-${XDG_DATA_HOME:-$HOME/.local/share}/strata}"
app="$home/app"
stamp="$(cat "$share/PKG_VERSION")"

if [ "$(cat "$app/.pkg-version" 2>/dev/null)" != "$stamp" ]; then
  mkdir -p "$app/engine"
  for f in setup.py chat.py requirements.txt; do
    cp -f "$share/$f" "$app/$f"
  done
  for d in CMakeLists.txt serve tools data include src third_party; do
    ln -sfn "$share/$d" "$app/$d"
  done
  cp -f "$lib/engine/BUILD.json" "$app/engine/BUILD.json"
  for b in strata strata-vision; do
    if [ -e "$lib/engine/$b" ]; then ln -sf "$lib/engine/$b" "$app/engine/$b"; fi
  done
  echo "$stamp" > "$app/.pkg-version"
  echo "strata: set up $app" >&2
  echo "strata: model files go to $home/Strata-data (use --data-dir to put them elsewhere)" >&2
fi

cd "$app"

# if the engine ever has to be recompiled, use the CUDA from pacman
if [ -z "$STRATA_NVCC" ] && [ -x /opt/cuda/bin/nvcc ]; then
  export STRATA_NVCC=/opt/cuda/bin/nvcc
fi

if [ "${1:-}" = chat ]; then
  shift
  exec python3 chat.py "$@"
fi

exec python3 -c '
import sys
sys.path.insert(0, ".")
import setup
setup.pip_install = lambda *args, **kwargs: None   # Python packages come from pacman
sys.argv[0] = "strata"
try:
    sys.exit(setup.main())
except KeyboardInterrupt:
    setup.say("\nstopped.")
    sys.exit(1)
' "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/strata"

  # --- licenses and docs --------------------------------------------------------------------------
  cd "$srcdir/Strata"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 third_party/ggml/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ggml"
  install -Dm644 "$srcdir/llama.cpp/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.llama.cpp"
  install -Dm644 -t "$pkgdir/usr/share/doc/strata" README.md SECURITY.md docs/*.md
}
