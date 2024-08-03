# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="python-bertini_real"
pkgname="${_pkgname}-git"
pkgver=r1517.58a8faa
pkgrel=1
pkgdesc="Python interface for Bertini_real"
arch=('any')
url="http://www.bertinireal.com/"
_url="https://github.com/ofloveandhate/bertini_real"
license=('custom:Bertini license')
makedepends=('git' 'python' 'python-setuptools')
depends=('bertini_real' 'python' 'python-numpy' 'python-scipy' 'python-sympy'
         'python-matplotlib' 'python-algopy' 'python-trimesh' 'python-dill')
optdepends=('python-glumpy: for OpenGL-accelerated rendering of surfaces')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="bertini_real"
source=("${_pkgsrc}::git+${_url}.git"
        "${_pkgname}_fix_package_data.patch")
sha256sums=('SKIP'
            '0c1eb85a33d8bd36d71f7b1455da0e643dd4ebd7022dee1d49d4e5d34cf72dc4')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}/python"
  patch -p1 -i "${srcdir}/${_pkgname}_fix_package_data.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}/python"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -Dm644 "NEWS"      "${pkgdir}/usr/share/doc/${_pkgname}/NEWS"
  install -Dm644 "COPYING"   "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  install -Dm644 "AUTHORS"   "${pkgdir}/usr/share/licenses/${_pkgname}/AUTHORS"

  cd "python"
  python setup.py install --root="${pkgdir}" --optimize=1
}
