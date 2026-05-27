# Maintainer: wisdom <wisboynelson123@gmail.com>
#
# Build flags:
#   _USE_BUILDER=1  -> build with electron-builder (produces .pkg.tar.zst)
#   _USE_BUILDER=0  -> install directly from dist/ (faster, default)

pkgname=termcanvas
pkgver=0.39.8
pkgrel=1
pkgdesc="An infinite canvas desktop app for visually managing terminals"
arch=('x86_64')
url="https://github.com/blueberrycongee/termcanvas"
license=('MIT')
depends=('electron' 'libxss' 'nss' 'gtk3' 'libnotify' 'xdg-utils' 'alsa-lib' 'libpulse')
makedepends=('nodejs>=20' 'pnpm' 'git' 'python' 'gcc' 'make')
conflicts=("termcanvas-bin")
source=("${url}/archive/v${pkgver}.tar.gz"
        "termcanvas.desktop"
        "termcanvas.sh"
        "io.github.blueberrycongee.termcanvas.metainfo.xml")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

_USE_BUILDER="${_USE_BUILDER:-0}"

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pnpm install --frozen-lockfile
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pnpm build

  if [ "${_USE_BUILDER}" = "1" ]; then
    pnpm exec electron-builder --linux pacman --publish never
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  if [ "${_USE_BUILDER}" = "1" ]; then
    PKG_FILE="$(ls out/*.pkg.tar.zst 2>/dev/null | head -1)"
    if [ -n "${PKG_FILE}" ]; then
      tar -xaf "${PKG_FILE}" -C "${pkgdir}"
      return 0
    fi
  fi

  install -dm755 "${pkgdir}/opt/termcanvas"
  cp -r dist/* "${pkgdir}/opt/termcanvas/"
  cp -r dist-electron/* "${pkgdir}/opt/termcanvas/"

  install -dm755 "${pkgdir}/opt/termcanvas/cli"
  cp -r dist-cli/* "${pkgdir}/opt/termcanvas/cli/" 2>/dev/null || true

  install -dm755 "${pkgdir}/opt/termcanvas/skills"
  cp -r skills/* "${pkgdir}/opt/termcanvas/skills/" 2>/dev/null || true

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/termcanvas.png"

  install -Dm644 "${srcdir}/termcanvas.desktop" \
    "${pkgdir}/usr/share/applications/termcanvas.desktop"

  install -Dm644 "${srcdir}/io.github.blueberrycongee.termcanvas.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.blueberrycongee.termcanvas.metainfo.xml"

  install -Dm755 "${srcdir}/termcanvas.sh" \
    "${pkgdir}/usr/bin/termcanvas"
}
