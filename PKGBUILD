pkgname=setuid-sandbox-git
_pkgname=setuid-sandbox
pkgver=r22.54e3ab3
pkgrel=2
pkgdesc="A suid helper to let a process willingly drop privileges on Linux."
arch=('i686' 'x86_64')
url="https://code.google.com/p/setuid-sandbox/"
license=('Apache')
depends=('libcap')
makedepends=('gcc' 'git')
source=("https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/setuid-sandbox/source-archive.zip")
sha512sums=('81fc88c571d032683a5a2fc03bdc7f4548da527d6f6672b5872f9ac4b286aba3efcaf783b0070e6da0b31ea78b64b8f60dc2b730aeca0122ce4d00e17fc7ec04')
_branch=master

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git checkout ${_branch} --quiet
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^jacktrip.//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git checkout ${_branch}
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install sandboxme "${pkgdir}/usr/bin"
    chmod 4511 "${pkgdir}/usr/bin/sandboxme"
}
