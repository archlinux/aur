# Maintainer: Kazoku <k4zoku@pm.me>
_pkgbase=tosu-overlay
_tag=7b0b7b6edc25beb77aeeb377740bc43037b53773

pkgname=${_pkgbase}
pkgdesc="Overlay for osu! Powered by tosu, qt6, qt6-webengine and layer-shell-qt"
pkgver=2.1.1
pkgrel=2
url="https://github.com/K4zoku/tosu-overlay-qt"
arch=('x86_64')
license=('MIT')
# added cmake to resolve layer-shell-qt build dependency
makedepends=('git' 'gcc' 'cmake' 'meson') 
depends=('qt6-base' 'qt6-webengine' 'layer-shell-qt' 'tosu')
source=("${_pkgbase}::git+${url}.git?signed#tag=${_tag}")
validpgpkeys=('C6797F75E4A487395E79B2D1413897C051068F03')  # k4zoku <k4zoku@pm.me>
sha256sums=('7d7784bc0fbeea14882a41a4eee255f7b10bc731fcd2f046266d376c16ea5d2e')

pkgver() {
    cd "${_pkgbase}"
    git describe | sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson "${_pkgbase}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"

    cd "${_pkgbase}"
    install -Dm644 "res/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgbase}.svg"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
    install -Dm644 "dist/${_pkgbase}.desktop" "${pkgdir}/usr/share/applications/${_pkgbase}.desktop"
}
