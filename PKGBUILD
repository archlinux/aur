# Maintainer: Jun-I Wu <michaelcat at aur.archlinux.org> and Jayesh Badwaik <jayesh at aur.archlinux.org>
# Contributer (previous maintainer and original submitter): Alexey Peschany <sandboiii at aur.archlinux.org>

pkgname=webcatalog-bin
_pkgname=webcatalog
pkgver=55.2.0
pkgrel=2
pkgdesc="Turn Any Websites into Real Desktop Apps"
arch=('x86_64' 'aarch64')
url="https://webcatalog.io/webcatalog/"
options=('!strip')
_filename="WebCatalog-$pkgver.AppImage"

source=("${_pkgname}.patch")
source_x86_64=("$_filename::https://cdn-2.webcatalog.io/$_pkgname/WebCatalog-$pkgver.AppImage")
source_aarch64=("$_filename::https://cdn-2.webcatalog.io/$_pkgname/WebCatalog-$pkgver-arm64.AppImage")

sha256sums=('8e13556f9eab7880fbc586d625147e7602d8d99cf0f23a6a130e0eb821a9a7fd')
sha256sums_x86_64=('71ad336e2335b69e1b94a879b6f87f9a4b90d22edcc20c9fbee22f17c880fee4')
sha256sums_aarch64=('b1ed6dd6ec58036bc619270d24ace5f87a23ebf77fa0acf7c5eb118cbff760f1')

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
    cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/@webcatalogdesktop.desktop" "${pkgdir}/usr/share/applications/webcatalog.desktop"
    patch -d "${pkgdir}" -p1 < "${_pkgname}.patch"
}
