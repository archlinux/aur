# Maintainer: SoftExpert <softexpert at gmail dot com>
_pkgname=dnstrack
pkgname=${_pkgname}-git
pkgver=r7.gc4dbcb1
pkgrel=2
pkgdesc="A dns-query tracking tool written in go. dnstrack helps to track all dns query on your machine in real time."
arch=(x86_64)
url='https://github.com/chenjiandongx/dnstrack'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
replaces=(${_pkgname})
depends=()
install=dnstrack.install
makedepends=('git' 'go')
source=("${_pkgname}::git+https://github.com/chenjiandongx/dnstrack.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}" 
    go get -u github.com/chenjiandongx/dnstrack
    echo "::: Building binary" # (-trimpath ${srcdir}/${_pkgname})
    CGO_ENABLED=1 GOOS=linux go build -tags linux -ldflags="-w -s -linkmode external" -v -gcflags "-trimpath ${srcdir}/${_pkgname}" -o ${_pkgname} .
    # go install -v -gcflags "-trimpath ${srcdir}/${_pkgname}" 
    # setcap cap_net_raw,cap_net_admin=eip ${_pkgname}
}

package() {
	cd "${srcdir}/${_pkgname}" 
    echo "::: Installing binaries"
    # cd "${srcdir}/${_pkgname}/bin" 
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
     
    # cd "${srcdir}/${_pkgname}" 
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
