# Maintainer: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>
pkgname='python-alluvium'
_pkgname='alluvium'
pkgver=20200612.r1_g353d046
pkgrel=1
pkgdesc='Generate visual overlays from your i3 bindings'
url='https://github.com/cqql/${_pkgname}'
depends=('python')
makedepends=('python-setuptools' 'git')
checkdepends=('python-pytest')
license=('GPL3')
arch=('any')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/cqql/${_pkgname}.git")
sha256sums=('SKIP')

BUILDENV+=('!check')

backup=()

source=(
	"$_pkgname::git://github.com/cqql/${_pkgname}#branch=${BRANCH:-master}"
)

pkgver() {
	if [[ "$PKGVER" ]]; then
		echo "$PKGVER"
		return
	fi

	cd "$srcdir/$_pkgname"
	local DATE=$(git log -1 --format="%cd" --date=short | sed s/-//g)
	local COUNT=$(git rev-list --count HEAD)
	local COMMIT=$(git rev-parse --short HEAD)
	local CHKSUM=$(git rev-list master | head -n1)
	printf "%s.%s_%s" "$DATE" "r${COUNT}" "g${COMMIT}"

}

check() {
    cd "${srcdir}/${_pkgname}"
    pytest
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}