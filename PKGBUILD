# Maintainer: dials
# PKGBUILD for snmpmini: Minimal containerized SNMP simulator packaging

pkgname=snmpmini
pkgver=1.0.0
pkgrel=1
pkgdesc="Minimal containerized SNMP simulator using snmpsim and pysnmp"
arch=('x86_64') # Only x86_64 officially supported, no multiarch detected
url="https://github.com/0xdials/snmpmini" # Updated to your GitHub repo
license=('MIT') # License as per your LICENSE file (please include one)
depends=('docker' 'bash') # Runtime needs docker or podman & bash for wrapper
makedepends=('docker') # Build depends on docker for local image build
source=("https://github.com/0xdials/snmpmini/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP') # Skip checksum: Verify locally before upload

prepare() {
  # Copy packaging files from packaging root into source directory for building/installing
  cp ../snmpmini "$srcdir/"
  cp ../snmpmini.service "$srcdir/"
}

build() {
  cd "$srcdir/snmpmini-${pkgver}"
  docker build -t snmpmini:local .
}

check() {
  echo "No automated tests. Please run smoke tests manually."
}

package() {
  # Install wrapper script from packaging root (one level above source)
  install -Dm755 "$srcdir/../snmpmini" "$pkgdir/usr/bin/snmpmini"

  # Install config files if they exist
  if [ -d "$srcdir/snmpmini-${pkgver}/config" ]; then
    install -d "$pkgdir/usr/share/snmpmini/config"
    cp -r "$srcdir/snmpmini-${pkgver}/config/." "$pkgdir/usr/share/snmpmini/config/"
  fi

  # Install systemd service file from packaging root (one level above source)
  install -Dm644 "$srcdir/../snmpmini.service" "$pkgdir/usr/lib/systemd/system/snmpmini.service"
}
