# Maintainer: Jun-I Wu <michaelcat at aur.archlinux.org> and Jayesh Badwaik <jayesh at aur.archlinux.org>
# Contributer (previous maintainer and original submitter): Alexey Peschany <sandboiii at aur.archlinux.org>

pkgname=webcatalog-bin
_pkgname=webcatalog
pkgver=55.3.0
pkgrel=1
pkgdesc="Turn Any Websites into Real Desktop Apps"
arch=('x86_64' 'aarch64')
url="https://webcatalog.io/webcatalog/"
options=('!strip')
_filename="WebCatalog-$pkgver.AppImage"

source=("${_pkgname}.patch")
source_x86_64=("$_filename::https://cdn-2.webcatalog.io/$_pkgname/WebCatalog-$pkgver.AppImage")
source_aarch64=("$_filename::https://cdn-2.webcatalog.io/$_pkgname/WebCatalog-$pkgver-arm64.AppImage")

sha256sums=('8e13556f9eab7880fbc586d625147e7602d8d99cf0f23a6a130e0eb821a9a7fd')
sha256sums_x86_64=('d5850d96be841b3b34aab2b6680224c22706f406a32fbb724cbbaaecd55aaeac')
sha256sums_aarch64=('d21d0284102571875ccf0a14c7416a62ebf20b5ea79c020e36e805847f220c1a')

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
