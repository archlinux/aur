# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='pysmart'
_reponame='py-SMART'
pkgname="python-$_projectname"
pkgver='1.2.4'
pkgrel='1'
epoch='1'
pkgdesc='Wrapper for smartctl (smartmontools) - FreeNAS fork'
arch=('any')
url="https://github.com/freenas/$_reponame"
license=('LGPL2.1')
depends=('python>=3.7.0' 'python-humanfriendly' 'smartmontools')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest')
source=(
	"$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz"
	'add-missing-interface-package.diff'
)
sha512sums=('6355a93962b7d1729e92ec831d82d5437dbb47dd26d4a80000fbdb74370c087c36bb48b6d8f16310e03d4b49d75aae6cce0d5e4c90746115402e654842db2b63'
            '611e01f26021e5cb1e04d37a1c2be7c2d616df6bf2af8067517b1a84bc4bcbac8fcc6c0917184fd0a069b566f6a918963449fff0dba393fd7c6ec41a54155897')

_sourcedirectory="$_reponame-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Fix missing interface package in pyproject.toml
	# https://github.com/truenas/py-SMART/pull/67
	patch --forward -p1 < "$srcdir/add-missing-interface-package.diff"
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	# setuptools-scm normally needs a git repo, set an explicit version instead
	export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"

	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	pytest
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
}
