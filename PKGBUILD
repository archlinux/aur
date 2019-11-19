#maintainer BrainDamage
pkgname=beets-bbq-git
pkgver=r7.b784da6
pkgrel=1
pkgdesc='A blackbird style search query plugin for beets.'
arch=('any')
url='https://github.com/lepisma/beets-bbq'
license=('GPL')
depends=('python'  'beets')
source=("${pkgname}::git+https://github.com/lepisma/beets-bbq")

# template start; name=git; version=1;
# template start; name=git_source; version=1;
makedepends+=('git')
_name=${pkgname%-git}
provides=("$_name")
conflicts=("$_name")
sha256sums=('SKIP')
# template end;
# template start; name=git_version; version=1;
pkgver() {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	# 0.9.9.r27.g2b039da # if tags exist
	# r1581.2b039da      # else fallback
}
# template end;
# template end;

makedepends+=('python-setuptools')

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --skip-build --root="${pkgdir}/" --prefix="/usr"
	install -Dvm 644 README.rst "${pkgdir}/usr/share/doc/${_name}"
}
