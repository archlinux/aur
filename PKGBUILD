# Contributor: Paul Colomiets pc at gafol dot net
# Maintainer: Oliver Mangold omangold at gmail dot com
pkgname=python-plex
pkgver=2.0.0dev
pkgrel=1
pkgdesc="A lexical analysis module for Python."
arch=('any')
url="http://www.cosc.canterbury.ac.nz/greg.ewing/python/Plex/"
license=('LGPL')
makedepends=('python')
replaces=('python3-plex')
source=("http://pypi.python.org/packages/source/p/plex/plex-${pkgver}.tar.gz"
        'machines.patch')
sha256sums=('07b4ce0ea8fe5928f5c8abdbf08b80edfd44ea90cc9c8c2fe233f59890498d28'
            '4e62073f1fd3e1fddfe79ec3d26daff21607be6aeae46024c6aec99f802aec88')

build() {
    cd "$srcdir/plex-${pkgver}"
    2to3 -w src/plex/*.py
    sed -i 's/from types import TupleType/TupleType = tuple/' src/plex/*.py
    sed -i 's/from sys import maxsize/from sys import maxsize as maxint/' src/plex/*.py
    sed -i 's/import exceptions/ /' src/plex/*.py
    sed -i 's/exceptions.Exception/Exception/' src/plex/*.py
    sed -i 's/string.join/(lambda a,b: b.join(a))/' src/plex/*.py
    sed -i 's/((lo + hi) \/ 2)/((lo + hi) \/\/ 2)/' src/plex/transitions.py
    patch -p0 -i ../machines.patch
}

package() {
    local libdir="$(echo 'import sysconfig; print(sysconfig.get_path("purelib"))' | python)"
    cd "$srcdir/plex-${pkgver}"
	install -d "$pkgdir$libdir/plex"
	install src/plex/*.py "$pkgdir$libdir/plex"
	python -m compileall -d "$libdir/plex" "$pkgdir$libdir/plex"
	python -Om compileall -d "$libdir/plex" "$pkgdir$libdir/plex"
}

