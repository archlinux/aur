# Maintainer: xiretza <xiretza+aur@gmail.com>
_pkgname=sandsifter
pkgname="${_pkgname}-git"
pkgver=r22.d0e9e8e
pkgrel=1
pkgdesc="The x86 processor fuzzer"
arch=("i686" "x86_64")
url="https://github.com/rigred/${_pkgname}"
# see https://github.com/xoreaxeaxeax/sandsifter/issues/13
license=("unknown")
groups=()
depends=(python2-capstone)
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}"
	"${pkgname}.patch")
sha256sums=('SKIP'
            'fbe1e12694f8be31ab3128932c6a5e91950f14fd1c22196559dd74711b9d080f')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_pkgname}"
	patch -p1 -i "${srcdir}/${pkgname}.patch"
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
	install -Dm 655 -t "${pkgdir}/opt/${_pkgname}" summarize.py injector
	cp -r disas gui pyutil "${pkgdir}/opt/${_pkgname}/"
	install -Dm 655 -t "${pkgdir}/usr/bin/" sifter.py
	ln -s "/opt/${_pkgname}/summarize.py" "${pkgdir}/usr/bin/"
}
