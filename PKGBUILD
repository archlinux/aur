#!/usr/bin/env bash
# shellcheck disable=2034,2154
# Maintainer: Hunter Peavey < printf "dev@die.bots" | sed "s/die.bots/krathalan.net/g" >
# Contributor: Pierre Choffet

pkgname=gmnisrv-git
_pkgname=gmnisrv
pkgrel=1
pkgver=r88.fbef1d3
pkgdesc="A high-performance Gemini server for POSIX systems"
url="https://git.sr.ht/~sircmpwn/gmnisrv"
arch=("any")
license=("GPL")
depends=("openssl" "mailcap")
makedepends=("git" "scdoc")

source=("gmnisrv::git+${url}" gmnisrv.service)
md5sums=('SKIP'
         'd6c15f32c646a89f85e5b19e83756146')

pkgver() {
    cd "${_pkgname}" || exit
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}" || exit

    mkdir build
    cd build || exit
    ../configure --prefix=/usr
    make PREFIX="/usr"
}

package() {
    cd "${_pkgname}/build" || exit
    make PREFIX="/usr" DESTDIR="$pkgdir" install

    # Move conf file into etc
    mkdir "${pkgdir}/etc"
    mv "${pkgdir}/usr/share/gmnisrv/gmnisrv.ini" "${pkgdir}/etc"
    rmdir "${pkgdir}/usr/share/gmnisrv"

    # Copy systemd service
    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    cp "${srcdir}/gmnisrv.service" "${pkgdir}/usr/lib/systemd/system"
}
