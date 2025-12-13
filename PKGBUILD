# Maintainer: pakrohk <pakrohk@gmail.com>
pkgname=qoder-cli
pkgver=latest
pkgrel=1
pkgdesc="Qoder Agentic CLI - Advanced AI coding agent from Alibaba"
arch=('x86_64')
url="https://qoder.com/cli"
license=('proprietary')
# No automatic dependencies - user must install prerequisites manually if needed
# Prerequisites: curl (for download), glibc (usually present)
options=('!strip')

prepare() {
  # Check if binary already exists in source directory
  if [ ! -f "${srcdir}/qoder-cli" ]; then
    echo "Downloading latest Qoder CLI using official installation script..."
    # Official script downloads and places the portable binary
    curl -fsSL https://qoder.com/install | bash || {
      echo "Download failed! Check your internet connection or visit https://qoder.com/cli for manual download."
      echo "Place the downloaded binary as 'qoder-cli' in this directory and rerun makepkg."
      exit 1
    }
    # The script usually outputs a binary named 'qoder' or 'qodercli'
    mv qoder qoder-cli 2>/dev/null || mv qodercli qoder-cli 2>/dev/null || {
      echo "Binary not found after download. Please check the script output."
      exit 1
    }
  fi

  # Security note: Qoder does not publish official checksums
  echo "Note: No official SHA256/MD5 checksum provided by Qoder. Verify the binary manually if security is critical."
}

package() {
  # Install the binary to /usr/bin with executable permissions
  install -Dm755 qoder-cli "${pkgdir}/usr/bin/qoder"

  echo "Qoder CLI successfully installed!"
  echo "Run 'qoder' in your terminal to start."
  echo "First launch will prompt for sign-in (use your Qoder account)."
}
