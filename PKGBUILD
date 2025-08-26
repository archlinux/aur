# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=clawpack
pkgname=python-${_base}
pkgdesc="Finite volume methods for hyperbolic conservation laws"
pkgver=5.13.0
pkgrel=1
arch=(x86_64)
url="https://www.${_base}.org"
license=(BSD-3-Clause)
depends=(python-matplotlib)
makedepends=(python-build python-installer meson-python python-wheel gcc-fortran git)
optdepends=('petsc: for petclaw support'
  'python-scipy: for euler support')
source=(${_base}-${pkgver}::git+https://github.com/${_base}/${_base}.git#tag=v${pkgver}
  github.com-clawpack-amrclaw::git+https://github.com/${_base}/amrclaw.git#commit=6ffd3aa1a9d99607a5ac0a7a6fc45a96017fb6a3
  github.com-clawpack-classic::git+https://github.com/${_base}/classic.git#commit=b89c96df32bbf3e00738baea54a7dd78a6c00318
  github.com-clawpack-clawutil::git+https://github.com/${_base}/clawutil.git#commit=5d37867f75543d03baebfc0aee98df02edc3bdb1
  github.com-clawpack-geoclaw::git+https://github.com/${_base}/geoclaw.git#commit=d26daee266c08485c6ea6f5671d1a45044fc5d04
  github.com-clawpack-pyclaw::git+https://github.com/${_base}/pyclaw.git#commit=de24cc83a3e988e2dedab8147df6a987fdae0477
  github.com-clawpack-riemann::git+https://github.com/${_base}/riemann.git#commit=3f529f0f5cbfb87343bc289c31e2b48193785687
  github.com-clawpack-visclaw::git+https://github.com/${_base}/visclaw.git#commit=c6a13abfecf94e8e5ba8fd6594de22e2cd95e2ae)
sha512sums=('35d76b7ddd60c02a6d4bb597129300a38a27e8aaeab717a60c1c32ee5df6a9fa9e8ce4889ee2e6e213b5d655d96498b0d0b055566f9a14782a5da7a891cc8440'
            '83da13e69a4d4a0b566068156fdb0b2ab7b05fd46b2cd8c6d4374d97c5a5e99cfd48a9c21b58c91d2b8695f730d02fd822779c75cdcce1ca8c2f20fc2a1800d2'
            '3924882cb020d598f795eedf527ee9fcca392900c8401794e9d7eb1c8b23912a25664f0c891da4b4d43521072cac9fceb2f0569245b24efe5d30255ab02d6af4'
            '15139ef522d279c079e7fdd94d5d70abffb63d10348b8148e0d4dbfdf806596c058d90756916071d82087a96230946ab7cd0948348cbfc1a345d4f1aee4a66c2'
            'e7ded10018b774c800e75cd4d31fa42543cddfcc95bc4b32fc41e631ca498b1369f54999c00984ae45b12e25f649728c7766e8782999c26110a37d2273ed4e7a'
            '135dbbe0f5a194c4f4f6c1b8ee9d4990171c6c754af7974a5aa82a57062e92fbee8b57562cd9570b09ddfc53f07f66c7f300bf3a6ecccb48d10d1ae9fc18e63e'
            '2f19bbf668fa575afe95c2ebbfcdc21fdcaf6de3ade6818941ddd4097d4ba2ac483a10a2b9bd2c1373c15d80be3c1710432f2d6a29af0d61793cbf775382258a'
            'f41b69cf6da9c269e43535eed8e2f9a6700f414dc5664e2e9d14b688f1c46a3e4cff2d8b948d26b7d5a1c0543a30665cceebb0993b4b91f6b6713b2a72a4424b')

prepare() {
  cd ${_base}-${pkgver}
  sed -i 's/..\//https:\/\/github.com\/clawpack\//' .gitmodules
  git submodule init
  git config submodule.third_party/amrclaw.url "${srcdir}/github.com-clawpack-amrclaw"
  git config submodule.third_party/classic.url "${srcdir}/github.com-clawpack-classic"
  git config submodule.third_party/clawutil.url "${srcdir}/github.com-clawpack-clawutil"
  git config submodule.third_party/geoclaw.url "${srcdir}/github.com-clawpack-geoclaw"
  git config submodule.third_party/pyclaw.url "${srcdir}/github.com-clawpack-pyclaw"
  git config submodule.third_party/riemann.url "${srcdir}/github.com-clawpack-riemann"
  git config submodule.third_party/visclaw.url "${srcdir}/github.com-clawpack-visclaw"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --prefix=/usr --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
