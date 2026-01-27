# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=clawpack
pkgname=python-${_base}
pkgdesc="Finite volume methods for hyperbolic conservation laws"
pkgver=5.14.0
pkgrel=1
arch=(x86_64)
url="https://www.${_base}.org"
license=(BSD-3-Clause)
depends=(python-matplotlib)
makedepends=(python-build python-installer meson-python python-wheel gcc-fortran git)
optdepends=('petsc: for petclaw support'
  'python-scipy: for euler support')
source=(${_base}-${pkgver}::git+https://github.com/${_base}/${_base}.git#tag=v${pkgver}
  github.com-clawpack-amrclaw::git+https://github.com/${_base}/amrclaw.git#commit=98ba14a90986943846a1c019f0cbad82765a60f1
  github.com-clawpack-classic::git+https://github.com/${_base}/classic.git#commit=b89c96df32bbf3e00738baea54a7dd78a6c00318
  github.com-clawpack-clawutil::git+https://github.com/${_base}/clawutil.git#commit=807d01379a1d4fb47f3e4f355dd74b85afd6a4bd
  github.com-clawpack-geoclaw::git+https://github.com/${_base}/geoclaw.git#commit=11479f675dd8bb19066a2430c28206999cebf299
  github.com-clawpack-pyclaw::git+https://github.com/${_base}/pyclaw.git#commit=885407160cd85737289ef0685e6175c86de03bd1
  github.com-clawpack-riemann::git+https://github.com/${_base}/riemann.git#commit=789c2b0d2d91694f715dcffed8ce0990871c465b
  github.com-clawpack-visclaw::git+https://github.com/${_base}/visclaw.git#commit=89aaa1ac760ae15759ca6d14b01136ee8bbaadf5)
sha512sums=('3bd0bb0fd77cc0e1ca00ad708903dc456dd04ab75dfb05188f34f66966be62a1f0e1e00c0a3ba76a158d491f03446a36c6eb15315642c4b97c4d8717555f6284'
            '5eb2325771e52cd2b8d1926e7c079dce61adfbd171a19387111031ea8e53c47bf1165c3141dbd2ae803cb8fca1da843440af2eca1d7623558f7da195172aec7b'
            '3924882cb020d598f795eedf527ee9fcca392900c8401794e9d7eb1c8b23912a25664f0c891da4b4d43521072cac9fceb2f0569245b24efe5d30255ab02d6af4'
            'bfd629a7139101bad86c37057307e2cbefbab8121a9e2b37fc9b99a9c6f07dc1dd9f6341c16a2ea97fb5097800815981682070cc160878739727cf646474b00a'
            '9dfde9905591ac6dad56c205866290214fa2df37a7a96a51d7fbd337bca55b9f32bd92bc6905b23f2c2d3cd1c657aac875550d37368c9de876cfd6199bb3b1ee'
            '1b27d7cf616fb1f300ac6c82a5879975fee7a4dd8bee80748d34819b17087b0d214276395486457c94fef690b664c52dcefb78ec1b7e4edecc2cc105c883395d'
            '2d9106553508260399a64fd57c0e538030e79db1597af7728062e5af23fe43c3e07c7bafd875b86217cbfb2c0462f97c687d8cf6ebf54c2d3b9af1f4140fd3b8'
            '73b711740834a20084c70676669d759725b1efc60a7bd4c5a858523372e990e771eaa499c252b64c4cfc701c12bc3d27107bac7658bddbd81619a006053233c7')

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
  # install tutorials
  install -d ${pkgdir}/usr/share/${pkgname}/amrclaw
  install -d ${pkgdir}/usr/share/${pkgname}/classic
  install -d ${pkgdir}/usr/share/${pkgname}/clawutil
  install -d ${pkgdir}/usr/share/${pkgname}/geoclaw
  cp -r ${srcdir}/github.com-clawpack-amrclaw/examples ${pkgdir}/usr/share/${pkgname}/amrclaw
  cp -r ${srcdir}/github.com-clawpack-classic/examples ${pkgdir}/usr/share/${pkgname}/classic
  cp -r ${srcdir}/github.com-clawpack-clawutil/examples ${pkgdir}/usr/share/${pkgname}/clawutil
  cp -r ${srcdir}/github.com-clawpack-geoclaw/examples ${pkgdir}/usr/share/${pkgname}/geoclaw
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
