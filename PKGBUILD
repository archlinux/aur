# Maintainer: Valerii Huz <ghotrix at gmail dot com>
# Co-maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=nibbler-git
_pkgname=nibbler
pkgver=2.4.0
pkgrel=2
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
    tag=$(git tag | grep -vE "rc|hotfix" | sort -rh | head -n 1)
    echo ${tag#v}
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git checkout $(git tag | grep -vE "rc|hotfix" | sort -rh | head -n 1)
}

build() {
    cd "${srcdir}/${_pkgname}"
    # launch script
    echo -e "#!/usr/bin/env bash \nelectron /opt/${_pkgname}" > ${_pkgname}
}

package() {
    cd "${srcdir}/${_pkgname}"
    # source
    mkdir -p ${pkgdir}/opt
    cp -r files/src ${pkgdir}/opt/${_pkgname}
    # bin
    install -Dm755 -t ${pkgdir}/usr/bin ${_pkgname}
    # desktop entry
    install -Dm644 -t ${pkgdir}/usr/share/applications files/res/linux/${_pkgname}.desktop
    # icon
    install -Dm644 -t ${pkgdir}/usr/share/icons/hicolor/512x512/apps files/res/${_pkgname}.png
    install -Dm644 -t ${pkgdir}/usr/share/icons/hicolor/scalable/apps files/res/${_pkgname}.svg
}
