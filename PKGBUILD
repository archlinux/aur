# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="clant"
pkgver=2.0.0
_commit="24322a1507d60b4a380f56ca5918a221e1b64331" # 2.0.0
pkgrel=1
pkgdesc="A fast and easy to use wrapper script for checking C and C++ code with the clang-based tools"
arch=('any')
url="https://gitlab.com/drobilla/${pkgname}"
license=('ISC')
depends=('clang' 'include-what-you-use' 'python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
_pkgsrc="${pkgname}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/-/archive/${_commit}/${_commit}.tar.gz")
sha256sums=('3fde44115aff65034dbee5dd2cf99bcef9d065911b3695ed1a2cf9edc50a9247')

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${pkgname}-${pkgver}.dist-info/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
