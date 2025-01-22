# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bananas"
pkgname="${_pkgname}-bin"
pkgver=0.0.22
pkgrel=1
pkgdesc="Simple peer-to-peer screen sharing tool without account or server requirements"
arch=('aarch64' 'x86_64')
url="https://getbananas.net"
_url="https://github.com/mistweaverco/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs'
         'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups'
         'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
         'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{aarch64,x86_64}".deb")
source=("PRIVACY-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/PRIVACY.md"
        "README-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "TOS-${pkgver}.md::${_url}/raw/refs/tags/v${pkgver}/TOS.md"
        "LICENSE-${pkgver}::${_url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.deb::${_url}/releases/download/v${pkgver}/${_pkgname}_arm64.deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_pkgname}_amd64.deb")
sha256sums=('1bcc3ce508ea630cdcc5af73391e808cd01dd41c7103a4472432353516cfca35'
            '8021f9b84c9e165d85e14a72a3d1e61fb7957652a6a462e9ea88b8030b5d32c4'
            '9d7bf83149732ec4d2fdaaadf95fc09846109e1ccc1c62fc27a409caa924714c'
            '5ba8d10757c4ce9b880422e3746897d89b27647febd1f70ab5021f9ac10ade95')
sha256sums_aarch64=('6bb740cdc0f44002dde14df6c9748f5ff3372ff85a2441eeed26948b99073631')
sha256sums_x86_64=('5deccf01a60d4c7e684a914690cf9b22c6e82ed32ede6415083ea2937aac5915')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -rf "usr/share/doc"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  cp -vr --no-preserve=ownership * "${pkgdir}"

  cd "${srcdir}"
  install -vDm644 "PRIVACY-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/PRIVACY.md"
  install -vDm644 "README-${pkgver}.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "TOS-${pkgver}.md"     "${pkgdir}/usr/share/doc/${_pkgname}/TOS.md"
  install -vDm644 "LICENSE-${pkgver}"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vsf "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
