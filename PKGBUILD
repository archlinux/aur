# Maintainer: Hoream <2175223953@qq.com>
_pkgname="go-musicfox"
pkgname="${_pkgname}-git"
pkgver=4.0.2.r1.gc78f3a7
_pkgver=4.0.2
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go (git version).'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64')
provides=('musicfox')
conflicts=('go-musicfox-bin' 'musicfox' 'go-musicfox')
depends=('flac' 'alsa-lib')
makedepends=('gcc-objc' 'go' 'git')
source=(${_pkgname}::git+https://github.com/go-musicfox/go-musicfox)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build(){
    make 
}

build(){
 	cd "${srcdir}/${_pkgname}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export GOPATH=${srcdir}
	go build -o bin/musicfox -ldflags "-s -w -X go-musicfox/pkg/constants.AppVersion=v${_pkgver}" cmd/musicfox.go
}


package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}/bin/musicfox" "${pkgdir}/usr/bin/musicfox"
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}"
}
