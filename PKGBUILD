# Maintainer: wenLiangcan <boxeed at gmail dot com>

_pkgname=truecraft
pkgname=truecraft-git
pkgver=r794.9ca7bca
pkgrel=1
epoch=1
pkgdesc="A completely clean-room implementation of Minecraft beta 1.7.3 (circa September 2011)."
arch=('i686' 'x86_64')
url="https://github.com/SirCmpwn/TrueCraft"
license=('MIT')
depends=('mono>=4.0' 'desktop-file-utils' 'gtk2' 'webkitgtk2' 'gtk-sharp-2' 'sdl_mixer')
makedepends=('git' 'nuget')
source=("${_pkgname}"::"git://github.com/SirCmpwn/TrueCraft.git"
        "${_pkgname}.svg"::'https://truecraft.io/static/truecraft_earth.svg')
provides=('truecraft')
conflicts=('truecraft')
md5sums=('SKIP'
         '2e23dc787e60fa1184bca7025589660d')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cat > "${_pkgname}.sh" << EOF
#!/usr/bin/env sh
mkdir -p \$HOME/.config/truecraft
cd \$HOME/.config/truecraft
ln -sf /usr/share/${_pkgname}/* ./
mono /usr/share/${_pkgname}/TrueCraft.Launcher.exe
EOF

    cat > "${_pkgname}.desktop" << EOF
[Desktop Entry]
Name=TrueCraft
GenericName=TrueCraft
Comment=A completely clean-room implementation of Minecraft beta 1.7.3
Exec=${_pkgname}
Icon=${_pkgname}.svg
Terminal=false
Type=Application
Categories=Game;
EOF
}

build() {
    cd "${_pkgname}"
    git reset --hard
    git submodule update --init --recursive || return 1
    nuget restore
    xbuild /p:Configuration=Release

    cd 'TrueCraft.Launcher/bin/Release/'
    # rm -f truecraft MonoGame.Framework.MacOS.dll MonoGame.Framework.Windows.dll
}

package() {
    install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    cd "${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    cd 'TrueCraft.Launcher/bin/Release/'

    find . -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/share/${_pkgname}/{}" \;
}

