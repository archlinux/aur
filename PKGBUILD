# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='1.4.3'
_commit='1d1c3617531f070573c5e9f925b8721d7e548e62'
pkgrel='1'
epoch='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL-2.1-or-later')
depends=('python>=3.8.0' 'python-chardet' 'python-humanfriendly' 'smartmontools')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=(
	"$pkgname-$pkgver::git+$url#commit=$_commit?signed"
	'fix-chardet6-compat.diff'
)
b2sums=('9bdc2af7d760327c8263b8bb4a9a3357b50c368d7706dcf2b36a29b268be07b0bc14bacbd81d56a9c017610587f674cb2bb34b19e68fc90171436a0b5b20e827'
        '202f307c022489138330a41a1390df5a8989e56d227853ebfe148291169c23f506e7d31e48d7a059602ac62f14e9e39088468591a0709a606f2b24b3fb085606')
validpgpkeys=('5F6761715FB2876BF2355A72195598EC98A1C1DF') # Rafael Leira Osuna <rafael.leira@naudit.es> (https://github.com/ralequi.gpg) - expired

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Fix python-chardet>=6.0.0 compatibility
	patch --forward -p1 < "$srcdir/fix-chardet6-compat.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	# setuptools-scm normally needs a git repo, set an explicit version instead
	export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"

	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Skip nvme_9_issue_72 test case (reported upstream in https://github.com/truenas/py-SMART/issues/102)
	pytest -k 'not nvme_9_issue_72'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
}
