# Maintainer: fishy <me at fishies dot dev>

pkgname=godsvg-git
pkgver=1.0.alpha17.22.g52ad7944
_godotver=4.8-beta1
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
    "199b2d6a0daa3a74a697356f31c33347f997f65258ba7dd07ca8c1110757927d"
    "74bc5e7396ec1a811070849da6931cc99b01b0861a659c22b97e8adecf96d71a"
    "9e9617b00081a66017cefce99d82ac9ae937e613c08d5961e8f178b31ca62e77"
)

pkgver() {
    cd "GodSVG" || return
    git describe --tags HEAD | sed 's/^v//;s/-/./g'
}

build() {
    local workflow
    workflow=$(curl -s https://raw.githubusercontent.com/MewPurPur/GodSVG/refs/heads/main/.github/workflows/export-optimized.yml)
    local realgodotver
    realgodotver=$(yq -r '.env.GODOT_VERSION' <<< "$workflow")-$(yq -r '.env.GODOT_RELEASE_TYPE' <<< "$workflow")

    if [ "$realgodotver" != "$_godotver" ]; then
    	printf "Godot version $realgodotver does not match target $_godotver"
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
    install -Dm644 "GodSVG/no_export/distribution/com.godsvg.GodSVG.desktop" "${pkgdir}/usr/share/applications/com.godsvg.GodSVG.desktop"
    install -Dm644 "GodSVG/assets/logos/icon.png" "${pkgdir}/usr/share/pixmaps/godsvg.png"
    install -Dm644 "GodSVG/assets/logos/icon.svg" "${pkgdir}/usr/share/pixmaps/godsvg.svg"
}
