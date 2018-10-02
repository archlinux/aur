# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=letshelp-certbot-git
_reponame="certbot"
pkgver=0.27.0.r30.g06174bc11
pkgrel=1
pkgdesc="Let's help Certbot client"
arch=('any')
license=('Apache')
url="https://github.com/certbot/${_reponame}"
depends=('python-setuptools' 'python-mock')
makedepends=('git')
provides=("letshelp-certbot=${pkgver}" "letshelp-letsencrypt=${pkgver}")
conflicts=("letshelp-certbot" "letshelp-letsencrypt")
source=("${_reponame}"::"git+https://github.com/certbot/${_reponame}")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_reponame}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_reponame}/letshelp-certbot"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package() {
	cd "${srcdir}/${_reponame}/letshelp-certbot"
	python setup.py install --root="${pkgdir}" --optimize=1
}
