# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=ratarmount-git
_pkgname="${pkgname%-git}"
pkgver=0.12.0.r1.gc25a2bd
pkgrel=2
epoch=1
pkgdesc="Mount tar file using fuse with fast read-only random access (git version)"
arch=('any')
url="https://github.com/mxmlnkn/$_pkgname"
license=('MIT')
depends=(
	'python-fuse'
	'python-msgpack'
	'python-rapidjson'
	'python-ujson'
	'python-simplejson'
)
makedepends=(
	'git'
	'python-setuptools'
)
optdepends=(
	'python-indexed-gzip: Support for gzip-compressed tar files'
	'python-indexed-zstd: Support for zstd-compressed tar files'
	'python-indexed-bzip2: Support for bzip2-compressed tar files'
	'python-rarfile: Support for rar-compressed tar files'
)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("git+$url")
b2sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

build() {
	cd "$srcdir/$_pkgname/core"
	python setup.py build
	cd "$srcdir/$_pkgname"
	python setup.py build
}


package() {
	cd "$srcdir/$_pkgname/core"
	python setup.py install --root="$pkgdir" --optimize=1
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir" --optimize=1
	install -Dm755 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

