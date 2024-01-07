# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=python-acme-git
_reponame="certbot"
pkgver=2.8.0.r6.g926d0c7e0
pkgrel=1
pkgdesc="ACME protocol implementation for Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/${_reponame}"
depends=('python-cryptography' 'python-josepy' 'python-pyopenssl'
	'python-pyrfc3339' 'python-pytz' 'python-requests')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
provides=("python-acme=${pkgver}")
conflicts=("python-acme")
source=("${_reponame}"::"git+https://github.com/certbot/${_reponame}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_reponame}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	git -C "${srcdir}/${_reponame}" clean -dfx
}

build() {
	cd "${srcdir}/${_reponame}/acme"
	python -m build --wheel --no-isolation
	make -C docs man  # man pages
}

package_python-acme-git() {
	cd "${srcdir}/${_reponame}/acme"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -vDm644 -t "${pkgdir}/usr/share/man/man1" docs/_build/man/*.1
}
