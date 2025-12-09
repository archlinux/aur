# Maintainer: fishy <me at fishies dot dev>

pkgname=godsvg-git
pkgver=1.0.alpha13.7.gda354a12
_godotver=4.5.1-stable
_godotname="Godot_v${_godotver}_linux.x86_64"
_templatename="Godot_v${_godotver}_export_templates"
pkgrel=1
pkgdesc="An editor for Scalable Vector Graphics (SVG) files. Built with Godot"
url="godsvg.com"
license=("MIT")
arch=("x86_64")
makedepends=(git yq)
depends=(glibc libglvnd)
provides=(godsvg)
conflicts=(godsvg godsvg-bin)

source=(
    "git+https://github.com/MewPurPur/GodSVG.git"
    "https://github.com/godotengine/godot-builds/releases/download/${_godotver}/${_godotname}.zip"
    "https://github.com/godotengine/godot-builds/releases/download/${_godotver}/${_templatename}.tpz"
    "add-custom-template.patch"
)
sha256sums=(
    "SKIP"
    "02ec53d1cc7dbb9cc6355393c61b9ab43d1244751a124f10248a4802830788cd"
    "1998af37f1387684e2c211cdb483daf492fc64dc6b12096bddcdca25b6910c86"
    "c48cf5c2d298fc6638cced0c1d04f9665d7815b4042115a2748f2f2de0012be4"
)

pkgver() {
    cd "GodSVG" || return
    git describe --tags HEAD | sed 's/^v//;s/-/./g'
}

build() {
    local workflow
    workflow=$(curl -s https://raw.githubusercontent.com/MewPurPur/GodSVG/refs/heads/main/.github/workflows/export-optimized.yml)
    local realgodotver
    realgodotver=$(yq -r '.env.GODOT_VERSION' <<< "$workflow")-$(yq -r '.env.GODOT_RELEASE' <<< "$workflow")

    if [ "$realgodotver" != "$_godotver" ]; then
        exit 1
    fi

    mkdir -p GodSVG/export
    cp -r "templates" "GodSVG/export/"
    cd "GodSVG" || return
    git apply ../add-custom-template.patch
    "./../${_godotname}" --headless --export-release "Linux" export/godsvg
}

package() {
    install -Dm755 "GodSVG/export/godsvg" "${pkgdir}/usr/bin/godsvg"
    install -Dm644 "GodSVG/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "GodSVG/assets/GodSVG.desktop" "${pkgdir}/usr/share/applications/godsvg.desktop"
    install -Dm644 "GodSVG/assets/logos/icon.png" "${pkgdir}/usr/share/pixmaps/godsvg.png"
    install -Dm644 "GodSVG/assets/logos/icon.svg" "${pkgdir}/usr/share/pixmaps/godsvg.svg"
}
