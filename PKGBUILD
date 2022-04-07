# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=lorax
pkgver=37.0.post1
_ver=${pkgver/.post/-}
pkgrel=1
pkgdesc="Set of tools for creating bootable images"
arch=('any')
url="https://github.com/weldr/lorax"
license=('GPL')
depends=('python-mako' 'python-pycdio' 'dnf' 'python-selinux')
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-wheel')
backup=('etc/lorax/lorax.conf')
changelog=
source=("$pkgname::git+$url#tag=lorax-$_ver?signed"
        'remove-datafiles.patch')
sha256sums=('SKIP'
            '78b76fb64e72f5c1a1142feedb8558dd2b4b17c79f52724b9f4b110d098859d0')
validpgpkeys=('B4C6B451E4FA8B4232CA191E117E8C168EFE3A7F') ## Brian C. Lane

prepare() {
	patch -p1 -d "$pkgname" < remove-datafiles.patch
	## who writes versions like this
	echo "num = '$pkgver'" > "$pkgname/src/pylorax/version.py"
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -D src/{,s}bin/* -t "$pkgdir/usr/bin/"
	install -Dm644 docs/man/*.1 -t "$pkgdir/usr/share/man/man1/"
	install -Dm644 etc/lorax.conf -t "$pkgdir/etc/$pkgname/"
}
