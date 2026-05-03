# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="inthecube"
pkgname="${_pkgname}-bin"
pkgver=89
_commit="0d1a22b8ee36128895f7f5780278768190619bd0" # 89
pkgrel=2
pkgdesc="A tiny cube in a giant maze. Platform/puzzle game."
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'powerpc64le'
  'x86_64'
)
url="https://arthursonzogni.com/en/InTheCube/"
_url="https://github.com/ArthurSonzogni/InTheCube"
license=(
  'MIT'
)
depends=(
  'glibc'
  'libgcc'
  'libglvnd'
  'libstdc++'
  'libx11'
)
makedepends=(
  'squashfs-tools'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/${_commit}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/${_commit}/LICENSE"
)
# https://askubuntu.com/a/1196449
source_aarch64=(
  "https://api.snapcraft.io/api/v1/snaps/download/ffE6WWnxg1lDprAggJxGUGwlLQjaQQnQ_1148.snap"
)
source_armv7h=(
  "https://api.snapcraft.io/api/v1/snaps/download/ffE6WWnxg1lDprAggJxGUGwlLQjaQQnQ_1147.snap"
)
source_i686=(
  "https://api.snapcraft.io/api/v1/snaps/download/ffE6WWnxg1lDprAggJxGUGwlLQjaQQnQ_1136.snap"
)
source_powerpc64le=(
  "https://api.snapcraft.io/api/v1/snaps/download/ffE6WWnxg1lDprAggJxGUGwlLQjaQQnQ_1146.snap"
)
source_x86_64=(
  "https://api.snapcraft.io/api/v1/snaps/download/ffE6WWnxg1lDprAggJxGUGwlLQjaQQnQ_1145.snap"
)
sha384sums=('14edd041ed4dd9e5aa5d8c6b4d2f340b78b3c3ef5bfd7e995762c0d34ab98d25b719358a99e8b089dac5b58ce54186e4'
            '4359b6622c1716dc73b3cdb3840bf9153837c6245c71f1f8274edcaed2d6ade6bc6f1d4f6b64bea3faaa5c8c628bd0bc')
sha384sums_aarch64=('faaf0d32b068c43cea835f670b78a70e4ba597ec736e8f1e5f2880084ff6918cf7da0a4af7be708bd3d267f1e72c0af5')
sha384sums_armv7h=('7f431e221389bf5cafe680f59bfa5530c7fe7ff86f0425905f1f9bcfa5d1a067fe26ebb0f5a032a07175dca6cb33ae74')
sha384sums_i686=('4db93c8e5e83432cc63fd2272b94c86fb60c83a315d83ecd3711e777370c269f63b4422e1a9032f5ac36a12d5c884d5f')
sha384sums_powerpc64le=('3f97d16bf51658ec5d09bc8a3b077e60b32a52c88fa69063f0fedc41db9ea9977201015ad3112e71b062d73cd43a8b5f')
sha384sums_x86_64=('40920d3efc67fdd183c2bc580912d5212492cd15f8730820cc38383f19d1cc38b36582bfae03cf31e8e06a74e6d1d176')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${source_artifact%.snap}" "${source_artifact}"

  cd "${source_artifact%.snap}/meta/gui"
  sed -e "s|^Icon=.*|Icon=${_pkgname}|g" \
      -i "${_pkgname}.desktop"
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  
  cd "${source_artifact%.snap}"
  install -vDm755 "usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cp -va --parents --no-preserve=ownership "usr/share/${_pkgname}" -t "${pkgdir}"

  cd "meta/gui"
  install -vDm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -vDm644 "${_pkgname}.png"     "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
