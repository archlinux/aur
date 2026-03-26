# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: koraynilay <koray.fra@gmail.com>

pkgname=compcert
_dirname=CompCert
_testscommit=081175df374260304a5cd78dd3dfaded93dceb41
pkgver=3.17
pkgrel=1
pkgdesc="The formally verified C compiler"
arch=('x86_64')
url="https://compcert.org/"
license=('custom:INRIA Non-Commercial License Agreement')
depends=('gcc')
makedepends=('rocq>=9.0.0' 'rocq-stdlib>=9.0.0' 'ocaml>=4.05.0'
             'ocaml-menhir>=20200624'
             'ocaml-findlib' # See: https://github.com/AbsInt/CompCert/issues/281
            )
checkdepends=('parallel')
source=("https://github.com/AbsInt/$_dirname/archive/v$pkgver.tar.gz"
	"https://github.com/AbsInt/$_dirname-small-tests/archive/$_testscommit.tar.gz")
sha256sums=('671425695c92d6c3a44d9f0833a803a9fa6b9199675a0b10dfdc131a0e2abffa'
	    '20b1c6fd68d3bb3ad49465acba674d231bf0d38412eb69464178110fbb3c8b91')

prepare() {
  cd ${srcdir}/${_dirname}-${pkgver}

  # move tests to folder in main repo
  rmdir --ignore-fail-on-non-empty ${srcdir}/${_dirname}-${pkgver}/test
  mv -nT ${srcdir}/${_dirname}-small-tests-${_testscommit} ${srcdir}/${_dirname}-${pkgver}/test

  # workaround until upstream updates flocq (https://github.com/AbsInt/CompCert/issues/580)
  find flocq -type f -name "*.v" -exec sed -i 's/\bZmod\b/Z.modulo/g' {} +
}

build() {
  cd ${srcdir}/${_dirname}-${pkgver}

  # Some useful options:
  # -clightgen: builds and installs the clightgen tool
  # -install-coqdev: also installs the Coq development, implied by -clightgen, useful
  #   if you will use tools such as the Princeton VST)
  ./configure -ignore-coq-version -ignore-ocaml-version -prefix /usr ${CARCH}-linux

  make all
}

check() {
  cd ${srcdir}/${_dirname}-${pkgver}/test
  make all
  make parallel
}

package() {
  cd ${srcdir}/${_dirname}-${pkgver}
  make DESTDIR=${pkgdir} install
  
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

