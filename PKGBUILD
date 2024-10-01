# Maintainer: Edoardo Signorini <contact at edoars dot me>

pkgname=libmceliece
epoch=
pkgver=20240812
pkgrel=1
pkgdesc="A microlibrary for the Classic McEliece cryptosystem"
url="https://lib.mceliece.org"
license=('Unlicense')
arch=('x86_64')
depends=('libcpucycles' 'librandombytes' 'openssl')
makedepends=('clang' 'python' 'valgrind')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b5bd306bddde6570a95b3271955a2c363cffeede1f1e4021d397439d5ceaf0069d39d9dc6c868ab584354d659f3db03dfd98378f75b0be67b6ba7a9cf86cbe1e')

build() {
	cd "${pkgname}-${pkgver}"

	./configure --prefix=/usr
  make
}

check() {
	cd "${pkgname}-${pkgver}"

	BUILD="./build/0/package"
	env LD_LIBRARY_PATH="${BUILD}/lib:${LD_LIBRARY_PATH}" PATH="${BUILD}/bin:${PATH}" $BUILD/bin/mceliece-fulltest
}

package() {
	cd "${pkgname}-${pkgver}"

	for f in build/0/package/bin/*; do
		install -Dt "${pkgdir}"/usr/bin -m0755 $f
	done

	install -Dt "${pkgdir}"/usr/lib -m0644 build/0/package/lib/libmceliece.so.1
	ln -s libmceliece.so.1 "${pkgdir}"/usr/lib/libmceliece.so
	install -Dt "${pkgdir}"/usr/include -m0644 build/0/package/include/mceliece.h

	for f in build/0/package/man/man3/*.3; do
		install -Dt "${pkgdir}"/usr/share/man/man3 $f
	done

	for f in build/0/package/man/man1/*.1; do
		install -Dt "${pkgdir}"/usr/share/man/man1 $f
	done
}
