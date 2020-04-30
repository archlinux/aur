# @Author: archer
# @Date:   2019-08-02T13:11:00+01:00
# @Last modified by:   archer
# @Last modified time: 2019-08-02T13:31:38+01:00

# Maintainer: George Raven <GeorgeRavenCommunity AT pm dot me>
pkgname=nemesyst-git
_pkgsrcname="nemesyst"
pkgver=2.0.6.r6.68bebbc
pkgrel=1
pkgdesc="Practical, distributed, hybrid-parallelism, deep learning framework."
arch=('x86_64' 'aarch64')
url="https://github.com/DreamingRaven/nemesyst"
_branch="master"
license=('OSL-3.0')
groups=()
depends=('python-setuptools' 'python' 'python-pymongo' 'python-configargparse'
				 'python-future' 'python-ezdb-git')
makedepends=('git'
						'python-sphinx'
						'python-sphinx_rtd_theme'
						'python-sphinx-argparse'
)
optdepends=('mongodb: local database creation'
						'python-scikit-learn: mnist example auto data fetcher'
						'python-keras-applications: example neural networks'
						'python-keras-preprocessing: example neural networks'
						'python-keras: example neural networks'
						)
provides=("nemesyst")
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
	cd "${srcdir}/${_pkgsrcname}/docs"
	make man
}

check() {
	cd "${srcdir}/${_pkgsrcname}"
	# check that program can run while self checking and updating if somethings missing
	python3 ./nemesyst.py --update
}

package() {
	cd "${srcdir}/${_pkgsrcname}"
	python3 ./setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 docs/build/man/nemesyst.1 "$pkgdir/usr/share/man/man1/nemesyst.1"
	install -Dm644 nemesyst.d/nemesyst.conf "${pkgdir}/etc/nemesyst/nemesyst.d/nemesyst.conf"
}
