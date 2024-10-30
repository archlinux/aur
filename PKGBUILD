# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_name=pyquante2
pkgname=python-${_name}-git
pkgver=r596.fa02f54
pkgrel=1
pkgdesc="Python Quantum Chemistry Reloaded. This is a rewrite of the standard PyQuante program to clean up things that have been nagging me. (git version)"
arch=("i686" "x86_64")
url="https://github.com/rpmuller/pyquante2"
license=("BSD")
depends=("python" "python-numpy" "python-setuptools")
makedepends=("cython"
             "git"
             "python-build"
             "python-installer"
             "python-setuptools"
             "python-wheel")
checkdepends=("python-pytest")
provides=("python-pyquante2")
conflicts=("python-pyquante2")
source=("git+https://github.com/rpmuller/${_name}"
        "cython.patch")
sha256sums=('SKIP'
            'c356b30444728453426f4c2c759d34c6aba1928deec86355c8d2d08160ed1c55')

pkgver() {
  cd "${srcdir}/${_name}"
  printf "r%s.%s" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

prepare() {
  git -C "${srcdir}/${_name}" clean -dfx

  cd "${srcdir}/${_name}"

  patch -p0 -i ../cython.patch
}

build() {
  cd "${srcdir}/${_name}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# check() {
#   cd "${srcdir}/${_name}"

#   # local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
#   # PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}" python -m pytest
#   python -m pytest
# }
