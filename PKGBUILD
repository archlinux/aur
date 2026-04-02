# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="evrouter"
pkgname="${_pkgname}-bin"
pkgver=0.4
pkgrel=1
pkgdesc="An Input Event Router for Linux"
arch=(
  'i686'
  'x86_64'
)
url="https://www.bedroomlan.org/projects/evrouter"
license=(
  'GPL-2.0-or-later'
)
depends=(
  'glibc'
  'libx11'
  'libxtst'
)
makedepends=(
  'gzip'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_i686=(
  "https://files.bedroomlan.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgname}_${pkgver}_i386.deb"
)
source_x86_64=(
  "https://files.bedroomlan.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb"
)
noextract=(
  "${source_i686[@]##*/}"
  "${source_x86_64[@]##*/}"
)
b2sums_x86_64=('a7cd18f664bc8dbf6d0e8666ff68fa47658561da3f0b77600629097bab322b0740e86166723bffd365608a94d7c0c2c5090e41ebc8ac8e16a69ade2b0c9696e6')
b2sums_i686=('bac380b5323531baf1a73613f99f9fb6fdfad31c62000cfd6bbe1141536ed9f193a1a169d6b23bc5edb6c05b435083a7140b593eda208045e4177dfbf0fbbc9d')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  mkdir -p "${source_artifact%.deb}"
  bsdtar -xf "${source_artifact}" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${source_artifact%.deb}"
  rm -f data.tar.*

  cd "${source_artifact%.deb}"
  find . -type f -name '*.gz' -exec \
    gzip -fd "{}" \;

  cd "usr/share/doc/${_pkgname}"
  rm -vf changelog* copyright
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  cp -vaT --no-preserve=ownership "${source_artifact%.deb}" "${pkgdir}"
}
