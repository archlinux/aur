# Maintainer: SoftExpert <softexpert at gmail dot com>
_pkgname=httpseal
pkgname=${_pkgname}-git
pkgver=r41.gfb79aa8
pkgrel=1
pkgdesc="A Linux command-line tool for intercepting and analyzing HTTPS/HTTP traffic from specific processes using namespace isolation and DNS hijacking."
arch=(x86_64)
url='https://github.com/hmgle/httpseal'
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
replaces=(${_pkgname})
depends=( glibc )
install=httpseal.install
makedepends=('git' 'go')
source=("${_pkgname}::git+https://github.com/hmgle/httpseal.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}" 
    # go get -u https://github.com/hmgle/httpseal
    echo "::: Building binary" # (-trimpath ${srcdir}/${_pkgname})
    CGO_ENABLED=1 GOOS=linux go build -tags linux -ldflags="-w -s -linkmode external" -v -gcflags "-trimpath ${srcdir}/${_pkgname}" -o ${_pkgname} ./cmd/httpseal
}

package() {
	cd "${srcdir}/${_pkgname}" 
    echo "::: Installing binaries"
    # cd "${srcdir}/${_pkgname}/bin" 
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
     
    # cd "${srcdir}/${_pkgname}" 
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
