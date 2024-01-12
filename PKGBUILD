# Maintainer: Xuanrui Qi <me@xuanruiqi.com>

pkgname=compcert
_dirname=CompCert
pkgver=3.13.1
pkgrel=1
pkgdesc="The formally verified C compiler"
arch=('x86_64')
url="http://compcert.inria.fr"
license=('custom:INRIA Non-Commercial License Agreement')
depends=('gcc')
makedepends=('coq>=8.12.0' 'ocaml>=4.05.0'
             'ocaml-menhir>=20190626'
             'ocaml-findlib' # See: https://github.com/AbsInt/CompCert/issues/281
            )
checkdepends=('parallel')
source=("https://github.com/AbsInt/CompCert/archive/v$pkgver.tar.gz")
sha256sums=('c4314b358962240bf3e014b0caf3f7ef620a1b9a1af6abbc639a7181c3895b20')

prepare() {
  cd ${srcdir}/${_dirname}-${pkgver}
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

