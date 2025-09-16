# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=clawpack
pkgname=python-${_base}
pkgdesc="Finite volume methods for hyperbolic conservation laws"
pkgver=5.13.1
pkgrel=2
arch=(x86_64)
url="https://www.${_base}.org"
license=(BSD-3-Clause)
depends=(python-matplotlib)
makedepends=(python-build python-installer meson-python python-wheel gcc-fortran git)
optdepends=('petsc: for petclaw support'
  'python-scipy: for euler support')
source=(${_base}-${pkgver}::git+https://github.com/${_base}/${_base}.git#tag=v${pkgver}
  github.com-clawpack-amrclaw::git+https://github.com/${_base}/amrclaw.git#commit=686c73304d1f442cbd6e0b37eea0b4648151da91
  github.com-clawpack-classic::git+https://github.com/${_base}/classic.git#commit=b89c96df32bbf3e00738baea54a7dd78a6c00318
  github.com-clawpack-clawutil::git+https://github.com/${_base}/clawutil.git#commit=336e422f9cfca7c4cf659bc5ffcb694ee4e234eb
  github.com-clawpack-geoclaw::git+https://github.com/${_base}/geoclaw.git#commit=6b765c7da750172328a6654977fa478d73a9a0c7
  github.com-clawpack-pyclaw::git+https://github.com/${_base}/pyclaw.git#commit=885407160cd85737289ef0685e6175c86de03bd1
  github.com-clawpack-riemann::git+https://github.com/${_base}/riemann.git#commit=3f529f0f5cbfb87343bc289c31e2b48193785687
  github.com-clawpack-visclaw::git+https://github.com/${_base}/visclaw.git#commit=c6a13abfecf94e8e5ba8fd6594de22e2cd95e2ae)
sha512sums=('a5e47de472989730511b5e7795e5ea4180865bc5b38f6518a92bcc7e7275f4e779400809067d8e6f1d15a98930a95a757ccf516b3a185c390fc91e719164d006'
  '8dca151325f8f9ab1083b4a57ece24ef06e41b7a83eebbb3437dd2981f820387cd0aaaa5a611b86d00de77fb1c4ffca138ff825c5e77832ddd5ac32a878e6b83'
  '3924882cb020d598f795eedf527ee9fcca392900c8401794e9d7eb1c8b23912a25664f0c891da4b4d43521072cac9fceb2f0569245b24efe5d30255ab02d6af4'
  '9f7359df2c8113771789777247926eee5e055aafd7c1dfd363c8dfad35a723d565d0695818b26623c7c639b8157e0b9aff911081361fc168fdaace06f9c9ff63'
  '3f00dabc5930c675e55430df0246db1e30a3d30f1ba6249072b2a277c7dff2ac7d41bc7eb8e028b4d7072b45383712d2aefc553e18b409ba4563b9acf0f4d6f8'
  '1b27d7cf616fb1f300ac6c82a5879975fee7a4dd8bee80748d34819b17087b0d214276395486457c94fef690b664c52dcefb78ec1b7e4edecc2cc105c883395d'
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
