# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: SelfRef <arch@selfref.dev>
# Contributor: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>

_pkgbase=edl
pkgname="${_pkgbase}-git"
pkgver=3.52.1.r414.g9fab1fe
pkgrel=1
pkgdesc="Inofficial Qualcomm Firehose / Sahara / Streaming / Diag Tools"
arch=('any')
url="https://github.com/bkerler/edl"
license=('GPL-3.0')
options=(!strip)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
)
depends=(
	'android-tools'
	'xz'
	'python'
	'python-colorama'
	'python-docopt'
	'python-pyusb'
	'python-pyserial'
	'python-lxml'
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
provides=("${_pkgbase}=${pkgver%.r*}")
conflicts=("${_pkgbase}")
source=(
	"$_pkgbase::git+https://github.com/bkerler/edl.git"
	"Loaders::git+https://github.com/bkerler/Loaders.git"
)
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "${_pkgbase}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkgbase}"
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
	cd "${_pkgbase}"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkgbase}"

	echo >&2 'Installing wheel into a temporary environment'
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl

	echo >&2 'Testing the executable'
	test-env/bin/edl --version > actual.txt
	if ! grep -q "^${pkgver%%.*}\$" actual.txt; then
		printf >&2 '%s\n' 'Unexpected test output:' '==='
		cat >&2 actual.txt
		printf >&2 '\n%s\n' '==='
		exit 1
	fi
}

package() {
	cd "${_pkgbase}"
	python -I -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		README.md
}
