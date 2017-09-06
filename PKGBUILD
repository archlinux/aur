# Maintainer: Ondrej Vlk <ondrej.vlk[at]fuf[dot]name>
# Maintainer: Jan Porhincak <kenaco666[at]gmail[dot]com>

readonly REPO="github.com/seznam/goenvtemplator"

pkgname=goenvtemplator-git
pkgver=v2.0.0.rc3.r0.g5875fda
pkgbase=goenvtemplator
_tag="v2.0.0-rc3"
pkgrel=1
pkgdesc='Tool to template configuration files by environment variables and optionally replace itself with the target binary.'
arch=('i686' 'x86_64')
url="https://${REPO}"
license=('LGPL3')
makedepends=('go' 'git')
source=("git+https://github.com/seznam/goenvtemplator.git#tag=${_tag}")
sha256sums=("SKIP")

pkgver() {
    cd "${pkgbase}"
    git describe --long --tags | sed 's/\([^-]-g\)/r\1/;s/-/./g'
}


prepare() {
    rm -rf "${srcdir}/src"
    mkdir -p "${srcdir}/src/$(dirname "${REPO}")"
    mv "${srcdir}/${pkgbase}" "${srcdir}/src/${REPO}"
    ln -s "src/${REPO}" "${srcdir}/${pkgbase}"
}

build() {
    cd "${srcdir}/src/${REPO}"
    export GOPATH="${srcdir}"
    which glide >/dev/null 2>&1 ||  go get github.com/Masterminds/glide
    $GOPATH/bin/glide i
    make build
}

package() {
    cd "${srcdir}/${pkgbase}"
    make DESTDIR="${pkgdir}" install
}
