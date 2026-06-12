# Maintainer: Garrett Goebel <garrett.goebel@gmail.com>
_pkgname=hipfire
pkgname=hipfire-git
pkgver=0.2.1.r5
pkgrel=1
pkgdesc="High-performance AMD GPU inference runtime framework (VCS version)"
arch=('x86_64')
url="https://github.com/Kaden-Schutt/hipfire"
license=('MIT' 'Apache-2.0')
depends=('bun' 'pciutils' 'rocm-hip-sdk' 'rocm-opencl-sdk')
makedepends=('git' 'cargo' 'clang' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Attempt to get version from git tags
  if _ver=$(git describe --long --tags 2>/dev/null); then
    echo "${_ver}" | sed 's/^v//;s/-\([0-9]\+\)-g.*/.r\1/'
  else
    # Fallback: Extract version from Cargo.toml and append commit count
    _basever=$(grep -m1 '^version =' Cargo.toml | cut -d'"' -f2)
    _revcount=$(git rev-list --count HEAD)
    printf "%s.r%s" "${_basever}" "${_revcount}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  export CARGO_PROFILE_RELEASE_DEBUG=1
  
  cargo build --release --features deltanet \
    --example daemon \
    -p hipfire-runtime
}

package() {
  cd "${srcdir}/${_pkgname}"

  # 1. Deploy daemon runtime engine
  install -Dm755 target/release/examples/daemon "${pkgdir}/usr/lib/${_pkgname}/daemon"

  # 2. Deploy clean JS/TS asset architecture tree
  install -d "${pkgdir}/usr/share/${_pkgname}/cli"
  cp -R cli/. "${pkgdir}/usr/share/${_pkgname}/cli/"
  
  rm -rf "${pkgdir}/usr/share/${_pkgname}/cli"/{node_modules,.gitignore,tsconfig.json,bun.lock}
  find "${pkgdir}/usr/share/${_pkgname}/cli/" -maxdepth 1 -type f \( -name '*.test.ts' -o -name 'test_*.ts' -o -name 'bench_*.ts' \) -delete

  # 3. Provision execution gate wrapper
  install -d "${pkgdir}/usr/bin"
  cat << 'WRAPPER' > "${pkgdir}/usr/bin/hipfire"
#!/bin/bash
set -euo pipefail

HIPFIRE_CLI_DIR="/usr/share/hipfire/cli"
HIPFIRE_INDEX_SCRIPT="$HIPFIRE_CLI_DIR/index.ts"
HIPFIRE_HOME_DIR="$HOME/.hipfire"
HIPFIRE_MODEL_DIR="$HIPFIRE_HOME_DIR/models"

if [ ! -f "$HIPFIRE_INDEX_SCRIPT" ]; then
    echo "[ERROR] hipfire CLI components missing from $HIPFIRE_CLI_DIR" >&2
    exit 1
fi

if ! command -v bun &>/dev/null; then
    echo "[ERROR] bun runtime not found in system PATH" >&2
    exit 1
fi

if [ ! -f "$HIPFIRE_HOME_DIR/config.json" ]; then
    mkdir -p "$HIPFIRE_MODEL_DIR"
    if stat -f -c %T "$HIPFIRE_MODEL_DIR" 2>/dev/null | grep -qi "btrfs"; then
        chattr +C "$HIPFIRE_MODEL_DIR" 2>/dev/null || true
    fi

    GPU_ARCH=""
    
    # Tier 1: KFD Topology Checks
    NODES_PATH="/sys/class/kfd/kfd/topology/nodes"
    if [ -d "$NODES_PATH" ]; then
        for NODE_PROPS in "$NODES_PATH"/*/properties; do
            if [ -r "$NODE_PROPS" ]; then
                RAW_KFD=$(grep -soP 'gfx_target_version\s+\K\d+' "$NODE_PROPS" || true)
                case "$RAW_KFD" in
                    90006)         GPU_ARCH="gfx906"  ;;
                    90008)         GPU_ARCH="gfx908"  ;;
                    100100)        GPU_ARCH="gfx1010" ;;
                    100300|100302) GPU_ARCH="gfx1030" ;;
                    110000|110001) GPU_ARCH="gfx1100" ;;
                    110500)        GPU_ARCH="gfx1150" ;;
                    110501)        GPU_ARCH="gfx1151" ;;
                    120000)        GPU_ARCH="gfx1200" ;;
                    120001)        GPU_ARCH="gfx1201" ;;
                    *)
                        if [[ "$RAW_KFD" =~ ^[0-9]+$ ]] && [ "$RAW_KFD" -gt 120001 ]; then
                            GPU_ARCH="gfx1201"
                        fi
                        ;;
                esac
            fi
            [ -n "$GPU_ARCH" ] && break
        done
    fi

    # Tier 2: lspci Fallback Lookup
    if [ -z "$GPU_ARCH" ] && command -v lspci &>/dev/null; then
        RAW_PCI_LIST=$(lspci -nn | grep -i "amd" | grep -Ei "display|vga|3d" | grep -oP '1002:\K[0-9a-fA-F]{4}' || true)
        if [ -n "$RAW_PCI_LIST" ]; then
            while read -r pci_id; do
                [ -n "$pci_id" ] || continue
                case "${pci_id,,}" in
                    66a0|66a1|66a4) GPU_ARCH="gfx906"  ;;
                    738c|738e)      GPU_ARCH="gfx908"  ;;
                    731f)           GPU_ARCH="gfx1010" ;;
                    73bf|73c8)      GPU_ARCH="gfx1030" ;;
                    744c)           GPU_ARCH="gfx1100" ;;
                    150e|150f)      GPU_ARCH="gfx1150" ;;
                    1586)           GPU_ARCH="gfx1151" ;;
                    74a0|74a1)      GPU_ARCH="gfx1200" ;;
                esac
                [ -n "$GPU_ARCH" ] && break
            done <<< "$RAW_PCI_LIST"
        fi
    fi

    # Tier 3: rocm-smi Fallback Lookup
    if [ -z "$GPU_ARCH" ] && command -v rocm-smi &>/dev/null; then
        GPU_ARCH=$(timeout 3 rocm-smi --showproductname --json 2>/dev/null | grep -oP 'gfx\d{3,4}' | head -n1 || true)
    fi

    if [ -z "$GPU_ARCH" ]; then
        echo "[ERROR] No compatible AMD GPU detected on this host. Aborting execution." >&2
        exit 1
    fi

    echo "{\"gpu_arch\": \"$GPU_ARCH\"}" > "$HIPFIRE_HOME_DIR/config.json"
fi

export HIPFIRE_DAEMON_BIN="/usr/lib/hipfire/daemon"

# Use an array to execute to avoid shell injection attacks
CMD=(bun run "$HIPFIRE_INDEX_SCRIPT")
exec "${CMD[@]}" "$@"
WRAPPER

  chmod 755 "${pkgdir}/usr/bin/hipfire"
  
  # 4. Consolidated Idiomatic License Deployment
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # 5. Install Documentation
  install -Dm644 "${startdir}/README.AUR" "${pkgdir}/usr/share/doc/${pkgname}/README.AUR"
}
