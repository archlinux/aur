# Maintainer: Your Name <your.email@example.com>

pkgname=dankgop
pkgver=0.0.1
pkgrel=1
pkgdesc="System monitoring CLI + REST API"
arch=('x86_64' 'aarch64')
url="https://github.com/AvengeMedia/dankgop"
license=('MIT')
depends=('glibc')
source_x86_64=("${pkgname}-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64"
               "${pkgname}-${pkgver}-linux-amd64.sha256::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-amd64.sha256")
source_aarch64=("${pkgname}-${pkgver}-linux-arm64::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-arm64"
                "${pkgname}-${pkgver}-linux-arm64.sha256::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-arm64.sha256")

# These will be populated by updpkgsums or makepkg -g
sha256sums_x86_64=('SKIP'
                   'SKIP')
sha256sums_aarch64=('SKIP'
                    'SKIP')

prepare() {
  cd "$srcdir"
  
  # Verify the downloaded binary against the .sha256 file
  if [[ "$CARCH" == "x86_64" ]]; then
    local binary="${pkgname}-${pkgver}-linux-amd64"
    local sha_file="${binary}.sha256"
  elif [[ "$CARCH" == "aarch64" ]]; then
    local binary="${pkgname}-${pkgver}-linux-arm64"
    local sha_file="${binary}.sha256"
  fi
  
  # The .sha256 file typically contains "hash  filename" format
  # Extract just the hash and verify
  if [[ -f "$sha_file" ]]; then
    local expected_hash=$(cut -d' ' -f1 < "$sha_file")
    local actual_hash=$(sha256sum "$binary" | cut -d' ' -f1)
    
    if [[ "$expected_hash" != "$actual_hash" ]]; then
      echo "SHA256 verification failed!"
      echo "Expected: $expected_hash"
      echo "Got: $actual_hash"
      return 1
    fi
    echo "SHA256 verification passed"
  fi
}

package() {
  cd "$srcdir"
  
  # Install the appropriate binary based on architecture
  if [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "${pkgname}-${pkgver}-linux-amd64" "$pkgdir/usr/bin/${pkgname}"
  elif [[ "$CARCH" == "aarch64" ]]; then
    install -Dm755 "${pkgname}-${pkgver}-linux-arm64" "$pkgdir/usr/bin/${pkgname}"
  fi
  
  # Note: If the releases include a LICENSE file, you should download and install it
  # For now, this assumes the license will need to be extracted from the repository
  # You might want to add the LICENSE file to the sources if it's available as a separate download
}
