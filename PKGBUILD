# Maintainer: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>
pkgname='xkcd-git'
_pkgname='XKCD'
pkgver='20200403.r55_29aa764'
pkgrel=1
pkgdesc='CLI tool to fetch XKCD comics'
url='https://github.com/itsron717/XKCD'
depends=('python' 'python-setuptools' 'python-click' 'python-pillow' 'python-requests')
makedepends=('git')
checkdepends=('python-pytest')
license=('MIT')
arch=('x86_64')
provides=("xkcd")
conflicts=("xkcd")
sha256sums=('SKIP')

BUILDENV+=('!check')

source=(
	"${_pkgname}::git://github.com/itsron717/XKCD#branch=${BRANCH:-master}"
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
