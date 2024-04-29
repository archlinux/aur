#maintainer BrainDamage
pkgname=beets-bbq-git
pkgver=r7.b784da6
pkgrel=3
pkgdesc='Blackbird-style search query plugin for beets'
arch=('any')
url='https://github.com/lepisma/beets-bbq'
license=('GPL')
depends=('python' 'beets')
makedepends=('python-setuptools' 'git')
source=("${pkgname}::git+https://github.com/lepisma/beets-bbq")
sha256sums=('SKIP')

_basename=${pkgname%-git}
provides=("$_basename")
conflicts=("$_basename")

pkgver() {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	# 0.9.9.r27.g2b039da # if tags exist
	# r1581.2b039da      # else fallback
}

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --skip-build --root="${pkgdir}/" --prefix="/usr"
	install -Dvm 644 README.rst "${pkgdir}/usr/share/doc/${_basename}"
}
