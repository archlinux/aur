# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=packr
pkgver=2.8.3
pkgrel=2
pkgdesc="[DEPRECATED, USE GO EMBED] Go static assets bundler"
url="https://github.com/gobuffalo/packr"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=(
	'go'
	'git'
)

source=("${pkgname}-${pkgver}::git+https://github.com/gobuffalo/packr.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
	mv "${pkgname}-${pkgver}" "${pkgname}"

	if [[ -L "${srcdir}/${pkgname}" ]]; then
		rm -rf "${srcdir}/${pkgname}"
		mv "${srcdir}/go/src/${pkgname}/" "${srcdir}/${pkgname}"
	fi

	rm -rf "${srcdir}/go/src"
	mkdir -p "${srcdir}/go/src"
	export GOPATH="${srcdir}/go"
	mv "${srcdir}/${pkgname}" "${srcdir}/go/src/"
	cd "${srcdir}/go/src/${pkgname}/"
	ln -sf "${srcdir}/go/src/${pkgname}/" "${srcdir}/${pkgname}"

	echo ":: Updating git submodules"
	git submodule update --init

	echo ":: Building binary"
	cd "${pkgname}2"
	go install -v -gcflags "-trimpath ${GOPATH}/src"
}

package() {
	find "${srcdir}/go/bin/" -type f -executable | while read filename; do
		install -DT "${filename}" "${pkgdir}/usr/bin/$(basename ${filename})"
	done
	install -d                                       "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D  "${srcdir}/${pkgname}/LICENSE.txt"   "${pkgdir}/usr/share/licenses/${pkgname}"
}
