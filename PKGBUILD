# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=checkmake
pkgname=${_name}-git
pkgver=0.1.0.r14.gff21564
pkgrel=2
pkgdesc="Experimental linter/analyzer for makefiles"
arch=('any')
url="https://github.com/mrtazz/checkmake"
license=('MIT')
makedepends=('go-pie' 'git')
conflicts=('checkmake')
source=(git+https://github.com/mrtazz/checkmake.git)
sha256sums=('SKIP')

pkgver() {
	cd "$_name"
	git describe --long --tags | sed 's/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
	mkdir -p gopath/src/github.com/mrtazz
	ln -rTsf "${_name}" gopath/src/github.com/mrtazz/checkmake
}

build(){
	cd "gopath/src/github.com/mrtazz/checkmake"
	export GOPATH="${srcdir}/gopath"
	go install \
		-gcflags "all=-trimpath=${GOPATH}" \
		-asmflags "all=-trimpath=${GOPATH}" \
		./cmd/...
}

package() {
	install -Dm755 gopath/bin/checkmake "${pkgdir}/usr/bin/checkmake"
	cd "${_name}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
