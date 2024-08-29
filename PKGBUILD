# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="n2"
_pkgname="python-${_name}"
pkgname="${_pkgname}-git"
pkgver=0.1.7.r27.g20b02de
pkgrel=1
pkgdesc="A lightweight approximate Nearest Neighbor library"
arch=('x86_64')
url="https://github.com/kakao/${_name}"
license=('Apache-2.0')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools>=18' 'boost' 'cython' 'eigen' 'spdlog')
checkdepends=('python-nose')
depends=('gcc-libs' 'fmt' 'glibc' 'python')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_name}"
source=("${_pkgsrc}::git+${url}.git"
        "${_pkgname}_fix_libfmt_linking.patch" 
        # https://github.com/gabime/spdlog/issues/1514#issuecomment-612900556
        "${_pkgname}_fix_spdlog1.patch")
sha256sums=('SKIP'
            '7d91e614d0375942c645d4a4bd0c8a23de5f2db3f69066d12d538f6f470f87db'
            '4ac4fd901ccfa9c3219adba6a7373fc3fa25f9494c372e4fd989b9fdb6d03696')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_pkgsrc}" clean -dfx

  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${_pkgname}"*".patch"; do
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

  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
  install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver%%.r*}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver%%.r*}.dist-info/NOTICE.md" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/NOTICE.md"
  ln -s "${pkgdir}${site_packages}/${_name}-${pkgver%%.r*}.dist-info/AUTHORS.md" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/AUTHORS.md"
}
