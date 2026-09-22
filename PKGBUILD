# Maintainer: dreieck

_pkgname="pom-perl"
pkgname="${_pkgname}"
pkgver="1.053"
pkgrel="1"
pkgdesc="Displays the phase of the moon. Perl re-write of bsd-games's 'pom'."
arch=('any')
url="https://metacpan.org/dist/PerlPowerTools/view/bin/pom"
depends=('perl')
conflicts=(
  "pom"
)
replaces=("pom<=0.14-1")
provides=("pom=${pkgver}")
license=('Artistic-1.0-Perl')
source=(
  "https://cpan.metacpan.org/authors/id/B/BR/BRIANDFOY/PerlPowerTools-${pkgver}.tar.gz"
  "https://cpan.metacpan.org/authors/id/B/BR/BRIANDFOY/PerlPowerTools-${pkgver}.readme"
  #"pom-no-warnings.patch::http://ix.io/2ktg"
)

sha256sums=(
  '38bb7598a92b1ecb364478f5945a7926046846b9a34a8032e3dcb8de0662c76a'
  '03d912cb652f3b9a4f2243af0a35fdb2f9880cb6c94ab59c7a45c944fbc33f92'
  #'3d79a537c30b24e420d3bc97b895f1aa1918df0a4e51a3dc3fd9492cc024c334'
)

prepare() {
  cd "${srcdir}/PerlPowerTools-${pkgver}"
  #for _patch in 'pom-no-warnings.patch'; do
  #  msg2 "Applying patch ${_patch} ..."
  #  patch -N -p1 --follow-symlinks -i "${srcdir}/${_patch}"
  #done
}

build()
{
  cd "${srcdir}/PerlPowerTools-${pkgver}"

  perl Makefile.PL INSTALL_BASE=/usr
  make || exit "$?"

  cd blib/man1
  gzip -9 -v -c pom.1p > pom.1.gz
}

package()
{
  cd "${srcdir}/PerlPowerTools-${pkgver}"

  _instdir="/usr/bin"
  _docinstdir="/usr/share/doc/${_pkgname}"
  _maninstdir="/usr/share/man"

  ### Only install 'pom'.
  install -v -D -m755 "bin/pom" "${pkgdir}/${_instdir}/pom"

  install -v -D -m644 "${srcdir}/PerlPowerTools-${pkgver}.readme" "${pkgdir}/${_docinstdir}/PerlPowerTools-${pkgver}.readme"

  #cp -av html/commands/pom "${pkgdir}/${_docinstdir}/html"
  #chmod 644 "${pkgdir}/${_docinstdir}/html"/*

  install -v -D -m644 blib/man1/pom.1.gz "${pkgdir}/${_maninstdir}/man1/pom.1.gz"
}
