# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=netcap-git
pkgver=0.6.11.r0.gaaeec399
pkgrel=1
pkgdesc='A framework for secure and scalable network traffic analysis'
url="https://github.com/dreadl0ck/netcap"
arch=('x86_64')
license=('GPL3')
# ndpi currently breaks build process
#depends=('ndpi')
makedepends=('git' 'go' 'libprotoident')
conflicts=('netcap')
provides=('netcap')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    install -m755 -d "${srcdir}/go/src/github.com/dreadl0ck/"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/dreadl0ck/netcap"
}

build() {
	cd "${srcdir}/go/src/github.com/dreadl0ck/netcap"

    mkdir -p build
    export GOPATH="${srcdir}/go"

    _version="github.com/dreadl0ck/netcap.Version=${pkgver}"
	go build \
		-tags nodpi -trimpath -modcacherw \
		-ldflags "-s -w -X ${_version}" \
		-o "build/netcap" "./cmd"
}

package() {
    cd "${srcdir}/go/src/github.com/dreadl0ck/netcap"

    install -Dm755 "build/netcap" "${pkgdir}/usr/bin/go-netcap"
    install -Dm644 "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
