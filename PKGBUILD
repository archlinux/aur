# Maintainer: dreieck

_pkgname="pom-perl"
pkgname="${_pkgname}"
pkgver="0.14"
pkgrel="4"
pkgdesc="Displays the phase of the moon. Perl re-write of bsd-games's 'pom'."
arch=('any')
url="http://metacpan.org/pod/distribution/ppt/bin/pom"
depends=('perl')
conflicts=(
  "pom"
)
replaces=("pom<=0.14-1")
provides=("pom=${pkgver}")
license=('GPL2')
source=(
  "http://cpan.metacpan.org/authors/id/C/CW/CWEST/ppt-${pkgver}.tar.gz"
  "http://cpan.metacpan.org/authors/id/C/CW/CWEST/ppt-${pkgver}.readme"
  "pom-no-warnings.patch::http://ix.io/2ktg"
)

sha256sums=(
  'f3587f21905e47b6d33489ca83f5f424d873ba8432118e965dcefb6d681b7f19'
  '536f28272b8a0218e219a55621322ec1ebc080440770fbf206650951df76d287'
  '3d79a537c30b24e420d3bc97b895f1aa1918df0a4e51a3dc3fd9492cc024c334'
)

prepare() {
  cd "${srcdir}/ppt-${pkgver}"
  for _patch in 'pom-no-warnings.patch'; do
    msg2 "Applying patch ${_patch} ..."
    patch -N -p1 --follow-symlinks -i "${srcdir}/${_patch}"
  done
}

build()
{
  cd "${srcdir}/ppt-${pkgver}"

  perl Makefile.PL PREFIX=/usr
  make || exit "$?"

  cd blib/man1
  gzip -9 -v -c pom.1p > pom.1.gz
}

package()
{
  cd "${srcdir}/ppt-${pkgver}"

  _instdir="/usr/bin"
  _docinstdir="/usr/share/doc/${_pkgname}"
  _maninstdir="/usr/share/man"

  ### Only install 'pom'.
  install -v -D -m755 "bin/pom" "${pkgdir}/${_instdir}/pom"

  install -v -D -m644 "${srcdir}/ppt-${pkgver}.readme" "${pkgdir}/${_docinstdir}/ppt-${pkgver}.readme"
  cp -av html/commands/pom "${pkgdir}/${_docinstdir}/html"
  chmod 644 "${pkgdir}/${_docinstdir}/html"/*

  install -v -D -m644 blib/man1/pom.1.gz "${pkgdir}/${_maninstdir}/man1/pom.1.gz"
}
