# Maintainer : K.B.Dharun Krishna <kbdharunkrishna@gmail.com>

pkgname=vib
pkgver=0.7.4
pkgrel=1
pkgdesc="Vib (Vanilla Image Builder) is a tool that allow generating Containerfile(s) using a Flatpak-like recipe and syntax."
arch=(x86_64 aarch64)
url='https://github.com/Vanilla-OS/Vib'
license=(GPL3)
makedepends=(go)
source=("$Vib-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('dc933be2c8094111bdb72919a9f05d28239b67a698aa18a22a0a503b2619a7ac3545d71015ce30bcd55813691ee117f3b23e2eddc8110cd83b99ce61ac2efcb0')

prepare(){
	cd "Vib-${pkgver}"
	mkdir -p build/
}

build() {
	cd "Vib-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	sed 's|$$INSTALLPREFIX$$|/usr|g' core/plugins.in > core/plugins.go
	go build -a -o build/vib
}

package(){
	cd "Vib-${pkgver}"
	install -Dm755 "build/vib" "${pkgdir}/usr/bin/${pkgname}"
}
