# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=goxel-git
pkgver=r126.0e00703
pkgrel=3
pkgdesc="Download accelerator written in Go (inspired by axel)"
url="https://github.com/m1ck43l/goxel"
arch=('x86_64' 'i686')
license=('Apache')
makedepends=('go')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/m1ck43l/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/m1ck43l/goxel"
}

build() {
	cd "${srcdir}/go/src/github.com/m1ck43l/goxel"

	mkdir -p build

	export GOPATH="${srcdir}/go"
	go build -trimpath -modcacherw \
		-ldflags "-s -w" -o build/goxel
}

package() {
	cd "${srcdir}/go/src/github.com/m1ck43l/goxel"

	install -Dm755 "./build/goxel" "${pkgdir}/usr/bin/goxel"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
