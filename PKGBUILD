# Maintainer: LinRs <LinRs at users.noreply.github.com>

pkgname=emacs-helm-git
_pkgname=helm
pkgver=v3.2.r18.g1424ee4c
pkgrel=1
pkgdesc="Emacs incremental completion and selection narrowing framework"
url="https://github.com/emacs-helm/helm"
arch=('any')
license=('GPL3')
depends=('emacs' 'emacs-async')
makedepends=('git')
provides=('emacs-helm=${pkgver}')
conflicts=('emacs-helm')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname}"
    make PREFIX="/usr"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/usr/share/emacs/site-lisp/${_pkgname}"
    make install PREFIX="${pkgdir}/usr/"
    # delete soft link to your chroot directory
    rm "${pkgdir}/usr/bin/helm" -Iv
}
