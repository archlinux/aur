# Maintainer: Scott Alfter <scott@alfter.us>

_pkgname=amaranth-soc
_git_commit=e1b842800533f44924f21c3867bc2290084d100f
pkgname="python-$_pkgname"
pkgver=0.1a.r15.ge1b8428
pkgrel=2
pkgdesc="System on Chip toolkit for Amaranth"
arch=(any)
url="https://github.com/amaranth-lang/amaranth-soc"
license=('BSD-2')
depends=('python-amaranth')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm') # 'python-jschon')
optdepends=('python-paramiko: for remote builds')
# FIXME: symbiyosys
provides=("python-$_pkgname=$pkgver")
source=(
	"git+$url.git" 
	amaranth-soc-versioning.patch
	)
sha256sums=(
	'SKIP' 
	'9b5323acd21d7082c0beaac1c990710ab2cc4c0e31b7fac0d557ffa3f956f13b'
	)

pkgver() {
	cd "$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	cd "$_pkgname"
	git checkout $_git_commit
	patch -p1 -i ${srcdir}/amaranth-soc-versioning.patch
}

build() {
	cd "$_pkgname"

	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"

	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
