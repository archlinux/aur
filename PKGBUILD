# Maintainer: pakrohk <pakrohk@gmail.com>
pkgname=qoder-cli
pkgver=latest
pkgrel=1
pkgdesc="Qoder Agentic CLI - Advanced AI coding agent from Alibaba"
url="https://qoder.com/cli"
arch=('x86_64')
license=('proprietary')

# No runtime dependencies beyond base system (portable binary)
# Build-time: curl (usually present on Arch)
options=('!strip')

prepare() {
  cd "${srcdir}"

  echo "================================================================================"
  echo "Preparing Qoder CLI installation..."
  echo "================================================================================"

  # Check if binary already provided manually
  if [ ! -f "qoder-cli" ]; then
    echo "Downloading latest Qoder CLI using official installation script..."
    echo "Script: curl -fsSL https://qoder.com/install | bash"

    # Run official script to download portable binary
    curl -fsSL https://qoder.com/install | bash || {
      echo "ERROR: Download failed. Check internet connection or sanctions bypass."
      echo "Alternative: Manually download the Linux CLI binary from https://qoder.com/cli"
      echo "          Place it as 'qoder-cli' in this directory and rerun makepkg."
      exit 1
    }

    # Official script typically outputs 'qoder' or 'qodercli' - rename safely
    if [ -f "qoder" ]; then
      mv qoder qoder-cli && echo "Renamed 'qoder' → 'qoder-cli'"
    elif [ -f "qodercli" ]; then
      mv qodercli qoder-cli && echo "Renamed 'qodercli' → 'qoder-cli'"
    else
      echo "ERROR: Expected binary (qoder or qodercli) not found after script execution."
      echo "Please check script output or download manually."
      exit 1
    fi
  else
    echo "Using pre-placed qoder-cli binary from source directory"
  fi

  # Security notice
  echo "================================================================================"
  echo "NOTE: Qoder does not publish official SHA256/MD5 checksums."
  echo "      For security-critical use, verify the binary manually."
  echo "================================================================================"
}

package() {
  cd "${srcdir}"

  echo "================================================================================"
  echo "Installing Qoder CLI..."
  echo "================================================================================"

  # Install portable binary
  install -Dm755 qoder-cli "${pkgdir}/usr/bin/qoder"
  echo "Binary installed to /usr/bin/qoder"

  echo "================================================================================"
  echo "Qoder CLI successfully installed!"
  echo ""
  echo "Launch with: qoder"
  echo "First run: Use /login command inside CLI to sign in (pakrohk@gmail.com)"
  echo "Enjoy agentic coding in your terminal! 🚀"
  echo "================================================================================"
}
