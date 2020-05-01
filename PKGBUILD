# @Author: archer
# @Date:   2019-08-02T13:11:00+01:00
# @Last modified by:   archer
# @Last modified time: 2019-08-02T13:31:38+01:00

# Maintainer: George Raven <GeorgeRavenCommunity AT pm dot me>
pkgname=python-ezdb-git
_pkgsrcname="python-ezdb"
pkgver=0.0.1.r7.7065005
pkgrel=1
pkgdesc="Ezified python mongodb database."
arch=('x86_64' 'aarch64')
url="https://github.com/DreamingRaven/python-ezdb"
_branch="master"
license=("OSL-3.0") # open software licence v3
groups=()
depends=('python-setuptools' 'python' 'python-pymongo')
makedepends=('git'
						 'make'
						 'python-sphinx'
						 'python-sphinx_rtd_theme'
						 'python-sphinx-argparse')
optdepends=('mongodb: local database creation and check unittests')
provides=("python-ezdb")
conflicts=()
replaces=()
backup=()
options=()
install=
source=("${_pkgsrcname}::git+${url}#branch=${_branch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgsrcname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${srcdir}/${_pkgsrcname}"
	git checkout ${_branch} # get off of makepkg branch
}

build() {
	# build man pages
	cd "${srcdir}/${_pkgsrcname}/docs"
	make man
}

check() {
	cd "${srcdir}/${_pkgsrcname}"
	# skip check if you do not have MongoDB installed:
	# can not test without MongoDB itself
	python3 ./unit_test.py
}

package() {
	cd "${srcdir}/${_pkgsrcname}"

	# installing library files
	python3 ./setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1

	# install licence
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# install man pages built in build()
	mkdir -p "$pkgdir/usr/share/man/man1/"
	install -Dm644 docs/build/man/* "$pkgdir/usr/share/man/man1/"
}
