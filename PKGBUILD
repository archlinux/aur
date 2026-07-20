# Maintainer: 5unekku <jimmy.bungalo8@gmail.com>

pkgname=undertalemodtool-avalonia-git
_pkgname=UndertaleModTool_Avalonia
pkgver=r3729.82a84b8d
pkgrel=1
pkgdesc="GameMaker mod tool (Avalonia GUI port of UndertaleModTool; also provides the cli, invoked without --gui)"
arch=('x86_64')
url="https://github.com/5unekku/UndertaleModTool_Avalonia"
license=('GPL-3.0-only')
depends=('gtk3' 'icu' 'libx11')
makedepends=('git' 'dotnet-sdk')
provides=('undertalemodtool' 'undertalemodtool-avalonia')
conflicts=('undertalemodtool-bin' 'undertalemodtool-avalonia-bin')
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    git submodule update --init --recursive
}

build() {
    cd "${pkgname}"
    dotnet publish UndertaleModToolAvalonia/UndertaleModToolAvalonia.csproj \
        -c Release -r linux-x64 --self-contained true \
        -p:PublishSingleFile=false \
        -o publish
}

package() {
    cd "${pkgname}"

    install -d "${pkgdir}/opt/${_pkgname}"
    cp -r publish/* "${pkgdir}/opt/${_pkgname}/"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/UndertaleModTool" \
        "${pkgdir}/usr/bin/undertalemodtool"

    # hicolor theme pngs (nearest-neighbour rescales of the 32px pixel-art mark)
    for _size in 24 32 48 64 96 128 192 256; do
        install -Dm644 "UndertaleModToolAvalonia/Assets/AppIcon/undertalemodtool-${_size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/undertalemodtool.png"
    done

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/undertalemodtool.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=UndertaleModTool
Comment=${pkgdesc}
Exec=undertalemodtool --gui %f
Icon=undertalemodtool
Terminal=false
Categories=Development;Utility;
EOF

    install -Dm644 LICENSE.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
