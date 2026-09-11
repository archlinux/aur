# Maintainer: rNoz <8237539+rNoz@users.noreply.github.com>
pkgname=factory-ai-droid-cli-rnoz-bin
pkgver=0.217.0
pkgrel=2
pkgdesc="Factory.ai CLI (droid) with optional zero-waste titling and cross-harness keybindings (pkg auto-syncs daily)"
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
  "patch_title.py"
  "patch_keybindings.py"
  "$install"
)
sha256sums=(
  '6f8fc3992526e8c8b0a4af11f029a633498f7704e9c6a736e772788d18243d00'
  '5ae64524b92a49ed3895dd72e522d13838bb86be37e6505b9c728b99ca66724b'
  'a66b665fef55af8102ea6c84391a410ab9a9aefa1191a4650eae3c53c78bec08'
)

package() {
  local actual_version="${pkgver}"
  local platform="linux"
  local use_system_rg=0

  apply_patch_if_requested() {
    local label="$1"
    local patcher="$2"
    if [[ -t 0 && -t 1 ]]; then
      local answer
      read -r -p "Apply ${label} patch? [Y/n] " answer </dev/tty
      if [[ "$answer" =~ ^[Nn]$ ]]; then
        msg2 "Skipping ${label} patch (requested interactively)."
        return 0
      fi
    fi
    python3 "$patcher" "$output_bin" --test
  }

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

    msg2 "Applying deterministic titling and keybinding patches to $output_bin..."
    cp -f "$raw_file" "$output_bin"
    chmod +x "$output_bin"

    apply_patch_if_requested "deterministic titling" "$srcdir/patch_title.py"
    apply_patch_if_requested "cross-harness keybindings" "$srcdir/patch_keybindings.py"
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

  # Prefer an existing system ripgrep; otherwise bundle and verify one.
  local raw_rg="rg"
  local sha_rg="rg.sha256"
  if command -v rg >/dev/null 2>&1; then
    use_system_rg=1
    msg2 "Using system ripgrep; skipping bundled download."
  elif [[ ! -f "$raw_rg" ]]; then
    msg2 "Downloading ripgrep for $platform-$rg_architecture..."
    curl -fsSL --retry 3 --retry-delay 2 --retry-connrefused -o "${raw_rg}.part" "$rg_url" || {
      rm -f "${raw_rg}.part"
      error "Failed to download ripgrep from $rg_url"
      return 1
    }
    mv -f "${raw_rg}.part" "$raw_rg"
  fi

  if (( ! use_system_rg )); then
    # Download and verify ripgrep checksum.
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
  fi

  # Create installation directories
  install -dm755 "$pkgdir/usr/lib/factory"
  install -dm755 "$pkgdir/usr/bin"

  # Install single binary to /usr/lib/factory
  install -Dm755 "droid" "$pkgdir/usr/lib/factory/droid"
  if (( ! use_system_rg )); then
    install -Dm755 "rg" "$pkgdir/usr/lib/factory/rg"
  fi

  # Create launcher script in /usr/bin/droid
  cat > "$pkgdir/usr/bin/droid" <<'EOF'
#!/bin/sh
# Factory CLI launcher (patched titling and cross-harness keybindings)
if ! command -v rg >/dev/null 2>&1; then
  export PATH="/usr/lib/factory:$PATH"
fi
exec /usr/lib/factory/droid "$@"
EOF

  chmod 755 "$pkgdir/usr/bin/droid"
}
