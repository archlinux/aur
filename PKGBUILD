# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname="godot-pixel-renderer"
pkgname="${_pkgname}-git"
pkgver=r25.g4931722
pkgrel=2
pkgdesc="Godot Pixel Renderer (aka Godot Pixel Studio) is a complete 3D to Pixel Toolkit, built using Godot Engine"
arch=('x86_64')
url='https://github.com/bukkbeek/GodotPixelRenderer'
license=('MIT')
makedepends=('wget' 'unzip')
source=(
	"${pkgname}::git+${url}.git"
	"godot-pixel-renderer.desktop"
)
sha512sums=('SKIP'
            'd9814b182be7bd038f6138909e15555a42aed5df9aa1d9c68f494efd02c01256cb8f54a9dd8c6f2fd8904fd3efa44622cfec16d38c3023a44bac617823d0d474')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

_godot_cmd=""

_godot_installed() {
    flatpak list --app | grep -q "org.godotengine.Godot"
}

_extract_version() {
    echo "$1" | sed 's/^\([0-9]\+\.[0-9]\+\.[0-9]\+\)\..*$/\1/'
}

_install_export_templates() {
    local version="$1"
    local templates_path="$2"
    local templates_url="https://github.com/godotengine/godot/releases/download/${version}-stable/Godot_v${version}-stable_export_templates.tpz"
    
    echo "Installing Godot export templates for version ${version}..."
    
    mkdir -p "${templates_path}"
    
    wget -q --show-progress "${templates_url}" -O "godot_templates.tpz"
    unzip "godot_templates.tpz" -d temp_templates/
    mv temp_templates/templates/* "${templates_path}/"
    
    rm -rf temp_templates/ godot_templates.tpz
    
    echo "Export templates installed successfully!"
}

_check_templates_exist() {
    local templates_path="$1"
    [ -f "${templates_path}/linux_release.x86_64" ]
}

_get_godot() {
    if [ -n "$_godot_cmd" ]; then
        $_godot_cmd "$@"
    else
        echo "Error: Godot command not initialized!"
        exit 1
    fi
}

prepare() {
    cd "${pkgname}"

    if command -v flatpak >/dev/null 2>&1 && _godot_installed; then
        echo "Using Flatpak Godot installation..."
        _godot_cmd="flatpak run org.godotengine.Godot"
        
        godot_version_full=$($_godot_cmd --version 2>/dev/null)
        godot_version=$(_extract_version "${godot_version_full}")
        templates_path="${HOME}/.var/app/org.godotengine.Godot/data/godot/export_templates/${godot_version}.stable"
        
    elif command -v godot >/dev/null 2>&1; then
        echo "Using system Godot installation..."
        _godot_cmd="godot"
        
        godot_version_full=$($_godot_cmd --version 2>/dev/null)
        godot_version=$(_extract_version "${godot_version_full}")
        templates_path="${HOME}/.local/share/godot/export_templates/${godot_version}.stable"
        
    else
    	echo "Error: Neither Flatpak nor system Godot installation found!"
        echo "Please install Godot either via:"
        echo "  - Arch package: pacman -S godot"
        echo "  - Flatpak: flatpak install flathub org.godotengine.Godot"
        exit 1
    fi

    echo "Detected Godot version: ${godot_version}"
    
    if ! _check_templates_exist "${templates_path}"; then
        echo "Export templates not found, installing..."
        _install_export_templates "${godot_version}" "${templates_path}"
    else
        echo "Export templates already exist"
    fi
}

build() {
    cd "${pkgname}"
    mkdir -p ./build

    _get_godot --headless --import ./project.godot --export-release "Linux" "./build/${_pkgname}"
}

package() {
    install -Dm 644 "${srcdir}/godot-pixel-renderer.desktop" "${pkgdir}/usr/share/applications/godot-pixel-renderer.desktop"

    cd "${pkgname}"

    install -Dm 755 "build/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"
    install -Dm 644 "build/${_pkgname}.pck" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}.pck"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm 644 "PixelRenderer.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/usr/share/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

pkgver() {
    cd "${pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
