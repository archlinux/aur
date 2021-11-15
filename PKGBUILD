_pkgname=meshlab
pkgname="${_pkgname}"-appimage
pkgver=2021.10
pkgrel=1
pkgdesc="Open-source mesh processing tool"
arch=('x86_64')
url="https://www.meshlab.net"
license=('GPL3')
depends=(
    'bzip2'
    'cgal'
    'glew'
    'glu'
    'openssl-1.0'
    'qt5-base'
    'qt5-declarative'
    'qt5-script'
    'qt5-xmlpatterns'
    'xerces-c')
optdepends=(
    'u3d: for U3D and IDTF file support'
    'lib3ds: for Autodesk`s 3D-Studio r3 and r4 .3DS file support'
    'levmar: for isoparametrization and mutualcorrs plugins'
    'muparser: for filer_func plugins'
    'mpir: for Constructive Solid Geometry operation filters'
    'openctm-tools: for compressed triangle mesh file format')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
_appimage="MeshLab${pkgver}-linux.AppImage"
source=("https://github.com/cnr-isti-vclab/meshlab/releases/download/Meshlab-${pkgver}/${_appimage}")
noextract=("${_appimage}")
sha256sums=('3949399febea8e556a537177cfd98f4cbe7b3573a5c1b3738c62e3c940526568')

prepare() {
    cd "${srcdir}"
    chmod +x "${_appimage}"
    "./${_appimage}" --appimage-extract "${_pkgname}.desktop"
    "./${_appimage}" --appimage-extract "${_pkgname}.png"
    "./${_appimage}" --appimage-extract usr/share
    sed -i -E "s|Exec=.*|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} %F|" \
        "squashfs-root/${_pkgname}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${_pkgname}/${_appimage}"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png"\
        "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -dm755 "${pkgdir}/usr/share/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" \
        "${pkgdir}/usr/share"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/doc/${_pkgname}/LICENSE.txt"\
        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
