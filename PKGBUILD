# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: lazant <a.l.i.c.e at outlook.com>

pkgname=python-buildozer
_pkgname=buildozer
pkgver=1.5.0
pkgrel=1
pkgdesc="Generic Python packager for Android / iOS and Desktop"
arch=('any')
depends=(
	'python'
	'python-colorama'
	'python-pexpect'
	'python-virtualenv'
	'python-sh'
)
makedepends=(
	'cmake'
	'libusb'
	'python-build'
	'python-installer'
	'python-setuptools'
)
optdepends=('python-paramiko: remote builds')
url="https://github.com/kivy/buildozer"
license=('MIT')
options=(!emptydirs)
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
	"buildozer-1.patch"
	"buildozer-2.patch"
)
sha256sums=(
	'229ae9fb8e519ee1a33e9a06a3e083f84646bb49b15cde91ac04ade79b44ef89'
	'SKIP'
	'SKIP'
)
provides=('buildozer' 'python-buildozer')
conflicts=('buildozer')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	# Get rid of deprecated&removed FancyURLopener
	patch -p1 -i "${srcdir}/buildozer-1.patch"
	patch -p1 -i "${srcdir}/buildozer-2.patch"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
