# Maintainer : K.B.Dharun Krishna <kbdharunkrishna@gmail.com>

pkgname=vib
pkgver=0.7.2
pkgrel=1
pkgdesc="Vib (Vanilla Image Builder) is a tool that allow generating Containerfile(s) using a Flatpak-like recipe and syntax."
arch=(x86_64 aarch64)
url='https://github.com/Vanilla-OS/Vib'
license=(GPL3)
makedepends=(go)
source=("$Vib-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d7dd1bd6e2376d0aee178282c3e457289308cacb8e29e226b5313761597c79f7da4770803c5320e005eb0d0eb5547611602c6c3368d157c620673cfb00b654e1')

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
