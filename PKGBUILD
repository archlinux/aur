# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname=Python
pkgname=python25
pkgver=2.5.6
pkgrel=4
pkgdesc="A high-level scripting language"
arch=(i686 x86_64)
license=("custom")
url="https://www.python.org"
depends=("db" "bzip2" "gdbm" "openssl" "zlib" "gcc-libs" "readline")
optdependss=("sqlite")
makedepends=("tk")
source=(
	"https://www.python.org/ftp/python/$pkgver/Python-$pkgver.tar.bz2"
	"https://www.python.org/ftp/python/$pkgver/Python-$pkgver.tar.bz2.asc"
)
sha256sums=(
	"57e04484de051decd4741fb4a4a3f543becc9a219af8b8063b5541e270f26dcc"
	"SKIP"
)
validpgpkeys=(
	# https://www.python.org/downloads/
	"CBC547978A3964D14B9AB36A6AF053F07D9DC8D2"
)
options=("!makeflags")


build() {
	cd "$srcdir/Python-$pkgver"

	export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$srcdir/Python-$pkgver"
	export CXX="g++"
	./configure \
		--prefix=/usr \
		--enable-shared \
		--with-thread \
		--enable-ipv6 \
		--enable-unicode
	make
}

package() {
	cd "$srcdir/Python-$pkgver"
	export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$srcdir/Python-$pkgver"

	make DESTDIR="$pkgdir" altinstall

	# Rename all the scripts
	pushd "$pkgdir/usr/bin"
	mv idle idle2.5
	mv pydoc pydoc2.5
	mv smtpd.py smtpd2.5.py
	popd

	# License
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
