# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=python-ldaptor
pkgver=21.2.0
pkgrel=2
pkgdesc='LDAP server, client and utilities, using Twisted Python'
license=('MIT')
arch=('any')
url='https://github.com/twisted/ldaptor'
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-passlib' 'python-twisted' 'python-pyparsing' 'python-zope-interface')
checkdepends=('python-pyopenssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/twisted/ldaptor/archive/v${pkgver}.tar.gz"
        fix-issue-838.patch
	"${pkgname}-pull-242.patch::https://github.com/twisted/ldaptor/pull/242.patch")
sha256sums=('a9fb864aa141b65b8265bbb2760f13e6d0bf16a8ca6f5e2965f2392c5f4b86ba'
            '7054ddf990823ae4a2fae963e053a36f1662ab5875c425973e040119d65a9776'
            'd81fd82dd80b46f4ebef67545a224c0db57898ca819c3262274744f0c96c0db7')

prepare() {
	cd "ldaptor-${pkgver}"

	# Workaround for issue #838 breaking tests
	# https://github.com/twisted/ldaptor/issues/238#issue-1280142717
	patch -Np1 -i "${srcdir}/fix-issue-838.patch"

	# Apply #242 to fix breakage under Python >= 3.12
	# https://github.com/twisted/ldaptor/pull/242
	patch -Np1 -i "${srcdir}/${pkgname}-pull-242.patch"
}

build() {
	cd "ldaptor-${pkgver}"
	python -m build --wheel --no-isolation
}

check() {
	cd "ldaptor-${pkgver}"
	python -m twisted.trial -j$(nproc) ldaptor
}

package() {
	cd "ldaptor-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
