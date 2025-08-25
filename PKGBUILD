# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=videoduplicatefinder
pkgname=${_pkgname}-git
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
pkgver=3.0.x.r327.g553013a
pkgrel=1
pkgdesc="Video Duplicate Finder is a cross-platform software to find duplicated video (and image) files on hard disk based on similiarity"
arch=('x86_64')
url="https://github.com/0x90d/videoduplicatefinder"
license=('AGPL-3.0-or-later')
depends=(
    'dotnet-runtime-9.0'
    'ffmpeg'
)
makedepends=(
    'git'
    'dotnet-sdk-9.0'
)
source=(
    "git+${url}.git"
    'videoduplicatefinder.desktop'
    'videoduplicatefinder.in'
)
sha256sums=('SKIP'
            'c0e14e0349207eee2c40b9e0d576128cf7d773ef4a487500c8b558095ef5f675'
            '1d7e95bd69a6e0579293c20e458c9145cb993b0b379d771e05d3fa8383675edc')
install="${pkgname}.install"

_sed_escape() {
    echo "${1}" | sed 's/[]\/&.*$^[]/\\&/g'
}

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    dotnet publish ./VDF.GUI/VDF.GUI.csproj -c Release -v q --self-contained -r "linux-x64" -o "outputFolder"
}

package() {
    install -d "${pkgdir}/usr/share/${_pkgname}"
    mv "${_pkgname}/outputFolder"/* "${pkgdir}/usr/share/${_pkgname}"

    install -d "${pkgdir}/usr/bin"
    sed "s/@PACKAGE_VERSION@/$(_sed_escape "${pkgver}")/g" "${_pkgname}.in" > "${pkgdir}/usr/bin/$_pkgname"
    chmod +x "${pkgdir}/usr/bin/$_pkgname"

    install -d "$pkgdir/usr/share/applications"
    install -Dm755 videoduplicatefinder.desktop "$pkgdir/usr/share/applications"
}
