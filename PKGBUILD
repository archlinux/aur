# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gomplate-git
pkgver=4.0.0.pre.0.r65.g4ae7c12b
pkgrel=1
pkgdesc='A flexible commandline tool for template rendering.'
arch=(i686 x86_64)
url='https://gomplate.hairyhenderson.ca/'
license=(BSD)
conflicts=('gomplate')
provides=('gomplate')
makedepends=(go)
source=("${pkgname}::git+https://github.com/hairyhenderson/gomplate#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
    cd "${srcdir}/${pkgname}"

    install -m755 -d "${srcdir}/go/src/github.com/hairyhenderson/"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/hairyhenderson/gomplate"
}

build() {
    cd "${srcdir}/go/src/github.com/hairyhenderson/gomplate"

    export GOPATH="${srcdir}/go" GOFLAGS="-modcacherw"
    make
}

package() {
    cd "${srcdir}/go/src/github.com/hairyhenderson/gomplate"

    install -m755 -D "bin/gomplate" "${pkgdir}"/usr/bin/gomplate
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
