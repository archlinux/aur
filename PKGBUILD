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
pkgver='2.2.1'
_binver='2.1.1'; _binhash='17372d86935f7541ae0bc7ff0b9eebb721af0cb0' # version 2.1
pkgrel=1
pkgdesc='Coherent PDF and smpdf to manipulate PDF files including merge, encrypt, decrypt, scale, crop, rotate, bookmarks, stamp, logos, page numbers'
arch=('x86_64' 'i686')
url='http://community.coherentpdf.com'
license=('custom')
depends=('camlpdf>=2.2')
makedepends=('ocaml' 'ocaml-findlib')
conflicts=('cpdf-bin') # temporary
options=('!makeflags' 'staticlibs')

#_srcdirmast="${_pkgname}-binaries-master"; _srcmastname="${_srcdirmast}"
_srcdirmast="${_pkgname}-binaries-${_binhash}"; _srcmastname="${_pkgname}-binaries-${_binver}.tar.gz"
unset _binhash _binver

_srcfile="v${pkgver}"
#_srcfile='master'
#_srcfile='8d1ee91bd2390a6eacbc087983d8afec263182db'
_srcdir="${_pkgname}-source-${_srcfile#v}"; _srcdirname="${_srcdir}"

_giturl="https://github.com/johnwhitington/${_pkgname}-source"
_verwatch=("${_giturl}/releases.atom" "\s\+<title>v\([^<]\+\)</title>.*" 'f') # RSS
source=(
  "${_srcmastname}.tar.gz::https://github.com/coherentgraphics/cpdf-binaries/archive/${_srcdirmast##*-}.tar.gz"
  "${_srcdirname}.tar.gz::${_giturl}/archive/${_srcfile}.tar.gz"
)
unset _srcfile _srcmastname _srcdirname
sha256sums=('55a0de2b225413d7cda3784e6336f40f707a31b8f018c1cd24a8396df9dda65f'
            '304877313312859fb4155091548bfb47295798367aeddb1d93f6640640335006')

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
  sed -e "s:cpdfmanual.pdf:/usr/share/doc/${_pkgname}/&:g" -i "${pkgdir}/usr/share/man/man1/cpdf.1"
  install -Dpm644 'cpdfmanual.pdf' -t "${pkgdir}/usr/share/doc/${_pkgname}/"

  install -Dpm644 "${srcdir}/${_srcdirmast}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  set +u
}
set +u
