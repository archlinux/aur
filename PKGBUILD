# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=clawpack
pkgname=python-${_base}
pkgdesc="Finite volume methods for hyperbolic conservation laws"
pkgver=5.11.0
pkgrel=1
arch=(x86_64)
url="https://www.${_base}.org"
license=(BSD-3-Clause)
depends=(python-matplotlib)
makedepends=(python-build python-installer meson-python python-wheel gcc-fortran git)
optdepends=('petsc: for petclaw support'
  'python-scipy: for euler support')
source=(${_base}-${pkgver}::git+https://github.com/${_base}/${_base}.git#tag=v${pkgver}
  github.com-clawpack-amrclaw::git+https://github.com/${_base}/amrclaw.git#commit=2d9d07640bcd03890997a7fc250b76ef50321f1d
  github.com-clawpack-classic::git+https://github.com/${_base}/classic.git#commit=5f178e4c8eb59d6f16f3d21c654b89033bd9be92
  github.com-clawpack-clawutil::git+https://github.com/${_base}/clawutil.git#commit=1ee5f67859fab5a71cebdb5f015a0c9d148a74b2
  github.com-clawpack-geoclaw::git+https://github.com/${_base}/geoclaw.git#commit=3303883f46572c58130d161986b8a87a57ca7816
  github.com-clawpack-pyclaw::git+https://github.com/${_base}/pyclaw.git#commit=a16a60959b4aa714384fd94a704d8af79c8278c2
  github.com-clawpack-riemann::git+https://github.com/${_base}/riemann.git#commit=fea00b286c7a9ce64466587ad00c88a1cbcb3b26
  github.com-clawpack-visclaw::git+https://github.com/${_base}/visclaw.git#commit=1fc821c546bcac630fec12cf9edef92e01316f4d)
sha512sums=('4a2eb5e50060146d0bd98dc8b2f3cec25201757771c035be0bb6aae176cf59d19a43ad72ac964bc5e30303c7082ffd64a16cf1989f43e11999c6157cd2f4b3ae'
            'e543bb70d8071657e862f129c6b12822eda6d9898238736cfb631f6d34f45bba3f18784a1e42fd45f7d072799e1713b38e6b354a5a0aa92baeab13362aefef0c'
            '4253361752249200665e4d133ad63a99a58087e356803f2bcfa19e18fbaa58899fe5c64123641432221a537e75c97fd68f044b879f16e59d6449e050ddf8b931'
            '7b9ab9ba5ed31ff2100cab7486054df3edab4cfd37af3d0e75d02ab964a848d900467f0248efc7565242105983c6797b9cc399b7c497c38f8a079a0250bcf388'
            '56645c1adacdcb14ba2e70fc59d3887f157c9423ebcaceb90a01bd7a68af52bc324e33e2e8b7456522edc16407719a51eab91e78e8f2b942875daffd4e15f6a5'
            '224c575a8cd8a4568aa34157dfe55e68f29b05963591b22eda8b257741cf7210aa52ae176325dd941767126515b309e3c6aae94f7b3cdb5e8122f6795c151967'
            '4944c814eda6ab4bf298005dbe75d3d54b44402503789502c6f99823a1a7b22b36d1be10fd08d674b5a9be7b5d72b93b71334d3dceeb255890bcd72a4ae40816'
            '5e4dfb40bda065cd43b5ed302af31cd2e63246772b70cbfad719e821f96a72012fb4a5a45460653f8f536c7836333d67aceb597dbdf1306b1ffeadd277a640fe')

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
