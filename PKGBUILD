# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="fineftp-server"
pkgname="${_pkgname}-bin"
pkgver=1.6.0
pkgrel=1
pkgdesc="Minimal FTP server library for Windows and Unix flavors"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/eclipse-ecal/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
provides=(
  "${_pkgname}"
  "lib${_pkgname}.so"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-ubuntu-24.04_arm64-shared.deb"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-ubuntu-24.04_amd64-shared.deb"
)
noextract=(
  "${source_aarch64[@]##*/}"
  "${source_x86_64[@]##*/}"
)
sha256sums=('ebd76f02867ea8fceeb0b2df629243395551f7d7519055d33c3a3a3ca72e2e25'
            '667c112ec5f73bbbc6de0c87495b37d4ca68d52ff9a7f13af10858b93ae88438')
sha256sums_aarch64=('779312ed95a16b58a165bd3482c4431f54532ba3d17e1addf7d75b6062529ac9')
sha256sums_x86_64=('c60cb01f287ee2a8926e632f37153c02508c692db090670862f05c4ce1c06449')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  mkdir -p "${source_artifact%.deb}"
  bsdtar -xf "${source_artifact}" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${source_artifact%.deb}"
  rm -f data.tar.*
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  cp -vaT --no-preserve=ownership "${source_artifact%.deb}" "${pkgdir}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
