# Maintainer: Scott Alfter <scott@alfter.us>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=amaranth
_git_commit=a0750b89c6060d9f809159a012a26cff4e22e69d
pkgname="python-$_pkgname"
pkgver=0.5.0.r0.ga0750b8
pkgrel=1
pkgdesc="A modern hardware definition language and toolchain based on Python (formerly nMigen)"
arch=(any)
url="https://github.com/amaranth-lang/amaranth"
license=('BSD')
depends=('python' 'python-jinja' 'python-pyvcd')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm' 'python-jschon' 'python-packaging' 'python-pdm-backend')
optdepends=('python-paramiko: for remote builds')
# FIXME: symbiyosys
checkdepends=('python-pytest' 'yosys>0.16' 'symbiyosys-git' 'yices')
provides=("python-nmigen=$pkgver" "python-$_pkgname=$pkgver")
conflicts=('python-nmigen' "python-nmigen-git" "python-$_pkgname-git")
replaces=('python-nmigen')
source=(
	"git+$url.git" 
	)
sha256sums=(
	'SKIP' 
	)

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	cd "$_pkgname"
	git checkout $_git_commit
	sed -i -e "s/pdm\\.backend\\._vendor\\.//" pdm_build.py
}

build() {
	cd "$_pkgname"

	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"

	PYTHONPATH=. pytest
}

package() {
	cd "$_pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
