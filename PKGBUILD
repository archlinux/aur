# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='absolutely-proprietary'
_pkgname='absolutely_proprietary'
pkgver='20190215'
_commit='8cee5a4846b74a66f5075a1ca0b351c0002a4212'
pkgrel='1'
pkgdesc="Proprietary package detector for arch-based distros. Uses Parabola's package blacklist."
arch=('any')
url="https://github.com/vmavromatis/$pkgname"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=(
	"$pkgname.tar.gz::$url/archive/$_commit.tar.gz"
	'0001-Fix-setup-syntax.patch'
	'0002-Remove-pymodules.patch'
	'0003-Add-entry-point.patch'
)
sha256sums=(
	'9a81949fc58624ca343011e08c621506225b3e2ba8733ffa11c53608e236ecf9'
	'892dddae3a45af27fe171a620ca179f8de1e4a396ff1ba38e662291f156146a9'
	'98c6b93e8876e018671c52713c26aebac425311d73dee41ff888e46d5d4155be'
	'732de04c2c68e24a6b3abcf63bcb311ef726f2033c5e02351b0b98fe7395602a'
)

prepare() {
    cd "$srcdir/$pkgname-$_commit"
    patch -Ni "$srcdir/0001-Fix-setup-syntax.patch" # missing comma
	patch -Ni "$srcdir/0002-Remove-pymodules.patch" # find_packages is enough
	patch -Ni "$srcdir/0003-Add-entry-point.patch" # add entry point to /usr/bin
	# Rename and move main.py to its own subdirectory in order for find_packages to be able to pick it up and to not pollute the main site-packages directory
	mkdir "$srcdir/$pkgname-$_commit/$_pkgname"
	mv "$srcdir/$pkgname-$_commit/main.py" "$srcdir/$pkgname-$_commit/$_pkgname/__init__.py"
}

build() {
	cd "$srcdir/$pkgname-$_commit"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$_commit"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
