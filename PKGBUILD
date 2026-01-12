# Maintainer: coldbug <coldBug@e.mail.de>
pkgname=dr14_t.meter-git
pkgver=v1.0.15.r190.g9a22d1a
pkgrel=3
pkgdesc="DR14 T.meter is a command line tool for computing the Dynamic Range of your music"
arch=(any)
url="https://github.com/simon-r/dr14_t.meter"
license=('GPL3')
depends=('python' 'flac' 'lame' 'faad2' 'ffmpeg' 'vorbis-tools' 'python-numpy' 'python-mutagen')
optdepends=('python-matplotlib: plot support for python' 'python-scipy: dyn compression')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "dr14_tmeter")
source=('dr14_t.meter::git+https://github.com/simon-r/dr14_t.meter.git#branch=master'
	'0001-fix-regex-patterns.patch'
	'0002-Patch-off-by-one.patch')
noextract=()
md5sums=('SKIP'
	 '0a300947a83e1cf02dfdd2ca4143eb77'
	 '9baf2d853b27be8023a270752df715f9')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
    # Fix regex for python 3.13+
    patch -p1 < "$srcdir/0001-fix-regex-patterns.patch"
    patch -p1 < "$srcdir/0002-Patch-off-by-one.patch"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
