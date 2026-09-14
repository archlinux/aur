# Maintainer: James Brink <brink.james@gmail.com>
# Maintainer: Jeffrey Dilley <jeff.dilley@gmail.com>

pkgname=mold-ai
_binname=mold
pkgver=0.29.0
pkgrel=1
pkgdesc="Local AI image generation CLI — FLUX, SD3.5, SD 1.5, SDXL, Z-Image, Flux.2, Qwen-Image, Wuerstchen, LTX Video, & LTX-2 diffusion models on your GPU (built from source, CUDA)"
arch=('x86_64')
url="https://github.com/utensils/mold"
license=('MIT')

depends=('cuda' 'cudnn' 'gcc-libs' 'glibc')

optdepends=(
  'nvidia-utils: NVIDIA GPU driver (required for any local GPU generation)'
  'ffmpeg: video output for LTX-Video / LTX-2 (mp4 mux fallback)'
  'bash-completion: Bash tab completion'
  'zsh-completions: Zsh tab completion (also auto-found via /usr/share/zsh/site-functions)'
  'fish: Fish tab completion'
)

# MSRV from workspace.package.rust-version. Bump in lockstep with Cargo.toml.
# `clang` + `lld` + `nasm` mirror the apt deps in .github/workflows/release.yml
# build-linux-sm89 — candle-flash-attn and the H.264 decoder need them.
makedepends=(
  'rust>=1.93'
  'cargo'
  'cuda'
  'cudnn'
  'clang'
  'lld'
  'nasm'
  'bun'
  # The `pulid` feature pulls in candle-onnx, whose build script drives
  # prost-build, which shells out to protoc.
  'protobuf'
)

provides=("${pkgname}=${pkgver}")
conflicts=('mold-ai-bin' 'mold-ai-git' 'mold')

# LTO is already `lto = "fat"` in the workspace Cargo.toml; makepkg's outer
# `-flto` flags conflict with that and slow the build for no gain.
options=(!lto)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d1d31b4234e5abc67e5c04531c47e0f6a5e9b83042850e169f80707e7ec7603c')

prepare() {
  cd "mold-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
  # Build the web SPA here (prepare may use the network for `bun install`;
  # build() runs --offline) so mold-server's build.rs embeds the real
  # gallery UI instead of the placeholder stub.
  ./scripts/ensure-web-dist.sh
}

build() {
  cd "mold-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  # Default to Ada Lovelace (sm_89, RTX 40-series). Other users override with
  # 86 for RTX 3090/A40, 100 for B200/B300, or 120 for RTX 50-series.
  # paru forwards env vars to makepkg; see the installation guide.
  export CUDA_COMPUTE_CAP="${CUDA_COMPUTE_CAP:-89}"
  # makepkg runs in a minimal environment and does not source the user's
  # profile, so /opt/cuda/bin (where Arch's `cuda` package puts nvcc) is
  # not on PATH by default. candle's CUDA build needs nvcc at compile time.
  export PATH="/opt/cuda/bin:${PATH}"
  # `${VAR:+:${VAR}}` only prepends the `:` when VAR is set + non-empty.
  # `:${VAR:-}` would expand to a trailing `:` when VAR is unset, which
  # adds an empty entry = CWD to the linker search path.
  export LIBRARY_PATH="/opt/cuda/lib64/stubs${LIBRARY_PATH:+:${LIBRARY_PATH}}"
  # --frozen + --offline pairs with `cargo fetch --locked` above:
  #   --frozen  refuses to mutate Cargo.lock — stale lockfile fails loudly
  #   --offline refuses any network IO — proves the fetch step grabbed
  #             every transitive dep, including build-script deps that
  #             --frozen alone would still allow to download
  # Together they make AUR chroot builds fully reproducible.
  # SM89 names `h3-cuda`, not `cuda,h3`: since #1164 the bare `h3` feature
  # implies neither CUDA nor the SM89 attention kernel. `h3-cuda` implies
  # `cuda`, so it replaces the device feature instead of appending to it.
  # sm86 and sm100 name `flash-attn` beside `cuda`: FLUX renders through
  # FlashAttention-2 wherever the kernel is compiled, and its math path changed
  # bytes in 0.29 regardless, so a CUDA build without the kernel takes the seed
  # change and none of the speedup. `h3-cuda` already implies `flash-attn`.
  #
  # sm120 stays on plain `cuda` until it is measured: FA2 chooses its head-dim
  # 96/128/160 tile on a runtime `is_sm8x` test that consumer Blackwell fails,
  # so FLUX's head dim of 128 would take the A100/H100 tile on an Ada-sized SM.
  # See `flashAttnQualifiedCaps` in flake.nix.
  local gpu_feature="cuda,flash-attn"
  [[ "${CUDA_COMPUTE_CAP}" == "89" ]] && gpu_feature="h3-cuda"
  [[ "${CUDA_COMPUTE_CAP}" == "120" ]] && gpu_feature="cuda"
  cargo build --release --frozen --offline \
    -p mold-ai \
    --features "${gpu_feature},cudnn,preview,expand,tui,webp,mp4,metrics,mdns,pulid"
}

check() {
  cd "mold-${pkgver}"
  ./scripts/verify-h3-release-exclusion.sh "target/release/${_binname}"
}

package() {
  cd "mold-${pkgver}"

  install -Dm755 "target/release/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d \
    "${pkgdir}/usr/share/bash-completion/completions" \
    "${pkgdir}/usr/share/zsh/site-functions" \
    "${pkgdir}/usr/share/fish/vendor_completions.d"
  PATH="${pkgdir}/usr/bin:${PATH}" ${_binname} completions bash \
    > "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  PATH="${pkgdir}/usr/bin:${PATH}" ${_binname} completions zsh \
    > "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  PATH="${pkgdir}/usr/bin:${PATH}" ${_binname} completions fish \
    > "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
}
