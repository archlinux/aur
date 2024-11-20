# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="clant"
pkgver=1.1.0
_commit="e0bf66dba64daa9856ec79022bba31669e07344d" # 1.1.0
pkgrel=1
pkgdesc="A fast and easy to use wrapper script for checking C and C++ code with the clang-based tools"
arch=('any')
url="https://gitlab.com/drobilla/${pkgname}"
license=('ISC')
makedepends=('python-build' 'python-installer' 'python-wheel'
             'python-setuptools')
depends=('clang' 'include-what-you-use' 'python')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/-/archive/${_commit}/${_commit}.tar.gz"
        "${pkgname}_fix_f-string_syntax.patch")
sha256sums=('5327f788ab42874898d188d30926ef3e46d828a82b8b850d8d58cd6d0764817b'
            'd48fc17a8ac9da82ce718c3f3660158fe9fdcd32df5154864a55dd88a31be9ee')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "../${pkgname}_fix_f-string_syntax.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/${pkgname}-${pkgver}.dist-info/LICENSE" "LICENSE"
}
