# Maintainer: Valerii Huz <ghotrix at gmail dot com>
pkgname=nibbler-git
_pkgname=nibbler
pkgver=2.1.4
pkgrel=1
pkgdesc="Leela Chess Zero (Lc0) interface"
arch=('i686' 'x86_64')
url="https://github.com/rooklift/nibbler"
license=('GPLv3')
depends=('electron')
makedepends=('git')
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    tag=$(git tag|grep -vE "rc|hotfix"|sort -rh|head -n 1)
    echo ${tag#v}
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git checkout $(git tag|grep -v rc|sort -rh|head -n 1)
}

build() {
    cd "${srcdir}/${_pkgname}"
    printf "#!/usr/bin/env bash \nelectron /opt/${_pkgname}" > nibbler
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -m755 -d "${pkgdir}/opt/${_pkgname}/modules"
    install -m755 -d "${pkgdir}/opt/${_pkgname}/pieces"
    cp -r "$srcdir/${_pkgname}"/files/src/modules/* "${pkgdir}/opt/${_pkgname}/modules"
    cp -r "$srcdir/${_pkgname}"/files/src/pieces/* "${pkgdir}/opt/${_pkgname}/pieces"
    cp -r "$srcdir/${_pkgname}"/files/src/*.{css,html,js,json} "${pkgdir}/opt/${_pkgname}"
    install -Dm755 nibbler $pkgdir/usr/bin/nibbler
}
