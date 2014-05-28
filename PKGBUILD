# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='beancount-hg'
pkgdesc='Double-Entry Accounting from Text Input'
pkgver=r1443.0512ce36d618
pkgrel=1
arch=('any')
url="http://furius.ca/beancount/"
license=('GPL')
source=("${pkgname}::hg+https://hg.furius.ca/public/beancount/")
sha1sums=('SKIP')

export HGOPTIONS=--insecure

# Hack to make sure we pass --insecure to Mercurial when cloning/pulling
hg () {
	if [[ $1 == clone ]] ; then
		shift
		command hg clone --insecure "$@"
	elif [[ $1 == pull ]] ; then
		shift
		command hg pull --insecure "$@"
	else
		command hg "$@"
	fi
}

# TODO: Add python-cdecimal when package is available
depends=(
	python-bottle
	wget
)

pkgver () {
	cd "${pkgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build () {
	cd "${pkgname}"
	export CFLAGS='-std=gnu99'
	python3 setup.py build_ext -i
	python3 setup.py build
}

package () {
	cd "${pkgname}"
	python3 setup.py install --prefix=/usr --root="${pkgdir}"
}
