# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="evrouter"
pkgname="${_pkgname}-bin"
pkgver=0.4
pkgrel=1
pkgdesc="An Input Event Router for Linux"
arch=('x86_64' 'i686')
url="https://www.bedroomlan.org/projects/evrouter"
license=('GPL-2.0-or-later')
depends=('glibc' 'libx11' 'libxtst')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,i686}".deb")
source_x86_64=("${_pkgsrc}-x86_64.deb::https://files.bedroomlan.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}_amd64.deb")
source_i686=("${_pkgsrc}-i686.deb::https://files.bedroomlan.org/debian/pool/main/${_pkgname::1}/${_pkgname}/${_pkgsrc//-/_}_i386.deb")
b2sums_x86_64=('a7cd18f664bc8dbf6d0e8666ff68fa47658561da3f0b77600629097bab322b0740e86166723bffd365608a94d7c0c2c5090e41ebc8ac8e16a69ade2b0c9696e6')
b2sums_i686=('bac380b5323531baf1a73613f99f9fb6fdfad31c62000cfd6bbe1141536ed9f193a1a169d6b23bc5edb6c05b435083a7140b593eda208045e4177dfbf0fbbc9d')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_pkgsrc}-${CARCH}.deb" data.tar.*
  bsdtar -xzf data.tar.* --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  rm -f data.tar.*

  cd "${_pkgsrc}-${CARCH}/usr/share"
  mkdir -p "licenses/${_pkgname}"
  mv -f "doc/${_pkgname}/copyright" "licenses/${_pkgname}/COPYRIGHT"

  cd "doc/${_pkgname}"
  rm -f *.Debian*
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  find "usr/bin"   -type f -exec install -Dm755 "{}" "${pkgdir}/{}" \;
  find "usr/share" -type f -exec install -Dm644 "{}" "${pkgdir}/{}" \;
}
