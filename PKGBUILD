# Maintainer: a6rippa (local package, not AUR-published)
_pkgname=radiance-inference
pkgname=${_pkgname}-git
pkgver=1.6.0.r0
pkgrel=1
pkgdesc="C++20 LLM inference server for AMD GPUs (primarily gfx1201) with OpenAI-compatible HTTP API (git HEAD)"
arch=('x86_64')
url="https://codeberg.org/StillDeadcode/radiance"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'ffmpeg' 'rocm-gfx120x-bin')
makedepends=('git' 'cmake' 'ninja')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/radiance/radiance.conf')
options=('!lto' '!debug')
source=("${_pkgname}::git+${url}.git#branch=main")
sha256sums=('SKIP')

# Edit for other hardware: run `offload-arch`.
_hip_archs='gfx1201'

pkgver() {
  cd "${srcdir}/${_pkgname}"
  if _ver=$(git describe --long --tags --match 'v[0-9]*' 2>/dev/null); then
    echo "${_ver}" | sed 's/^v//;s/-\([0-9]\+\)-g.*/.r\1/'
  else
    _basever=$(grep -m1 '^project(' CMakeLists.txt | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -1)
    printf "%s.r%s" "${_basever}" "$(git rev-list --count HEAD)"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRAD_WITH_HIP=ON \
    -DRAD_GPU_TARGETS="${_hip_archs}" \
    -DRAD_WITH_FFMPEG=ON \
    -DRAD_BUILD_TESTS=OFF
  cmake --build build --parallel
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build
  # upstream install rules miss data/recipes/*.recipe (Dockerfile lines 113-114 replicate this)
  install -d "${pkgdir}/usr/share/radiance/recipes"
  install -m644 data/recipes/*.recipe -t "${pkgdir}/usr/share/radiance/recipes/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"

  # systemd unit + its config. Quoted heredocs: the ${...} below belong to
  # systemd, not to this shell.
  install -d -m755 "${pkgdir}/usr/lib/systemd/system"
  cat > "${pkgdir}/usr/lib/systemd/system/radiance.service" <<'UNIT'
[Unit]
Description=radiance LLM inference server (OpenAI-compatible HTTP API)
Documentation=https://codeberg.org/StillDeadcode/radiance
After=network-online.target
Wants=network-online.target

[Service]
Type=exec
EnvironmentFile=/etc/radiance/radiance.conf
# The HIP runtime caps one allocation and the heap below what the placement plan
# hands out (Dockerfile ENV, docs/DOCKER.md).
Environment=GPU_MAX_ALLOC_PERCENT=100 GPU_MAX_HEAP_SIZE=100
# systemd expansion (verified empirically on systemd 262, not from docs):
#   $VAR    -> value SPLIT on whitespace into zero-or-more arguments; an empty or
#              unset value contributes ZERO arguments.
#   ${VAR}  -> exactly ONE argument, spaces included; empty/unset contributes one
#              EMPTY argument (radiance rejects it: "unknown option ''").
# So the flag bag MUST be the bare $RADIANCE_EXTRA_ARGS form; ${...} is kept on
# model/host/port where a single argument is what we want. Quotes in the conf are
# irrelevant: EnvironmentFile strips them before expansion either way.
ExecStart=/usr/bin/radiance --model ${RADIANCE_MODEL} --host ${RADIANCE_HOST} --port ${RADIANCE_PORT} $RADIANCE_EXTRA_ARGS

Restart=on-failure
RestartSec=15
# Finishes the step in flight, then releases the cards (compose stop_grace_period 60s).
TimeoutStopSec=90

# No PrivateDevices=/DevicePolicy=closed/SystemCallFilter= here: an io_uring or
# mbind/set_mempolicy refusal stops model serving (docs/DOCKER.md).
NoNewPrivileges=yes
ProtectSystem=strict
ProtectHome=read-only
PrivateTmp=yes
UMask=0077
# --host-pool-mib pins host memory; Arch defaults to 8 MiB. Required for GPU host tiers.
LimitMEMLOCK=infinity

[Install]
WantedBy=multi-user.target
UNIT

  install -d -m755 "${pkgdir}/etc/radiance"
  cat > "${pkgdir}/etc/radiance/radiance.conf" <<'CONF'
# radiance.service. Edit, then: sudo systemctl restart radiance
# systemd EnvironmentFile syntax: KEY=value lines only - no export, no $(), and the
# last setting of a key wins. RADIANCE_HOME, RADIANCE_KERNELS and RADIANCE_LOG can be
# added here too.

# Required - the .rad container, or a plain Hugging Face checkpoint directory.
# The unit ships disabled; it fails with "cannot open ..." until this is a real file.
RADIANCE_MODEL=/srv/models/rad/CHANGE_ME.rad

# The engine default is 0.0.0.0 with no TLS and no auth; keep localhost unless a
# TLS-terminating proxy sits in front (docs/GUIDE.md). Use :: for IPv6+IPv4.
RADIANCE_HOST=127.0.0.1
RADIANCE_PORT=8000

# Everything else goes here, verbatim. The unit expands this with BARE $VAR, which
# systemd splits on whitespace into separate arguments (empty = no arguments at all).
# ${VAR} would NOT split (it is one argument even with spaces) and quotes are stripped
# by EnvironmentFile, so quoting here changes nothing - leave the lines as written.
# Pick exactly one line below, uncomment it, and keep the others commented. These are
# the per-model flags from README.md ("Run without Docker"); --host/--port are set
# above, not here.

RADIANCE_EXTRA_ARGS=

# --- Qwen3.8-Flash-Next (qwen3.8-next-flash-fp8-iq4r-moe.rad) ---
#RADIANCE_EXTRA_ARGS=--tp 2 --tp-wire wht6 --max-num-seqs 8 --max-model-len 200000 --placement expert_tiered --host-pool-mib 12288 --gpu-headroom-mib 96 --kv-cache-dtype fp8 --num-speculative-tokens 3 --max-num-batched-tokens 2048
# --- Qwen3.8-Flash-Next, four ranks ---
#RADIANCE_EXTRA_ARGS=--tp 4 --max-num-seqs 8 --max-model-len 200000 --placement expert_tiered --host-pool-mib 12288 --gpu-headroom-mib 96 --kv-cache-dtype fp8 --num-speculative-tokens 3 --max-num-batched-tokens 2048
# --- Qwen3.8-Flash-Next, three ranks (docs/TP3.md) ---
#RADIANCE_EXTRA_ARGS=--tp 3 --max-num-seqs 8 --max-model-len 200000 --placement expert_tiered --host-pool-mib 8192 --gpu-headroom-mib 96 --kv-cache-dtype fp8 --num-speculative-tokens 3 --max-num-batched-tokens 2048
# --- Qwen3.8-Flash-Next bf16 (disk-streamed reference) ---
#RADIANCE_EXTRA_ARGS=--tp 2 --max-model-len 32768 --placement expert_tiered --weights-disk-tier --host-pool-mib 12288 --gpu-headroom-mib 768 --deterministic --max-num-seqs 32 --max-num-batched-tokens 32768 --num-speculative-tokens 0
# --- Qwen3.8-27B FP8 / Qwen3.6-35B-A3B / Qwen3.8-27B MXFP4 ---
#RADIANCE_EXTRA_ARGS=--tp 2 --max-num-seqs 32 --max-model-len 200000 --kv-cache-dtype fp8
# --- Qwen3.8-27B bf16 ---
#RADIANCE_EXTRA_ARGS=--tp 2 --max-num-seqs 8 --max-model-len 200000 --kv-cache-dtype fp8
# --- MiniCPM5-2B FP8 and bf16 ---
#RADIANCE_EXTRA_ARGS=--tp 2 --max-num-seqs 32 --max-model-len 131072 --kv-cache-dtype fp8 --gpu-headroom-mib 160 --max-num-batched-tokens 512
# --- EmbeddingGemma 2 bf16 (one card) ---
#RADIANCE_EXTRA_ARGS=--tp 1 --max-num-seqs 64 --max-num-batched-tokens 8192

# Optional global flags you may append to whichever line you pick:
#   --api-key KEY      enables Authorization: Bearer KEY (visible in `ps`/systemctl show)
#   --debug-graph      prints op->kernel resolution and exits (diagnostic, not for serving)
#   --prefix-cache-host-mib N --prefix-cache-disk-mib N --prefix-cache-dir DIR
#                      keeps finished conversations in RAM then on disk, UNENCRYPTED
CONF
}
