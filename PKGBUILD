# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=sporemodder-fx-bin
pkgver=2.2.27
pkgrel=1
pkgdesc="Spore data modding tool: unpack, edit and repack game packages with a JavaFX editor or the smfx CLI (prebuilt jar)"
arch=('x86_64')
url="https://github.com/Spore-Community/SporeModder-FX"
license=('GPL-3.0-or-later')
# The jar bundles JavaFX 17 with its Linux natives; these are their direct NEEDED libraries.
depends=('java-runtime>=11' 'gtk3' 'cairo' 'gdk-pixbuf2' 'glib2' 'libx11' 'libxtst'
         'libglvnd' 'freetype2' 'pango')
optdepends=('meld: compare a mod file against its original from the editor'
            'git: publish mod bundles to GitHub from the editor')
makedepends=('zip')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
install="${pkgname}.install"

_name=${pkgname%-bin}
_release_dir="SporeModder FX"
source=("${_name}-${pkgver}.zip::${url}/releases/download/v${pkgver}/SporeModder.FX.zip"
        "${_name}"
        "${_name}.desktop"
        'winmerge-shim')
sha256sums=('bd7908996b8022cd7452edefbdb2d62dbbe626d1e22962e83fe30def215e6669'
            'b02822a931fc84598f0f8152bce10250890e99a26a5a81a810230827a25e7415'
            'd3d22def1761610a736a5fb7ffd5d85f2b17a95f810574bccce69b1eec55e107'
            '8d475e055bdef5b9eb18f13eab13b8ae498e284e00ec4f802aa0e8c32c281154')

latestver() {
    curl -fsSL "https://api.github.com/repos/Spore-Community/SporeModder-FX/releases/latest" |
    jq -r '.tag_name // empty' | sed 's/^v//'
}

prepare() {
    cd "${_release_dir}"
    # The jar ships JavaFX natives for Windows, macOS and both GTK generations; the GTK 3
    # Linux set is the one the runtime loads on Arch.
    zip -q -d SporeModderFX.jar '*.dll' '*.dylib' libglassgtk2.so
    # advect.py is a developer plotting script (matplotlib) with no role at runtime
    rm -r SporeModderFX.exe smfx.exe smfx.sh WinMerge advect.py
    # The zip nests the styles matching the release tag under Styles/Styles beside a stale
    # top-level copy, which the editor would additionally list as a bogus "Styles" theme.
    rm -r Styles/Default Styles/Dark
    mv Styles/Styles/* Styles/
    rmdir Styles/Styles
}

package() {
    local share="${pkgdir}/usr/share/${_name}"

    install -d "${share}"
    cp -r --no-preserve=ownership,mode "${_release_dir}"/. "${share}/"
    install -Dm755 winmerge-shim "${share}/WinMerge/WinMergeU.exe"

    install -Dm755 "${_name}" "${pkgdir}/usr/bin/${_name}"
    ln -s "${_name}" "${pkgdir}/usr/bin/smfx"

    install -Dm644 "${_name}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_release_dir}/Styles/Default/program-icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_name}.png"
}
