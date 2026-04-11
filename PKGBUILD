pkgname=taskers-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='Agent-first terminal workspace (latest published Linux bundle)'
arch=('x86_64')
url='https://github.com/OneNoted/taskers'
license=('MIT')
options=('!strip' '!debug')
depends=('glibc' 'gtk4' 'libadwaita' 'webkitgtk-6.0')
optdepends=(
  'niri: focus an existing Taskers window from desktop launches'
  'xdg-desktop-portal-gtk: improve desktop portal support'
)
provides=('taskers')
conflicts=('taskers' 'taskers-git')
_asset_name='taskers-linux-bundle-x86_64-unknown-linux-gnu.tar.xz'
source=(
  'taskers.desktop'
  'taskers-wrapper.sh'
  'taskers.svg'
  'LICENSE'
  "${_asset_name}::https://github.com/OneNoted/taskers/releases/latest/download/${_asset_name}"
)
noextract=("${_asset_name}")
sha256sums=(
  '2902765627b7976f589ea4edf50f2468b45900225197b452e70f9bbae4eaa476'
  '83c76f0c92d4c1a2f13e70fb1f18da089a01726ecbb2b7a67bae9ad0a677778b'
  '019a8646c7b6b93cb375ca012e5e8cf615f2d6b164f404e8b2a99b0d7d1a2936'
  'b0dde23d2f2c9d247848720ae985ef83e40d4eeb6b2b6b662423a1bad390019b'
  'SKIP'
)

pkgver() {
  bsdtar -xOf "${srcdir}/${_asset_name}" ghostty/.taskers-runtime-version | tr -d '[:space:]'
}

package() {
  install -dm755 "${pkgdir}/opt/taskers" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  bsdtar -xf "${srcdir}/${_asset_name}" -C "${pkgdir}/opt/taskers"

  install -Dm755 "${srcdir}/taskers-wrapper.sh" "${pkgdir}/usr/bin/taskers"
  install -Dm755 "${srcdir}/taskers-wrapper.sh" "${pkgdir}/usr/bin/taskersctl"
  install -Dm755 "${srcdir}/taskers-wrapper.sh" "${pkgdir}/usr/bin/taskers-terminald"
  install -Dm644 "${srcdir}/taskers.desktop" \
    "${pkgdir}/usr/share/applications/dev.taskers.app.desktop"
  install -Dm644 "${srcdir}/taskers.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/taskers.svg"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
