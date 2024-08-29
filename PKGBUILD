# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="n2"
pkgname="python-${_name}"
pkgver=0.1.7
pkgrel=1
pkgdesc="A lightweight approximate Nearest Neighbor library"
arch=('x86_64')
url="https://github.com/kakao/${_name}"
license=('Apache-2.0')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools>=18' 'boost' 'cython' 'eigen' 'spdlog')
checkdepends=('python-nose')
depends=('gcc-libs' 'fmt' 'glibc' 'python')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${pkgname}_fix_libfmt_linking.patch"
        # https://github.com/gabime/spdlog/issues/1514#issuecomment-612900556
        "${pkgname}_fix_spdlog1.patch")
sha256sums=('387282837c6330d6fd8243ae9133c6ca1cd345d19ec3a5795fbe6219ce972fc7'
            '7d91e614d0375942c645d4a4bd0c8a23de5f2db3f69066d12d538f6f470f87db'
            '4ac4fd901ccfa9c3219adba6a7373fc3fa25f9494c372e4fd989b9fdb6d03696')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

  cd "${srcdir}/${_pkgsrc}"
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}" make test_python
}

package () {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver}.dist-info/NOTICE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.md"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver}.dist-info/AUTHORS.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/AUTHORS.md"
}
