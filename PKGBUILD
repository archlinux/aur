# Maintainer: ArchionTechno (luongmanhtuanfake99 at gmail dot com)
pkgname=bforartists-bin
pkgver=5.1.2
pkgrel=1
pkgdesc="A fork of the popular 3D software Blender, with a focus on UI/UX improvements (Pre-compiled Binary)"
arch=('x86_64')
url="https://www.bforartists.de/"
license=('GPL3')
depends=('libx11' 'libxi' 'libxxf86vm' 'libxrender' 'libgl' 'openal' 'libsndfile' 'zlib' 'ffmpeg' 'libxkbcommon' 'wayland')
optdepends=('cuda: Support fast render by GPU NVIDIA CUDA'
            'optix: Support fast ray tracing render by NVIDIA OptiX')
provides=('bforartists')
conflicts=('bforartists')
options=('!strip')

source=("https://github.com/Bforartists/Bforartists/releases/download/v${pkgver}/Bforartists-${pkgver}-Linux.tar.xz")
sha256sums=('86609a252610ec1959fa5fde2b6b2def848cee9805ca325c2c63cc13e82c106d')

package() {
    install -d "${pkgdir}/opt/bforartists"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps"

    cd "${srcdir}/Bforartists-${pkgver}-Linux"
    cp -a * "${pkgdir}/opt/bforartists/"

    ln -s /opt/bforartists/bforartists "${pkgdir}/usr/bin/bforartists"

    if [ -f "${pkgdir}/opt/bforartists/bforartists.desktop" ]; then
        mv "${pkgdir}/opt/bforartists/bforartists.desktop" "${pkgdir}/usr/share/applications/bforartists.desktop"
        sed -i 's|Exec=.*|Exec=/usr/bin/bforartists|g' "${pkgdir}/usr/share/applications/bforartists.desktop"
    else
        cat <<EOF > "${pkgdir}/usr/share/applications/bforartists.desktop"
[Desktop Entry]
Name=Bforartists
GenericName=3D Modeler
Comment=Fork of Blender focused on UI/UX
Exec=/usr/bin/bforartists
Icon=bforartists
Terminal=false
Type=Application
Categories=Graphics;3DGraphics;
EOF
    fi

    if [ -f "${pkgdir}/opt/bforartists/bforartists.png" ]; then
        ln -s /opt/bforartists/bforartists.png "${pkgdir}/usr/share/pixmaps/bforartists.png"
    fi
}
