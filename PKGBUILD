# Maintainer: Scott Alfter <scott@alfter.us>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>

_pkgname=amaranth
_git_commit=4d1c4fc20dc44398c09d334b7f34096b0185d43d
pkgname="python-$_pkgname"
pkgver=0.4.5.r0.g4d1c4fc
pkgrel=1
pkgdesc="A modern hardware definition language and toolchain based on Python (formerly nMigen)"
arch=(any)
url="https://github.com/amaranth-lang/amaranth"
license=('BSD')
depends=('python' 'python-jinja' 'python-pyvcd')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm' 'python-jschon')
optdepends=('python-paramiko: for remote builds')
# FIXME: symbiyosys
checkdepends=('python-pytest' 'yosys>0.16' 'symbiyosys-git' 'yices')
provides=("python-nmigen=$pkgver" "python-$_pkgname=$pkgver")
conflicts=('python-nmigen' "python-$_pkgname")
replaces=('python-nmigen')
source=(
	"git+$url.git" 
	amaranth-versioning.patch
	)
sha256sums=(
	'SKIP' 
	'4a6582f9490af97b04d979b13f0ca3127c96d46788b27131ae3aaa7467524131'
	)

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	cd "$_pkgname"
	git checkout $_git_commit
	patch -p1 -i ${srcdir}/amaranth-versioning.patch
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
