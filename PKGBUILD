# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='kiota-python'
_packagename='microsoft-kiota-authentication-azure'
pkgname="python-$_packagename"
pkgver='1.11.7'
pkgrel='1'
pkgdesc='Microsoft Kiota Authentication Azure Library for Python'
arch=('any')
url="https://github.com/microsoft/$_projectname"
license=('MIT')
depends=('python>=3.10.0' 'python-aiohttp>=3.8.0' 'python-azure-core>=1.21.1' 'python-microsoft-kiota-abstractions>=1.11.1' 'python-opentelemetry-api>=1.27.0' 'python-opentelemetry-sdk>=1.27.0')
makedepends=('python-build' 'python-flit-core>=3.2.0' 'python-installer' 'python-wheel')
checkdepends=('python-pytest>=9.1.1' 'python-pytest-asyncio>=1.4.0' 'python-pytest-mock')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_packagename-v$pkgver.tar.gz"
	'change-flit-upper-bound.diff'
	'hardcode-version.diff'
)
b2sums=('58638e55dfc912e1dbc1a1f1965530bbbe931aba9ef9b8af3ab50c9d17e086e8ed34cf523addbe48f2cc447d6db1ba88d47ae265134bd636d796030b8d06fdd4'
        '16ee61f51327765110e0406c944ad89fcb74879cfdccfff1776c2c89167ac4287e349ea7a66b4c5e1290871d2bf03a765819f0b7600312cdba9f2b6311af6a0e'
        '6afb5c7062c12d3faa0e7f1819c456041910ee73a75a5e747f57732a24b713246bfce2577d60ddbc617540077d6bbdb856e5a907c90e43fc3519510902bc02eb')

_sourcedirectory="$_projectname-$_packagename-v$pkgver/packages/authentication/azure"

prepare() {
	cd "$srcdir/$_sourcedirectory/../../../"

	# Bump flit upper bound, as there were no BCs
	patch --forward -p1 < "$srcdir/change-flit-upper-bound.diff"

	# Hardcode package version in _version.py to enable us to run tests without installing the package
	patch --forward -p1 < "$srcdir/hardcode-version.diff"
	sed -i "s|%%PKGVER%%|$pkgver|g" "$srcdir/$_sourcedirectory/kiota_authentication_azure/_version.py"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	pytest
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
