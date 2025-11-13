# Maintainer: alex5402 <alexbhaiya@duck.com>
pkgname=factory-cli-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Factory CLI - AI-powered terminal assistant"
arch=('x86_64' 'aarch64')
url="https://app.factory.ai"
license=('factory.ai')
depends=('curl')
optdepends=('ripgrep: Use system ripgrep instead of bundled version')
provides=('droid')
conflicts=('droid')
options=('!strip')
install="${pkgname}.install"

# Sources will be downloaded dynamically in package() function
source=()
sha256sums=()

pkgver() {
  # Fetch the install script and extract the version
  curl -fsSL "https://app.factory.ai/cli" | grep -oP 'VER="\K[0-9]+\.[0-9]+\.[0-9]+' || echo "1.0.0"
}

package() {
  cd "$srcdir"

  # Get the actual version from the install script
  local actual_version
  actual_version=$(curl -fsSL "https://app.factory.ai/cli" | grep -oP 'VER="\K[0-9]+\.[0-9]+\.[0-9]+')

  if [[ -z "$actual_version" ]]; then
    error "Failed to fetch version from install script"
    return 1
  fi

  msg2 "Detected Factory CLI version: $actual_version"

  # Detect platform (always linux for Arch)
  local platform="linux"

  # Detect architecture
  local architecture rg_architecture arch_suffix
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

  # Detect AVX2 support for x64 (for optimized droid binary)
  rg_architecture="$architecture"
  arch_suffix=""

  if [[ "$architecture" == "x64" ]]; then
    if grep -qi avx2 /proc/cpuinfo 2>/dev/null; then
      msg2 "AVX2 support detected, using optimized binary"
    else
      arch_suffix="-baseline"
      msg2 "No AVX2 support detected, using baseline binary"
    fi
  fi

  local droid_architecture="${architecture}${arch_suffix}"

  # Construct download URLs using the actual version
  local base_url="https://downloads.factory.ai"
  local droid_url="$base_url/factory-cli/releases/$actual_version/$platform/$droid_architecture/droid"
  local droid_sha_url="$base_url/factory-cli/releases/$actual_version/$platform/$droid_architecture/droid.sha256"
  local rg_url="$base_url/ripgrep/$platform/$rg_architecture/rg"
  local rg_sha_url="$base_url/ripgrep/$platform/$rg_architecture/rg.sha256"

  # Download droid binary
  msg2 "Downloading droid for $platform-$droid_architecture..."
  curl -fsSL -o "droid" "$droid_url" || {
    error "Failed to download droid from $droid_url"
    return 1
  }

  # Download and verify droid checksum
  msg2 "Verifying droid checksum..."
  curl -fsSL -o "droid.sha256" "$droid_sha_url" || {
    error "Failed to download droid checksum"
    return 1
  }

  local expected_sha actual_sha
  expected_sha=$(awk '{print $1}' "droid.sha256")
  actual_sha=$(sha256sum "droid" | awk '{print $1}')

  if [[ -n "$expected_sha" && "$expected_sha" != "$actual_sha" ]]; then
    error "Droid checksum verification failed!"
    error "Expected: $expected_sha"
    error "Actual:   $actual_sha"
    return 1
  fi
  msg2 "Droid checksum verified successfully"

  # Download ripgrep binary
  msg2 "Downloading ripgrep for $platform-$rg_architecture..."
  curl -fsSL -o "rg" "$rg_url" || {
    error "Failed to download ripgrep from $rg_url"
    return 1
  }

  # Download and verify ripgrep checksum
  msg2 "Verifying ripgrep checksum..."
  curl -fsSL -o "rg.sha256" "$rg_sha_url" || {
    error "Failed to download ripgrep checksum"
    return 1
  }

  local expected_rg_sha actual_rg_sha
  expected_rg_sha=$(awk '{print $1}' "rg.sha256")
  actual_rg_sha=$(sha256sum "rg" | awk '{print $1}')

  if [[ -n "$expected_rg_sha" && "$expected_rg_sha" != "$actual_rg_sha" ]]; then
    error "Ripgrep checksum verification failed!"
    error "Expected: $expected_rg_sha"
    error "Actual:   $actual_rg_sha"
    return 1
  fi
  msg2 "Ripgrep checksum verified successfully"

  # Create installation directories
  install -dm755 "$pkgdir/usr/lib/factory"
  install -dm755 "$pkgdir/usr/bin"

  # Install binaries to /usr/lib/factory
  install -Dm755 "droid" "$pkgdir/usr/lib/factory/droid"
  install -Dm755 "rg" "$pkgdir/usr/lib/factory/rg"

  # Create wrapper script in /usr/bin
  # This ensures the bundled ripgrep is used only for droid
  cat > "$pkgdir/usr/bin/droid" <<'EOF'
#!/bin/sh
# Factory CLI wrapper
# Ensures bundled ripgrep is preferred for this tool
export PATH="/usr/lib/factory:$PATH"
exec /usr/lib/factory/droid "$@"
EOF

  chmod 755 "$pkgdir/usr/bin/droid"

  # Install license if available (create placeholder for now)
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
Factory CLI License

Please visit https://factory.ai for license information.
EOF

  msg2 "Factory CLI (droid) v$actual_version installed successfully"
}
