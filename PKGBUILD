# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: digital_mystik <dgtl underscore mystik at protonmail dot ch>

_pkgname="ipfs-desktop"
pkgname="${_pkgname}-appimage"
pkgver=0.41.1
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=('x86_64')
url="https://docs.ipfs.tech/install/ipfs-desktop/"
_url="https://github.com/ipfs/${_pkgname}"
license=('MIT')
depends=('glibc' 'hicolor-icon-theme' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.AppImage::${_url}/releases/download/v${pkgver}/${_pkgsrc}-linux-x86_64.AppImage")
b2sums=('c9e3784c2a31d9cb945d7b2fe6195424ab75592d947ab962358761dda8403e45ccf56275d96cf35b6b1f9352556db513b9c4335c424f281ba1c1aa3b40a52f5d'
        '7da06f52c120cbae71a7d2973c98fbf6410cd7e9261c85caf8d0fc13ce52e3b954e81e9bf5ce7b4e3e2d8782ae18a00a629a01d6eb4ab38a3dcff8b285645889'
        '2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d')
b2sums_x86_64=('b8a780888f85375cc46bced653aff0d971abb27a43018f541b09e965aaaa3d30121986554063ed1a537cf411407b5f124380ae05e40e00f9978a8b33eb20acd8')

prepare() {
  cd "${srcdir}"
  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null

  rm -rf "${_pkgsrc}-${CARCH}"
  mv -f "squashfs-root" "${_pkgsrc}-${CARCH}"
}

build() {
  cd "${srcdir}"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX "${_pkgsrc}-${CARCH}"/

  cd "${_pkgsrc}-${CARCH}"
  sed -i 's/^Exec=.*$/'"Exec=${_pkgname} %U/g" "${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -vDm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  find "usr/share" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/{}" \;

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vsf "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
