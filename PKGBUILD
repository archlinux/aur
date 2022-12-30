# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>

pkgname=webcatalog-bin
_pkgname=webcatalog
pkgver=44.3.0
pkgrel=1
pkgdesc="Turn Any Websites into Real Desktop Apps"
arch=('x86_64')
url="https://webcatalog.io/webcatalog/"
options=('!strip')
_filename="WebCatalog-$pkgver.AppImage"
source=(
    "https://cdn-2.webcatalog.io/$_pkgname/$_filename"
    "${_pkgname}.patch"
)
sha256sums=(
    'e00b63fd2edb451606d2cc4e5f30e75c4131728767e4d9efc5cdc4df59370715'
    '8e13556f9eab7880fbc586d625147e7602d8d99cf0f23a6a130e0eb821a9a7fd'
)

prepare() {
    cd "${srcdir}"
    chmod +x ${_filename}
    ./${_filename} --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}.AppImage"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/opt/appimages/${_filename}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    install -dm755 "${pkgdir}/usr/share/"
    cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    mkdir "${pkgdir}/usr/share/applications/"
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    patch -d "${pkgdir}" -p1 < "${_pkgname}.patch"
}
