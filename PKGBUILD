# Maintainer: Juan Simón <play4pro@protonmail.com>

pkgname=gosearch-git
_pkgname=gosearch
pkgver=r38.df011a9
pkgrel=1
pkgdesc="A fast, real-time file searching program for linux"
url="https://github.com/ozeidan/gosearch"
arch=('x86_64')
license=('GPL3')
makedepends=(go git)
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
_srcgo=go/src/github.com/ozeidan

install="${_pkgname}.install"

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/${_srcgo}"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/${_srcgo}/${_pkgname}"

	cd "${srcdir}/${_srcgo}/${_pkgname}"
}

build() {
   local _sourcego="${srcdir}/${_srcgo}/${_pkgname}"
   local _build="${_sourcego}/build"
   
   mkdir -p "${_build}"
   
   cd "${_sourcego}/cmd/server"
   go build \
   -gcflags "all=-trimpath=${_sourcego}" \
   -asmflags "all=-trimpath=${_sourcego}" \
   -ldflags "-s -w -extldflags ${LDFLAGS}" \
   -o ${_build}/gosearchServer
   
   cd "${_sourcego}/cmd/client"
   go build \
   -gcflags "all=-trimpath=${_sourcego}" \
   -asmflags "all=-trimpath=${_sourcego}" \
   -ldflags "-extldflags ${LDFLAGS}" \
   -o ${_build}/gosearch
}

package() {
   local _sourcego="${srcdir}/${_srcgo}/${_pkgname}"
   
   cd "${_sourcego}"
   
   install -Dm755 "./build/gosearchServer" "${pkgdir}/usr/bin/gosearchServer"
   install -Dm755 "./build/gosearch" "${pkgdir}/usr/bin/gosearch"
   install -Dm644 "./init/gosearch.service" "${pkgdir}/usr/lib/systemd/system/gosearch.service"   
}
