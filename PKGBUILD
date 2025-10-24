# Maintainer: Kazoku <k4zoku@pm.me>
_pkgbase=tosu-overlay

pkgname=${_pkgbase}-git
pkgdesc="Overlay for osu! Powered by tosu, qt6, qt6-webengine and layer-shell-qt"
pkgver=2.1.1.r0.g2345251
pkgrel=1
url="https://github.com/K4zoku/tosu-overlay-qt"
arch=('x86_64')
license=('MIT')
# added cmake to resolve layer-shell-qt build dependency
makedepends=('git' 'gcc' 'cmake' 'meson') 
depends=('qt6-base' 'qt6-webengine' 'layer-shell-qt' 'tosu')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("${_pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgbase}"
    git describe --long --tags | sed 's/^v//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
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
