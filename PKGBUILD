pkgname=setuid-sandbox-git
pkgver=r22.54e3ab3
pkgrel=1
pkgdesc="A suid helper to let a process willingly drop privileges on Linux."
arch=('i686' 'x86_64')
url="https://code.google.com/p/setuid-sandbox/"
license=('Apache')
depends=('libcap')
makedepends=('gcc' 'git')
source=("${pkgname}::git+https://code.google.com/p/${pkgname%-*}")
sha512sums=('SKIP')
_branch=master

pkgver() {
    cd "${srcdir}/${pkgname}"
    git checkout ${_branch} --quiet
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^jacktrip.//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${srcdir}/${pkgname}"
    git checkout ${_branch}
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install sandboxme "${pkgdir}/usr/bin"
    chmod 4511 "${pkgdir}/usr/bin/sandboxme"
}
