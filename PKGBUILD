# Maintainer: fishy <me at fishies dot dev>

pkgname=godsvg-git
pkgver=1.0.alpha11.13.gf19a85f8
_godotver=4.5.1-stable
_templatename="Godot_v${_godotver}_export_templates"
pkgrel=1
pkgdesc="An editor for Scalable Vector Graphics (SVG) files. Built with Godot"
url="godsvg.com"
license=("MIT")
arch=("x86_64")
makedepends=(git godot)
depends=(glibc libglvnd)
provides=(godsvg)
conflicts=(godsvg godsvg-bin)

source=("git+https://github.com/MewPurPur/GodSVG.git" "https://github.com/godotengine/godot-builds/releases/download/${_godotver}/${_templatename}.tpz" "add-custom-template.patch")
sha256sums=("SKIP" "1998af37f1387684e2c211cdb483daf492fc64dc6b12096bddcdca25b6910c86" "SKIP")

pkgver() {
    cd "GodSVG" || return
    git describe --tags HEAD | sed 's/^v//;s/-/./g'
}

build() {
    mkdir -p GodSVG/export
    cp -r "templates" "GodSVG/export/"
    cd "GodSVG" || return
    git apply ../add-custom-template.patch
    godot --headless --export-release "Linux" export/godsvg
}

package() {
    install -Dm755 "GodSVG/export/godsvg" "${pkgdir}/usr/bin/godsvg"
    install -Dm644 "GodSVG/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "GodSVG/assets/GodSVG.desktop" "${pkgdir}/usr/share/applications/godsvg.desktop"
    install -Dm644 "GodSVG/assets/logos/icon.png" "${pkgdir}/usr/share/pixmaps/godsvg.png"
    install -Dm644 "GodSVG/assets/logos/icon.svg" "${pkgdir}/usr/share/pixmaps/godsvg.svg"
}
