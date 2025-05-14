# Maintainer: SelfRef <arch@selfref.dev>
# Contributor: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>

_pkgbase=edl
pkgname=$_pkgbase-git
pkgver=r594.407f1a9
pkgrel=1
pkgdesc="Inofficial Qualcomm Firehose / Sahara / Streaming / Diag Tools"
arch=('any')
url="https://github.com/bkerler/edl"
license=('GPL-3.0')
options=(!strip)
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
depends=(
	'android-tools'
	'xz'
	'python'
	'python-colorama'
	'python-docopt'
	'python-pyusb'
	'python-pyserial'
	'python-lxml'
	'python-wheel'
	'python-pycryptodome'
	'python-pycryptodomex'
	'python-capstone'
	'python-keystone'
	'python-requests'
	'python-passlib'
	'python-exscript'
)
optdepends=(
	'python-qrcode: QR codes generation'
)
provides=($_pkgbase)
conflicts=($_pkgbase)
source=(
	"$_pkgbase::git+https://github.com/bkerler/edl.git"
		"Loaders::git+https://github.com/bkerler/Loaders.git"
)
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$_pkgbase"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "$_pkgbase"
	git submodule init
	git config submodule.externals/vendor/Loaders.url "$srcdir/Loaders"
	git -c protocol.file.allow=always submodule update

	# Fix error in build caused by symlinks
	if [ -L edlclient/Tools/Config ]; then
		rm edlclient/Tools/Config && cp -r edlclient/Config edlclient/Tools/Config
	fi
	if [ -L edlclient/Tools/Library ]; then
		rm edlclient/Tools/Library && cp -r edlclient/Library edlclient/Tools/Library
	fi
}

build() {
	cd "$_pkgbase"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgbase"
	python -m installer --destdir="$pkgdir" dist/*.whl

	cd "$pkgdir/usr"
	mkdir -pv share/licenses/$pkgname; mv -v LICENSE $_/
	mkdir -pv share/doc/$pkgname;      mv -v README.md $_/
}
