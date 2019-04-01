# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='nanox'
_bundlepkgname='ompss'
pkgdesc='Nanos++ is a runtime designed to serve as runtime support in parallel environments. It is mainly used to support OmpSs, a extension to OpenMP developed at BSC.'
pkgver='0.14.1'
_bundlepkgver='17.12.1'
pkgrel='2'
arch=('i686' 'x86_64')
url='https://pm.bsc.es/ompss'
license=('GPL2')
depends=(extrae sqlite3)
source=("https://pm.bsc.es/ftp/${_bundlepkgname}/releases/${_bundlepkgname}-${_bundlepkgver}.tar.gz"
        "https://github.com/bsc-pm/nanox/commit/f17ae4a5e9dd2163fc33137d99ade488fe8c934a.patch")
sha512sums=(e68effb54b3a4e91da22808a928afcd586d41a3825ec2cea1f783a65d4e075cfb07ce3f5a8006c5a204a46f37fc73383cd549f6706ed12124724b6be18520344
            61e698326a0085fafc7353510537bc80b5e1f40c480e4cb8d07642b348eb529d4868f0b7dd0e5985a1c171cba8dd2274c81634ae1bfff7d12426610df4a8a089)

prepare() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-$pkgver"

	# WORKAROUND: Needed to build in GCC8 (but was unnecessary in GCC7)
	patch -p1 < "$srcdir/f17ae4a5e9dd2163fc33137d99ade488fe8c934a.patch"
}

build() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-$pkgver"

	# See https://hub.docker.com/r/bscpm/ompss/dockerfile
	./configure \
		--prefix=/usr \
		--with-extrae=/usr

	make
}

package() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}
