# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="bananas"
_electron=31
_pkgname="${_name}-electron"
pkgname="${_pkgname}-bin"
pkgver=0.0.22
pkgrel=1
pkgdesc="Simple peer-to-peer screen sharing tool without account or server requirements"
arch=('any') # 'aarch64' 'x86_64'
url="https://getbananas.net"
_url="https://github.com/mistweaverco/${_name}"
license=('MIT')
depends=("electron${_electron}" 'hicolor-icon-theme' 'sh')
provides=("${_name}" "${_pkgname}")
conflicts=("${_name}" "${_pkgname}")
_pkgsrc="${_name}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.deb") # "${_pkgsrc}-"{aarch64,x86_64}".deb"
source=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_name}_amd64.deb"
        "${_pkgsrc}-PRIVACY.md::${_url}/raw/refs/tags/v${pkgver}/PRIVACY.md"
        "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-TOS.md::${_url}/raw/refs/tags/v${pkgver}/TOS.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${_name}.sh")
# source_aarch64=("${_pkgsrc}-aarch64.deb::${_url}/releases/download/v${pkgver}/${_name}_arm64.deb")
# source_x86_64=("${_pkgsrc}-x86_64.deb::${_url}/releases/download/v${pkgver}/${_name}_amd64.deb")
sha256sums=('5deccf01a60d4c7e684a914690cf9b22c6e82ed32ede6415083ea2937aac5915'
            '1bcc3ce508ea630cdcc5af73391e808cd01dd41c7103a4472432353516cfca35'
            '8021f9b84c9e165d85e14a72a3d1e61fb7957652a6a462e9ea88b8030b5d32c4'
            '9d7bf83149732ec4d2fdaaadf95fc09846109e1ccc1c62fc27a409caa924714c'
            '5ba8d10757c4ce9b880422e3746897d89b27647febd1f70ab5021f9ac10ade95'
            'caa798b1fc3c0da7f726dc9bd716a10c1a94c25822bd7d5f0e4ea54dff2692b6')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-x86_64"
  bsdtar -xf "${_pkgsrc}-x86_64.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-x86_64"
  rm -f data.tar.*
}

build() {
  cd "${srcdir}"
  sed -e "s|@electronversion@|${_electron}|g" \
      -e "s|@appname@|${_name}|g" \
      -e "s|@runname@|app.asar|g" \
      -e "s|@cfgdirname@|${_name}|g" \
      -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
      -i "${_name}.sh"

  cd "${_pkgsrc}-x86_64"
  mkdir -p "usr/lib/${_name}"
  mv -f "opt/${_name}/resources/app.asar" "usr/lib/${_name}/app.asar"
  rm -rf "opt"

  cd "usr"
  rm -rf "bin"
  
  cd "share"
  rm -rf "doc"

  cd "applications"
  sed -i "s|/opt/${_name}/||g" "${_name}.desktop"
}

package() {
  cd "${srcdir}"
  cp -vr --no-preserve=ownership "${_pkgsrc}-x86_64"/* "${pkgdir}"

  install -vDm755 "${_name}.sh" "${pkgdir}/usr/bin/${_name}"

  install -vDm644 "${_pkgsrc}-PRIVACY.md" "${pkgdir}/usr/share/doc/${_name}/PRIVACY.md"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${_name}/README.md"
  install -vDm644 "${_pkgsrc}-TOS.md"     "${pkgdir}/usr/share/doc/${_name}/TOS.md"
  install -vDm644 "${_pkgsrc}-LICENSE"    "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
