# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# From camlpdf
# Contributor: oliver < a t >  first . in-berlin . de
# From cpdf-bin
# Contributor: 2ion <dev@2ion.de>

# From the author:
# If downloading from Github, obtain the correct source.
# This means choosing the tag for a particaular version, such as "v2.1.1".
# The head of the master branch is unstable.

# This means no git version unless you are really into development.

# TODO: Build smpdf when the sources become available.
# TODO: Remove conflicts when cpdf-bin is fixed

# cpdf-bin
# TODO: Change conflicts and provides
# TODO: Add depends camlpdf

set -u
_pkgname='cpdf'
pkgname="${_pkgname}"
pkgver=2.1.1
pkgrel=1
pkgdesc='Coherent PDF and smpdf to manipulate PDF files including merge, encrypt, decrypt, scale, crop, rotate, bookmarks, stamp, logos, page numbers'
arch=('x86_64' 'i686')
license=('custom')
url="http://community.coherentpdf.com"
depends=('camlpdf')
makedepends=('coreutils' 'binutils') # install, strip
makedepends+=('ocaml' 'ocaml-findlib')
options=('!makeflags' 'staticlibs')
conflicts=('cpdf-bin') # temporary
_srcdir="${_pkgname}-source-${pkgver}"
_srcdirmast="${_pkgname}-binaries-master"
_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${_pkgname}-source-v${pkgver}.tar.gz::https://github.com/johnwhitington/${_pkgname}-source/archive/v${pkgver}.tar.gz"
        "${_srcdirmast}.zip::https://github.com/coherentgraphics/cpdf-binaries/archive/master.zip")
sha256sums=('00a3c8b6f1ff60feff7d0b72c095befb576c08edc35ffee28a4d3a24ad599956'
            'd76999dc379f5bc74c20f3938d0a6bb41c4e4c6ca8042c29ac8bb3c1df9a0e2b')

_pkgver_disabled() {
  set -u
  cd "${_srcdir}"
  git describe --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"

  make -s OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)" || :
  # A broken make, fixed by running it again.
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  local OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  install -d "${OCAMLFIND_DESTDIR}"
  #local OCAMLFIND_LDCONF="${pkgdir}/$(ocamlfind printconf ldconf)"
  #make install -d OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}" OCAMLFIND_LDCONF="${OCAMLFIND_LDCONF}"
  make install -d OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}" OCAMLFIND_LDCONF="${pkgdir}/$(ocamlfind printconf ldconf)"

  declare -A _arch=([i686]='Linux32' [x86_64]='Linux64')
  install -Dpm755 "${srcdir}/${_srcdirmast}/LosslessPDFCompressor/${_arch[${CARCH}]}/smpdf" -t "${pkgdir}/usr/bin/"
  install -Dpm644 "${srcdir}/${_srcdirmast}/LosslessPDFCompressor/smpdfmanual.pdf" -t "${pkgdir}/usr/share/doc/${_pkgname}/"

  install -Dpm755 'cpdf' -t "${pkgdir}/usr/bin/"
  install -Dpm644 'cpdf.1' -t "${pkgdir}/usr/share/man/man1/"
  sed -i -e "s:cpdfmanual.pdf:/usr/share/doc/${_pkgname}/&:g" "${pkgdir}/usr/share/man/man1/cpdf.1"
  install -Dpm644 'cpdfmanual.pdf' -t "${pkgdir}/usr/share/doc/${_pkgname}/"

  install -Dpm644 "${srcdir}/${_srcdirmast}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  set +u
}
set +u
