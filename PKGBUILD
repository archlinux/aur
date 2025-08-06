# Maintainer: dreieck

_pkgname=perl-extutils-makemaker-dist-zilla-develop
pkgname="${_pkgname}"
pkgver=0.03
pkgrel=5
pkgdesc='Create bare-bones Makefile.PL files for use with dzil.'
arch=(
  'any'
)
url='https://metacpan.org/pod/ExtUtils::MakeMaker::Dist::Zilla::Develop'
license=(
  'LicenseRef-PerlArtistic'
)
depends=(
  'perl'
  'perl-extutils-makemaker'
)
makedepends=()
checkdepends=()
options+=('!emptydirs')
source=(
  "${_pkgname}-Develop.pm::https://fastapi.metacpan.org/source/DOY/ExtUtils-MakeMaker-Dist-Zilla-Develop-${pkgver}/lib/ExtUtils/MakeMaker/Dist/Zilla/Develop.pm"
  "${_pkgname}-Changes::https://fastapi.metacpan.org/source/DOY/ExtUtils-MakeMaker-Dist-Zilla-Develop-${pkgver}/Changes"
  "${_pkgname}-LICENSE::https://fastapi.metacpan.org/source/DOY/ExtUtils-MakeMaker-Dist-Zilla-Develop-${pkgver}/LICENSE"
  "${_pkgname}-MANIFEST::https://fastapi.metacpan.org/source/DOY/ExtUtils-MakeMaker-Dist-Zilla-Develop-${pkgver}/MANIFEST"
  "${_pkgname}-META.json::https://fastapi.metacpan.org/source/DOY/ExtUtils-MakeMaker-Dist-Zilla-Develop-${pkgver}/META.json"
  "${_pkgname}-META.yml::https://fastapi.metacpan.org/source/DOY/ExtUtils-MakeMaker-Dist-Zilla-Develop-${pkgver}/META.yml"
  "${_pkgname}-Makefile.PL::https://fastapi.metacpan.org/source/DOY/ExtUtils-MakeMaker-Dist-Zilla-Develop-${pkgver}/Makefile.PL"
  "${_pkgname}-README::https://fastapi.metacpan.org/source/DOY/ExtUtils-MakeMaker-Dist-Zilla-Develop-${pkgver}/README"
  "${_pkgname}-dist.ini::https://fastapi.metacpan.org/source/DOY/ExtUtils-MakeMaker-Dist-Zilla-Develop-${pkgver}/dist.ini"
)
sha256sums=(
  '022bbb3e3cb73e8a9b0e57bcd6c38a0ae80192ff4e8a7cb274d3e773b8f786c8'
  'ff48f8c0dec4857abd094c464674609b206343a2a42e319748563418166739a9'
  'a329c5b201efd3f99389fe5b1c468967f7e7226e93066f10f61ae48977c1389c'
  'a2395b2b99228848d916e7cb60a16edaf420c894c44d970e21ea5b26ffd10e2e'
  '5477803b0a221769421f330d49fdd01b3b8d9dbdc8a644c186e4399dc20a5b2c'
  '7a0c5475ec279d71ab4e21e1754c92551ba1af060183ce891157277d856e17c8'
  '2a430248fde84d225114259106e95e933a6e09f583340a5bb1bde6375371b556'
  'e65d429dfca40565f4a978789ae711b7ed983f07d9e6869fb4192a0a52cdce8a'
  'cd305a2f412a6d2c67ec881a19be596e7ed5cb279675eb78444af326a136f679'
)

prepare() {
  cd "${srcdir}"

  mkdir -p build

  cd build
  ## Make local filenames similar to upstream filenames
  for _s in Develop.pm Changes LICENSE MANIFEST META.json META.yml Makefile.PL README dist.ini ; do
    if [ -e "${_s}" ]; then
      rm -f "${_s}"
    fi
    ln -s "../${_pkgname}-${_s}" "${_s}"
  done

  mkdir -p lib/ExtUtils/MakeMaker/Dist/Zilla/
  cat Develop.pm > lib/ExtUtils/MakeMaker/Dist/Zilla/Develop.pm
  perl Makefile.PL
}

build() {
  cd "${srcdir}/build"

  make
}

check() {
  cd "${srcdir}/build"

  make test
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  # remove perllocal.pod and .packlist
  find "${pkgdir}" -name perllocal.pod -delete
  find "${pkgdir}" -name .packlist -delete

  for _docfile in Changes README; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -D -v -m644 "${srcdir}/${_pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}

