# Maintainer: #BrainDamage

pkgname=python-matplotlib-sixel-git
pkgver=r15.a6c632d
pkgrel=2
pkgdesc="a sixel graphics backend for matplotlib "
arch=('any')
url="https://github.com/jonathf/matplotlib-sixel"
license=('BSD')
makedepends=('git' 'python-setuptools')
depends=('python' 'python-matplotlib' 'python-numpy')
source=("git+${url}")
sha256sums=('SKIP')

# strip the -git suffix from name
_dirname="${pkgname%-git}"
_basename="${pkgname%-git}"

# conflict/provide the same package as the non -git version
provides=("${_basename}")
conflicts=("${_basename}")

# strip the python- prefix from names if present
_dirname="${_dirname#python-}"
_basename="${_basename#python-}"

pkgver() {
	cd "${srcdir}/${_dirname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	# 0.9.9.r27.g2b039da # if tags exist
	# r1581.2b039da      # else fallback
}


build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --optimize=1 --skip-build --root="${pkgdir}/" --prefix="/usr"
	# not necessary for every package, but for those who it is, it'd generate conflict with others otherwise
  rm -rf "${pkgdir}/$(python -c 'import site; print(site.getsitepackages()[0])')/tests/"
}
