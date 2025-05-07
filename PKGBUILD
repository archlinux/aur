# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=clawpack
pkgname=python-${_base}
pkgdesc="Finite volume methods for hyperbolic conservation laws"
pkgver=5.12.0
pkgrel=1
arch=(x86_64)
url="https://www.${_base}.org"
license=(BSD-3-Clause)
depends=(python-matplotlib)
makedepends=(python-build python-installer meson-python python-wheel gcc-fortran git)
optdepends=('petsc: for petclaw support'
  'python-scipy: for euler support')
source=(${_base}-${pkgver}::git+https://github.com/${_base}/${_base}.git#tag=v${pkgver}
  github.com-clawpack-amrclaw::git+https://github.com/${_base}/amrclaw.git#commit=452d485e4032c085d0cc96b97acd054722c38326
  github.com-clawpack-classic::git+https://github.com/${_base}/classic.git#commit=5f178e4c8eb59d6f16f3d21c654b89033bd9be92
  github.com-clawpack-clawutil::git+https://github.com/${_base}/clawutil.git#commit=2f7910a05d81e4463e201c1b92a4168fa692c2b3
  github.com-clawpack-geoclaw::git+https://github.com/${_base}/geoclaw.git#commit=271bea35049d82217c789e41b1de2902d53583d3
  github.com-clawpack-pyclaw::git+https://github.com/${_base}/pyclaw.git#commit=60de625fb28b2e19db828d06db0cc3247109bd24
  github.com-clawpack-riemann::git+https://github.com/${_base}/riemann.git#commit=c29dcab4af30913fc16e4406fe56fe5f0a322b1f
  github.com-clawpack-visclaw::git+https://github.com/${_base}/visclaw.git#commit=44a1d2ea7073ab65c378e945d1bd47bb762e9a5f)
sha512sums=('a8712ff8abb0fe2d65dcea9cf7951b9f97d8d54f1df4a71a86058567b84491b98159c2d64c821f5b0907b38fdcb831d5a8c4abe15ecf20937aa3e2b5a4486b19'
            '2cf3a1cddab3f3be02b3d8606a0fd966ec773ebf0ce53725aebefde5640f2907b5dfca60e238a08c22a5fabeb19de282c607eb25e529dc55d0f89484a6c81e64'
            '4253361752249200665e4d133ad63a99a58087e356803f2bcfa19e18fbaa58899fe5c64123641432221a537e75c97fd68f044b879f16e59d6449e050ddf8b931'
            'ad422f20a87a13b7196f0c8ba1b9cf817d67722ee923f3c1d40b73e76c07592e4b389e5d30417ca89523db97bec4c30e24a75940f1b69782b8f09b5c7734ca4a'
            'ed22745e04e884ef233083ed62c44994e588b50ee7168f21baecf707a7304645eb6712bff3135d5e26ff419c796d20253f299dfc10946ce11a2c1db78d453502'
            '3ecf16c0098f9e344d52980ac877a93829a7e512054d56940c31a977dea9ef30268efbf99a0f9ef3148031cb9c00ac4ae84b3b17c761c525f728a611103732ad'
            'da736dd664e7f360c8ff2538caa6315113118e84643c33d116787f354964ffac1168002fff9d91163cb8546d82607eeef76b402c122f496674817bafabe74375'
            'd3b4435761a61c2ddf9db84c5a8b6b3734a343f95d1cf06dfe412631d8bb1b966168dd91bb8d719791cfcebf63ab08deaf6a2f26267ec7624a8660ab58acb5b3')

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
