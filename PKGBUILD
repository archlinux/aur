# Maintainer : K.B.Dharun Krishna <kbdharunkrishna@gmail.com>

pkgname=vib
pkgver=1.0.0
pkgrel=1
pkgdesc="Vib (Vanilla Image Builder) is a tool that allow generating Containerfile(s) using a Flatpak-like recipe and syntax."
arch=(x86_64 aarch64)
url='https://github.com/Vanilla-OS/Vib'
license=(GPL3)
makedepends=(go btrfs-progs)
source=("$Vib-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0fa603930e23043da37b48743929f60cdcad4964f59de4c002efc5b7e3291f1feecac958806ccfb32c93071d9fd13806e3ade68ddb7b506225214bc976dd60a8')

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
