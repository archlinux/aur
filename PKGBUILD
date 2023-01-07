# Maintainer: dreieck

_use_acid_binvariant=win # Valid values: "osx", "win", "linux". The "linux"-variant is outdated (version 1.14 instead 1.16, as of 2023-01-07), use the "win" variant therefore. See https://chdk.setepontos.com/index.php?topic=14659.msg149271#msg149271.

_pkgname="chdk-acid"
pkgname="${_pkgname}-bin"
pkgver=1.16_2007
pkgrel=2
epoch=0
pkgdesc="Tool to identify camera type and firmware version of several Canon compact cameras, and to automatically download the proper CHDK build."
arch=(
  any
)
url="http://www.zenoshrdlu.com/acid/acid.html"
license=(
  'custom: freeware'
)
groups=(
  'chdk'
)
depends=(
  'bash'
  'java-runtime'
)
makedepends=()
checkdepends=()
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "${_pkgname}_${pkgver}.html::${url}"
  "acid.sh"
  "LICENCE_${pkgver}.txt::https://github.com/Brainpowered/ACID/raw/master/LICENCE.txt"
)
noextract=()
sha256sums=(
  'ca9dc069e808add5abda05e30409967e081a6632ed3a53b2edbfc66210762d41'
  'd085fabf9a971e57251b852b3d26f00d196be29474993e09616800a672dec68e'
  'e7468438ac7a9fa27d398d3180bc4ce9b035178b776be8136aea5bfbfa4de62b'
)

case "${_use_acid_binvariant}" in
  'osx')
    source+=("acid_${pkgver}.dmg::http://www.zenoshrdlu.com/acid/acid.dmg")
    sha256sums+=('2c9b938e3d52d0cc643e2c575d1cfda413a45a11f2341af775060d3a8967e2f0')
    error "value '${_use_acid_binvariant}' of variable '\$_use_acid_binvariant' currently not supported. Aborting."
    false
  ;;
  'win')
    source+=("acid_${pkgver}.zip::http://www.zenoshrdlu.com/acid/acid.zip")
    sha256sums+=('3c335e1c6cc42fb511910b1268c43135c00fbbe33214a8a19775963a1e5635da')
  ;;
  'linux')
    source+=("acid_${pkgver}.tar.gz::http://www.zenoshrdlu.com/acid/acid.tar.gz")
    sha256sums+=('a370f40471d9c92b4c06d50555099e10c9566ce6250f98bbad6c6c08de31d987')
  ;;
  *)
    error "Unsupported value '${_use_acid_binvariant}' of variable '\$_use_acid_binvariant'. Aborting."
    false
  ;;
esac

validpgpkeys=()


prepare() {
  printf '%s\n' "${url}" > "${srcdir}/website.url"
}

package() {
  case "${_use_acid_binvariant}" in
    'osx')
      error "value '${_use_acid_binvariant}' of variable '\$_use_acid_binvariant' currently not supported. Aborting."
      false
    ;;
    'win')
      install -v -m644 -D "${srcdir}/acid/acid.jar"          "${pkgdir}/usr/lib/acid/acid.jar"
    ;;
    'linux')
      install -v -m644 -D "${srcdir}/acid/acidu.jar"         "${pkgdir}/usr/lib/acid/acid.jar"
    ;;
    *)
      error "Unsupported value '${_use_acid_binvariant}' of variable '\$_use_acid_binvariant'. Aborting."
      false
    ;;
  esac
  install -v -m755 -D "${srcdir}/acid.sh"                    "${pkgdir}/usr/bin/acid"

  install -v -m644 -D "${srcdir}/${_pkgname}_${pkgver}.html" "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}.html"
  install -v -m644 -D "${srcdir}/website.url"                "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
  install -v -m644 -D "${srcdir}/LICENCE_${pkgver}.txt"      "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -sfv "/usr/share/licenses/${pkgname}/COPYING.txt"       'COPYING.txt'
}
