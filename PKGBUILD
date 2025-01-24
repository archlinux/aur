# Maintainer: Edoardo Signorini <contact at edoars dot me>

pkgname=libmceliece
epoch=
pkgver=20241009
pkgrel=1
pkgdesc="A microlibrary for the Classic McEliece cryptosystem"
url="https://lib.mceliece.org"
license=('Unlicense')
arch=('x86_64')
depends=('libcpucycles' 'librandombytes' 'openssl')
makedepends=('clang' 'python' 'valgrind')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('438147cf4b8f3495d5adec90262e12a2224d06930c9afa6c4f21a083ba2a825e1c04a1de8b2cc3af43982f4d69f0d59fb31e3c5a100de56cb5c752cd626213b8')

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
