# Maintainer: Edoardo Signorini <contact at edoars dot me>

pkgname=lib25519
epoch=
pkgver=20241004
pkgrel=1
pkgdesc="A microlibrary for the X25519 encryption system and the Ed25519 signature system"
url="https://lib25519.cr.yp.to"
license=('Unlicense')
arch=('x86_64')
depends=('libcpucycles' 'librandombytes' 'openssl')
makedepends=('python' 'valgrind')
source=("${url}/${pkgname}-${pkgver}.tar.gz" '0001-remove-clang.patch')
sha512sums=('6751eea13275a044427fe4b4bcec80e353c461cb6c5e517b57aff32106bf84717dc0e2c8ea5ad1b9e8a24a2321fec7789712c0e38856fc6b5d33a3188895757a'
            '70da7f1c8d8497c1f908a3880b22b706eb3aa214e706b7c2335eb0280897a6ea16e4abdd07699fbb78659cd5afc0f340a7ff29ca207e46886736147c6e21687f')

prepare() {
	cd "${pkgname}-${pkgver}"

  # Clang causes Valgrind test failure
	patch -Np1 -i ../0001-remove-clang.patch
}

build() {
	cd "${pkgname}-${pkgver}"

	./configure --prefix=/usr 
  make
}

check() {
	cd "${pkgname}-${pkgver}"

	BUILD="./build/0/package"
	env LD_LIBRARY_PATH="${BUILD}/lib:${LD_LIBRARY_PATH}" PATH="${BUILD}/bin:${PATH}" $BUILD/bin/lib25519-fulltest
}

package() {
	cd "${pkgname}-${pkgver}"

	for f in build/0/package/bin/*; do
		install -Dt "${pkgdir}"/usr/bin -m0755 $f
	done

	install -Dt "${pkgdir}"/usr/lib -m0644 build/0/package/lib/lib25519.so.1
	ln -s lib25519.so.1 "${pkgdir}"/usr/lib/lib25519.so
	install -Dt "${pkgdir}"/usr/include -m0644 build/0/package/include/lib25519.h

	for f in build/0/package/man/man3/*.3; do
		install -Dt "${pkgdir}"/usr/share/man/man3 $f
	done

	for f in build/0/package/man/man1/*.1; do
		install -Dt "${pkgdir}"/usr/share/man/man1 $f
	done
}
