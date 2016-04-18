#  Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=letshelp-certbot-git
_reponame="letsencrypt"
pkgver=0.5.0.r57.g86e09d5
pkgrel=1
pkgdesc="Let's help Certbot client"
arch=('any')
license=('Apache')
url="https://github.com/letsencrypt/${_reponame}"
depends=('python2-setuptools' 'python2-mock')
makedepends=('git')
provides=("letshelp-certbot=${pkgver}" "letshelp-letsencrypt=${pkgver}")
conflicts=("letshelp-certbot" "letshelp-letsencrypt")
source=("${_reponame}"::"git+https://github.com/letsencrypt/letsencrypt")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_reponame}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_reponame}/letshelp-certbot"
	python2 setup.py clean
	rm -rf build dist
	python2 setup.py build
}

package() {
	cd "${srcdir}/${_reponame}/letshelp-certbot"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
