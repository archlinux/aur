# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: koraynilay <koray.fra@gmail.com>

pkgname=compcert
_dirname=CompCert
_testscommit=0a34815caf6bdf6a8a9284b70c869f97daa9536b
pkgver=3.18
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
sha256sums=('564b312b3ed3162f02605f0108feb555bd28fe7a80b97ea269c546bcc60c1cf0'
            'ab95b78c2f5cf9c8f9ac4e9d64f43a5315c7b57312d5dece402fdee1756bd8db')

prepare() {
  cd ${srcdir}/${_dirname}-${pkgver}

  # move tests to folder in main repo
  rmdir --ignore-fail-on-non-empty ${srcdir}/${_dirname}-${pkgver}/test
  mv -nT ${srcdir}/${_dirname}-small-tests-${_testscommit} ${srcdir}/${_dirname}-${pkgver}/test
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

