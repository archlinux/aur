# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

_pkgname=meshlab
pkgname="${_pkgname}"-appimage
pkgver=2023.12
pkgrel=1
pkgdesc="Open source system for processing and editing 3D triangular meshes. Appimage package"
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
source=("https://github.com/cnr-isti-vclab/meshlab/releases/download/MeshLab-${pkgver}/${_appimage}")
noextract=("${_appimage}")
sha256sums=('ca91c117b4dfcbd97a1d662063443e0b6db89472f3d1bb873ab1096ac62adc9c')

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
