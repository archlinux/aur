# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
_pkgname=commento-ce
pkgname=commento-ce-git
pkgver=r117.0ee43ae
pkgrel=1
pkgdesc="A privacy-focused and bloat-free Disqus alternative"
arch=("x86_64")
makedepends=("go" "npm")
url="https://commento.io/"
license=("MIT")
install=$pkgname.install
source=("git+https://gitlab.com/commento/commento-ce.git")
sha256sums=('SKIP')

prepare() {
    export PATH="${PATH}:${srcdir}/bin"
    mkdir -p src/gitlab.com/commento
    cd src/gitlab.com/commento
    ln -s "${srcdir}"/"${_pkgname}" .
}

build() {
    export PATH="${PATH}:${srcdir}/bin"
    export GOPATH="$(pwd)"
    cd "${GOPATH}/src/gitlab.com/commento/${_pkgname}"
    make prod
}

package() {
    cd "${GOPATH}/src/gitlab.com/commento/${_pkgname}"
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    mv etc/linux-systemd/${_pkgname}.service "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
    mkdir -p "$pkgdir/usr/bin/system"
    mv build/prod/${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
    mkdir -p "$pkgdir/usr/share"
    mv build/prod "$pkgdir/usr/share/${_pkgname}"
    mkdir -p "$pkgdir/usr/share/licenses/${_pkgname}"
    mv LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

pkgver() {
    cd src/gitlab.com/commento/"${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
