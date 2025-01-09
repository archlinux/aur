# Maintainer: Scott Alfter <scott@alfter.us>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=amaranth
pkgname="python-$_pkgname"
pkgver=0.5.4
pkgrel=2
pkgdesc="A modern hardware definition language and toolchain based on Python (formerly nMigen)"
arch=(any)
url="https://github.com/amaranth-lang/amaranth"
license=('BSD')
depends=('python' 'python-jinja' 'python-pyvcd')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm' 'python-jschon' 'python-packaging' 'python-pdm-backend')
optdepends=('python-paramiko: for remote builds')
# FIXME: symbiyosys
checkdepends=('python-pytest' 'yosys>0.40' 'symbiyosys-git' 'yices')
provides=("python-nmigen=$pkgver" "python-$_pkgname=$pkgver")
conflicts=('python-nmigen' "python-nmigen-git" "python-$_pkgname-git")
replaces=('python-nmigen')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
	)
sha512sums=(
   '4958d1fbe2ff985105b3e5e0bf24ade1c7b3fe705624ffad019b91e27782fc0a76d3c2d5a323bf5d9eae6e1c2177c50575ff9d6a71b3199dfde0f012d256049b'
	)

prepare()
{
	cd "${_pkgname}-${pkgver}"
	sed -i -e "s/pdm\\.backend\\._vendor\\.//" pdm_build.py
	sed -i -e 's/"pdm-backend~=2.3.0",//' pyproject.toml
}

build() {
	cd "${_pkgname}-${pkgver}"

	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
