# Based  on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Tom Whitwell <aur@whi.tw>

_pkgname=xxh

pkgname="${_pkgname}"-appimage
pkgver=0.8.10
_releasetagsuffix=-release2
_releasetag="${pkgver}${_releasetagsuffix}"
pkgrel=2
pkgdesc="Bring your favorite shell wherever you go through the ssh."
arch=('x86_64')
url="https://github.com/xxh/xxh"
license=('BSD')
# depends=('zlib' 'hicolor-icon-theme')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://github.com/xxh/xxh/releases/download/${_releasetag}/${_pkgname}-x86_64.AppImage"
    "https://raw.githubusercontent.com/xxh/xxh/${_releasetag}/LICENSE"
    "completion.zsh"
)
noextract=("${_appimage}")
sha256sums_x86_64=('11aa407d68219a0ebe8af7f4b5b6b8d207014d6c4b78ec5d9b128a187427f0c1'
    '0dd080bac3912ce8c4da834a99e7a91fa9bdd076f5260ec6dccb6ee3bd4a10e3'
    '78500bb956e239f04e0a44d49e6e2c77ee66707f45944ebfca616382beb71523'
)

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Completion
    install -Dm644 "${srcdir}/completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_xxh"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
