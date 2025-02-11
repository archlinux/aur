# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ipfs-desktop"
pkgname="${_pkgname}-bin"
pkgver=0.41.1
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=('x86_64')
url="https://docs.ipfs.tech/install/ipfs-desktop/"
_url="https://github.com/ipfs/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2'
         'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'sh' 'systemd-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.deb")
source=("${_pkgsrc}-CHANGELOG.md::${_url}/raw/refs/tags/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
# source_x86_64=("${_pkgsrc}-x86_64.tar.xz::${_url}/releases/download/v${pkgver}/${_pkgsrc}-linux-x64.tar.xz")
source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_pkgsrc}-linux-amd64.deb")
b2sums=('c9e3784c2a31d9cb945d7b2fe6195424ab75592d947ab962358761dda8403e45ccf56275d96cf35b6b1f9352556db513b9c4335c424f281ba1c1aa3b40a52f5d'
        '7da06f52c120cbae71a7d2973c98fbf6410cd7e9261c85caf8d0fc13ce52e3b954e81e9bf5ce7b4e3e2d8782ae18a00a629a01d6eb4ab38a3dcff8b285645889'
        '2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d')
b2sums_x86_64=('3d260bc7768826189cf6a0fdfeac31356dc6311ac64b56fa8daf7d4a845efd308e8f9708a731c208828bda895ead2914687ddcf26d61060a9f9c0bbbf3d05c58')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  mv -f "opt/IPFS Desktop" "opt/${_pkgname}"

  cd "usr/share"
  rm -rf "doc"

  cd "applications"
  sed -i "s/^Exec=.*/Exec=${_pkgname}/g" "${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-${CARCH}"/* "${pkgdir}"

  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # install -vdm755 "${pkgdir}/opt/${_pkgname}"
  # cp -vr "${_pkgsrc}-linux-x64"/* "${pkgdir}/opt/${_pkgname}/"

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vsf "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
