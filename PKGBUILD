# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
pkgname=afl-unicorn-git
pkgver=r228.44a50c8
pkgrel=1
pkgdesc="Lets you fuzz any piece of binary that can be emulated by Unicorn Engine."
arch=('any')
url="https://github.com/Battelle/afl-unicorn"
license=('apache')
depends=('glibc' 'bash' 'python' 'python2' 'python-setuptools')
provides=('afl' 'unicorn' 'python-unicorn')
conflicts=('afl' 'unicorn' 'python-unicorn')
options=('staticlibs' '!emptydirs' '!strip')
unicorn_version="1.0.1"
source=(
	"git+https://github.com/Battelle/afl-unicorn"
	"https://github.com/unicorn-engine/unicorn/archive/${unicorn_version}.tar.gz"
)
md5sums=('SKIP'
         '2a2b619e7517781750da75adee6d2e08')

pkgver() {
	cd "${srcdir}/afl-unicorn"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/afl-unicorn/unicorn_mode"
	rm -rf "unicorn-${unicorn_version}"
	mv "${srcdir}/unicorn-${unicorn_version}" .

	for p in patches/*.diff; do
		patch -p0 < "$p"
	done

	cd "unicorn-${unicorn_version}"
	sed 's|-O3|-O2|g' -i Makefile qemu/configure
	sed 's|-g ||g' -i qemu/configure
	sed 's|UNICORN_DEBUG ?= yes|UNICORN_DEBUG ?= no|g' -i config.mk
}

build() {
	cd "${srcdir}/afl-unicorn"
	make PREFIX=/usr
	make -C llvm_mode PREFIX=/usr

	cd "unicorn_mode/unicorn-${unicorn_version}"
	make UNICORN_QEMU_FLAGS="--python=/usr/bin/python2"

	cd "bindings"
	python const_generator.py python
	cd "python"
	python setup.py build
}

package() {
	cd "${srcdir}/afl-unicorn"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm 644 llvm_mode/README.llvm -t "${pkgdir}/usr/share/doc/${pkgname}"

	cd "unicorn_mode/unicorn-${unicorn_version}"
	make DESTDIR="${pkgdir}" install
	install -Dm 644 samples/*.c -t "${pkgdir}/usr/share/doc/${pkgname}/samples"

	cd bindings/python
	python setup.py install --root="${pkgdir}" -O1 --skip-build
	install -Dm 644 sample* shellcode.py -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}
