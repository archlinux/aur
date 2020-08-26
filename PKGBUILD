# Maintainer: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>
pkgname='ttrv-git'
_pkgname='ttrv'
pkgver=20200805.r1660_e827187
pkgrel=1
pkgdesc='Tilde Terminal Reddit Viewer - fork of rtv'
url='https://github.com/tildeclub/ttrv'
depends=('python' 'python-setuptools' 'python-beautifulsoup4' 'python-decorator' 'python-kitchen' 'python-requests>=2.4.0' 'python-six')
makedepends=('git')
checkdepends=('python-pytest>=3.1.0' 'python-coverage' 'python-coveralls' 'python-mock' 'python-pylint' 'python-vcrpy')
license=('MIT')
arch=('x86_64')
provides=("ttrv")
conflicts=("ttrv")
sha256sums=('SKIP')

BUILDENV+=('!check')

source=(
	"${_pkgname}::git://github.com/tildeclub/ttrv#branch=${BRANCH:-master}"
)

pkgver() {

	cd "${srcdir}/${_pkgname}"
	local DATE=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local COUNT=$(git rev-list --count HEAD)
	local COMMIT=$(git rev-parse --short HEAD)
	printf "%s.%s_%s" "$DATE" "r${COUNT}" "${COMMIT}"

}

check() {
    cd "${srcdir}/${_pkgname}"
    python setup.py pytest
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -D -m644 "${srcdir}"/${_pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
