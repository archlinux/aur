# Maintainer: Ashutosh Tiwari <contact@ashutoshtiwari.dev>
pkgname=qwarp
pkgver=0.8.0
pkgrel=1
_warpver=2026.4.1350.0
pkgdesc="A lightweight, Wayland-native Qt6 wrapper for Cloudflare WARP"
arch=('x86_64')
url="https://github.com/iashutoshtiwari/qwarp"
license=('MIT')
depends=('python' 'python-pyqt6')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'qt6-tools')
conflicts=('cloudflare-warp-bin')
install=qwarp.install

# Bash substitution converts "0.6.0_alpha" to "0.6.0-alpha" for GitHub tags
source=("$pkgname-$pkgver.tar.gz::https://github.com/iashutoshtiwari/qwarp/archive/refs/tags/v${pkgver/_/-}.tar.gz"
        "cloudflare-warp-${_warpver}.deb::https://pkg.cloudflareclient.com/pool/noble/main/c/cloudflare-warp/cloudflare-warp_${_warpver}_amd64.deb")
sha256sums=('cc9d2488042b0e24b385c261767b9eef091fd9971479f626edb9976b62d8e522'
            'f35ae16dd97e8a78dd970341cb6ae3e8131af1962f79cb7b9d698a874eab7f2a')
noextract=("cloudflare-warp-${_warpver}.deb")

prepare() {
  # Extract only the core binaries and systemd service from the deb package
  mkdir -p "${srcdir}/warp-extract"
  bsdtar -xf "${srcdir}/cloudflare-warp-${_warpver}.deb" -C "${srcdir}/warp-extract"
  bsdtar -xf "${srcdir}/warp-extract/data.tar.gz" -C "${srcdir}/warp-extract" \
    ./bin/warp-svc ./bin/warp-cli ./lib/systemd/system/warp-svc.service
}

build() {
  # Enter the directory extracted from the GitHub tarball
  cd "$pkgname-${pkgver/_/-}"

  # Gather PyQt translation files before generating the wheel so they are grabbed by setup.py
  bash scripts/build_locales.sh

  # Build the wheel
  python -m build --wheel --no-isolation
}

package() {
  # Enter the directory extracted from the GitHub tarball
  cd "$pkgname-${pkgver/_/-}"

  local _wheels=(dist/*.whl)

  if [ ! -f "${_wheels[0]}" ]; then
      echo "Error: No wheel found in dist/"
      exit 1
  fi

  # Install the Python package
  python -m installer --destdir="$pkgdir" "${_wheels[0]}"

  # Install the desktop entry
  install -Dm644 qwarp.desktop "$pkgdir/usr/share/applications/qwarp.desktop"

  # Install the SVG icon
  install -Dm644 "src/qwarp/assets/app-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/qwarp.svg"

  # Install the license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install core Cloudflare WARP binaries (extracted from the official .deb)
  install -Dm755 "${srcdir}/warp-extract/bin/warp-svc" "${pkgdir}/usr/bin/warp-svc"
  install -Dm755 "${srcdir}/warp-extract/bin/warp-cli" "${pkgdir}/usr/bin/warp-cli"

  # Install and patch the systemd service (fix binary path for Arch)
  install -Dm644 "${srcdir}/warp-extract/lib/systemd/system/warp-svc.service" \
    "${pkgdir}/usr/lib/systemd/system/warp-svc.service"
  sed -e "s%ExecStart=/bin/warp-svc%ExecStart=/usr/bin/warp-svc%" \
    -i "${pkgdir}/usr/lib/systemd/system/warp-svc.service"
}
