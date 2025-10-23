# Maintainer: wang1zhen <you@example.com>
pkgname=lyricbridge
pkgver=0.1.0
pkgrel=2
pkgdesc="LyricBridge – Electron + FastAPI lyrics tool"
arch=('x86_64' 'aarch64')
url="https://github.com/wang1zhen/lyricbridge"
license=("Apache")
depends=(
  'electron'
  'nodejs'
  'python'
  'uvicorn'
  'python-fastapi'
  'python-httpx'
  'python-pydantic'
  'python-pydantic-settings'
  'python-cachetools'
  'python-dotenv'
  'python-beautifulsoup4'
  'python-lxml'
  'python-dateutil'
)
makedepends=('git')
provides=('lyricbridge')
conflicts=('lyricbridge-git')
source=(
  "lyricbridge-${pkgver}.tar.gz::https://github.com/wang1zhen/lyricbridge/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('87f050e9374efc5c2c04e7a122bbe9a7cca0fe1e87c2114aa0e360ecbc1c5b3c')

package() {
  cd "${srcdir}/lyricbridge-${pkgver}"

  install -d "${pkgdir}/usr/lib/lyricbridge"
  cp -r lyricbridge/backend "${pkgdir}/usr/lib/lyricbridge/"
  cp -r lyricbridge/frontend "${pkgdir}/usr/lib/lyricbridge/"

  # Launcher
  install -d "${pkgdir}/usr/bin"
  install -m 755 packaging/arch/lyricbridge.sh "${pkgdir}/usr/bin/lyricbridge"

  # Desktop entry
  install -d "${pkgdir}/usr/share/applications"
  install -m 644 packaging/arch/lyricbridge.desktop "${pkgdir}/usr/share/applications/lyricbridge.desktop"

  # Icon (SVG)
  install -d "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -m 644 lyricbridge/frontend/renderer/favicon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lyricbridge.svg"

  # License (fallback to README.md if LICENSE is missing in this tag)
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  if [[ -f LICENSE ]]; then
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  else
    install -m 644 README.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
