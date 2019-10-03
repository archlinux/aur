# Maintainer: xiretza <xiretza+aur@gmail.com>
_pkgname=sandsifter
pkgname="${_pkgname}-git"
pkgver=r53.4ae3e6e
pkgrel=2
pkgdesc="The x86 processor fuzzer"
arch=("i686" "x86_64")
url="https://github.com/rigred/${_pkgname}"
license=('BSD')
depends=('python2-capstone' 'elfutils')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	# TODO: get it to build with -m32
	#rm -f injector
	#make CFLAGS="-m32"
	#mv injector{,_32}
	make CFLAGS="-no-pie"
	#mv injector{,_64}
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm 644 -t "${pkgdir}/opt/${_pkgname}" mutator.py
	install -Dm 655 -t "${pkgdir}/opt/${_pkgname}" sifter-summarize.py
	cp -r disas gui pyutil "${pkgdir}/opt/${_pkgname}/"

	install -Dm 655 -t "${pkgdir}/usr/bin" sifter-injector
	install -Dm 655 -t "${pkgdir}/usr/bin/" sifter.py
	ln -s "/opt/${_pkgname}/sifter-summarize.py" "${pkgdir}/usr/bin/"

	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
