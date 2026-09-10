# Maintainer: rNoz <8237539+rNoz@users.noreply.github.com>
pkgname=factory-ai-droid-cli-rnoz-bin
pkgver=0.216.0
pkgrel=1
pkgdesc="Factory.ai Droid CLI - Always fresh terminal AI assistant with zero-waste deterministic titling"
arch=('x86_64' 'aarch64')
url="https://github.com/rNoz/factory-ai-droid-cli-rnoz"
license=('factory.ai')
depends=('curl')
optdepends=(
  'ripgrep: Use system ripgrep instead of bundled binary'
)
makedepends=('python')
provides=('droid' 'factory-cli' 'factory-cli-bin')
conflicts=('droid' 'factory-cli' 'factory-cli-bin')
options=('!strip')
install=factory-ai-droid-cli-rnoz-bin.install

source=(
  "patch-droid.py"
  "$install"
)
sha256sums=(
  '6f8fc3992526e8c8b0a4af11f029a633498f7704e9c6a736e772788d18243d00'
  '7f443dc10fdafdcc197c287a2b6522ac1b8d45f8e2973d9405f1792a0f3eea95'
)

pkgver() {
  # Query the official Factory CLI installation script to get the exact latest version
  local upstream_script upstream_version
  upstream_script=$(curl -fsSL --retry 3 --retry-delay 2 --retry-connrefused "https://app.factory.ai/cli" 2>/dev/null)
  upstream_version=$(echo "$upstream_script" | grep -oP 'VER="\K[0-9]+\.[0-9]+\.[0-9]+' || true)

  if [[ -n "$upstream_version" && "$upstream_version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "$upstream_version"
  else
    # Fallback to current pkgver if upstream is unreachable during offline verification
    echo "$pkgver"
  fi
}

package() {
  local actual_version="${pkgver:-0.215.1}"
  local platform="linux"

  # Detect architecture
  local architecture rg_architecture
  case "$CARCH" in
    x86_64)
      architecture="x64"
      ;;
    aarch64)
      architecture="arm64"
      ;;
    *)
      error "Unsupported architecture: $CARCH"
      return 1
      ;;
  esac

  local base_url="https://downloads.factory.ai"
  rg_architecture="$architecture"
  local rg_url="$base_url/ripgrep/$platform/$rg_architecture/rg"
  local rg_sha_url="$base_url/ripgrep/$platform/$rg_architecture/rg.sha256"

  # Helper function to download, verify, and patch a droid binary variant
  download_and_patch_droid() {
    local arch_target="$1"
    local output_bin="$2"
    local raw_file="droid-${arch_target}.raw"
    local sha_file="droid-${arch_target}.sha256"
    local download_url="$base_url/factory-cli/releases/$actual_version/$platform/$arch_target/droid"
    local sha_url="$base_url/factory-cli/releases/$actual_version/$platform/$arch_target/droid.sha256"

    if [[ ! -f "$raw_file" ]]; then
      msg2 "Downloading droid for $platform-$arch_target..."
      curl -fsSL --retry 3 --retry-delay 2 --retry-connrefused -o "${raw_file}.part" "$download_url" || {
        rm -f "${raw_file}.part"
        error "Failed to download droid from $download_url"
        return 1
      }
      mv -f "${raw_file}.part" "$raw_file"
    fi

    msg2 "Verifying upstream checksum for $arch_target..."
    curl -fsSL --retry 3 --retry-delay 2 --retry-connrefused -o "${sha_file}.part" "$sha_url" || {
      rm -f "${sha_file}.part"
      error "Failed to download droid checksum for $arch_target"
      return 1
    }
    mv -f "${sha_file}.part" "$sha_file"

    local exp_sha act_sha
    exp_sha=$(awk 'NF { print $1; exit }' "$sha_file")
    act_sha=$(sha256sum "$raw_file" | awk '{print $1}')

    if [[ ! "$exp_sha" =~ ^[[:xdigit:]]{64}$ || "$exp_sha" != "$act_sha" ]]; then
      rm -f "$raw_file" "$sha_file"
      error "Checksum verification failed for $arch_target!"
      error "Expected: $exp_sha"
      error "Actual:   $act_sha"
      return 1
    fi
    msg2 "Checksum verified for $arch_target"

    msg2 "Applying zero-waste titling patch to $output_bin..."
    cp -f "$raw_file" "$output_bin"
    chmod +x "$output_bin"

    python3 "$srcdir/patch-droid.py" "$output_bin" --test
  }

  if [[ "$architecture" == "x64" ]]; then
    # Select the optimal single binary for the end system CPU.
    # Users/maintainers can also force a specific variant via DROID_ARCH_VARIANT=baseline|avx2
    if [[ "${DROID_ARCH_VARIANT:-}" == "baseline" ]]; then
      msg2 "Building with baseline (non-AVX2) binary (forced via DROID_ARCH_VARIANT)..."
      download_and_patch_droid "x64-baseline" "droid" || return 1
    elif [[ "${DROID_ARCH_VARIANT:-}" == "avx2" ]]; then
      msg2 "Building with AVX2-optimized binary (forced via DROID_ARCH_VARIANT)..."
      download_and_patch_droid "x64" "droid" || return 1
    elif [[ -f /proc/cpuinfo ]] && grep -qi avx2 /proc/cpuinfo 2>/dev/null; then
      msg2 "Host CPU reports AVX2 support. Testing AVX2 binary execution..."
      if download_and_patch_droid "x64" "droid"; then
        msg2 "AVX2 binary operational and verified on host CPU."
      else
        msg2 "AVX2 binary not executable on this host (SIGILL/unsupported instructions). Falling back to baseline binary..."
        rm -f "droid"
        download_and_patch_droid "x64-baseline" "droid" || return 1
      fi
    else
      msg2 "Host CPU lacks AVX2 support. Building with baseline (non-AVX2) binary..."
      download_and_patch_droid "x64-baseline" "droid" || return 1
    fi
  else
    download_and_patch_droid "arm64" "droid" || return 1
  fi

  # Download ripgrep binary
  local raw_rg="rg"
  local sha_rg="rg.sha256"
  if [[ ! -f "$raw_rg" ]]; then
    msg2 "Downloading ripgrep for $platform-$rg_architecture..."
    curl -fsSL --retry 3 --retry-delay 2 --retry-connrefused -o "${raw_rg}.part" "$rg_url" || {
      rm -f "${raw_rg}.part"
      error "Failed to download ripgrep from $rg_url"
      return 1
    }
    mv -f "${raw_rg}.part" "$raw_rg"
  fi

  # Download and verify ripgrep checksum
  msg2 "Verifying ripgrep checksum..."
  curl -fsSL --retry 3 --retry-delay 2 --retry-connrefused -o "${sha_rg}.part" "$rg_sha_url" || {
    rm -f "${sha_rg}.part"
    error "Failed to download ripgrep checksum"
    return 1
  }
  mv -f "${sha_rg}.part" "$sha_rg"

  local expected_rg_sha actual_rg_sha
  expected_rg_sha=$(awk 'NF { print $1; exit }' "$sha_rg")
  actual_rg_sha=$(sha256sum "$raw_rg" | awk '{print $1}')

  if [[ ! "$expected_rg_sha" =~ ^[[:xdigit:]]{64}$ || "$expected_rg_sha" != "$actual_rg_sha" ]]; then
    rm -f "$raw_rg" "$sha_rg"
    error "Ripgrep checksum verification failed!"
    error "Expected: $expected_rg_sha"
    error "Actual:   $actual_rg_sha"
    return 1
  fi
  msg2 "Ripgrep checksum verified successfully"

  # Create installation directories
  install -dm755 "$pkgdir/usr/lib/factory"
  install -dm755 "$pkgdir/usr/bin"

  # Install single binary to /usr/lib/factory
  install -Dm755 "droid" "$pkgdir/usr/lib/factory/droid"
  install -Dm755 "rg" "$pkgdir/usr/lib/factory/rg"

  # Create launcher script in /usr/bin/droid
  cat > "$pkgdir/usr/bin/droid" <<'EOF'
#!/bin/sh
# Factory CLI launcher (Patched: zero title LLM token waste)
export PATH="/usr/lib/factory:$PATH"
exec /usr/lib/factory/droid "$@"
EOF

  chmod 755 "$pkgdir/usr/bin/droid"
}
