# Maintainer: Jun-I Wu <michaelcat at aur.archlinux.org> and Jayesh Badwaik <jayesh at aur.archlinux.org>
# Contributer (previous maintainer and original submitter): Alexey Peschany <sandboiii at aur.archlinux.org>

pkgname=webcatalog-bin
_pkgname=webcatalog
pkgver=56.6.1
pkgrel=1
pkgdesc="Turn Any Websites into Real Desktop Apps"
arch=('x86_64' 'aarch64')
url="https://webcatalog.io/webcatalog/"
options=(!strip !debug)

_filename="WebCatalog-$pkgver.AppImage"

source=("${_pkgname}.patch")
sha256sums=('8e13556f9eab7880fbc586d625147e7602d8d99cf0f23a6a130e0eb821a9a7fd')

source_x86_64=("$_filename::https://cdn-2.webcatalog.io/$_pkgname/WebCatalog-$pkgver.AppImage")
sha256sums_x86_64=('e3a6fe51ab87189904b9aecf09ef9a9481489944d0266bbc2614a7c847cbe985')

source_aarch64=("$_filename::https://cdn-2.webcatalog.io/$_pkgname/WebCatalog-$pkgver-arm64.AppImage")
sha256sums_aarch64=('57f1ee53bcec5a90a3544be85cca9ca1702208ff9dd2d67dfdc3a00a9554ff3e')

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
