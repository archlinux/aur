# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

_pkgname=videoduplicatefinder
pkgname=${_pkgname}-git
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
pkgver=3.0.x.r279.g313d89a
pkgrel=1
pkgdesc="Video Duplicate Finder is a cross-platform software to find duplicated video (and image) files on hard disk based on similiarity"
arch=('x86_64')
url="https://github.com/0x90d/videoduplicatefinder"
license=('GPL3')
depends=('dotnet-runtime' 'ffmpeg')
makedepends=('git' 'dotnet-sdk')
source=("git+${url}.git" 'videoduplicatefinder.desktop')
sha256sums=('SKIP' 'c0e14e0349207eee2c40b9e0d576128cf7d773ef4a487500c8b558095ef5f675')
install="${pkgname}.install"

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    dotnet publish ./VDF.GUI/VDF.GUI.csproj -c Release -v q --self-contained -r "linux-x64" -o "outputFolder"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    mv "${_pkgname}/outputFolder"/* "${pkgdir}/opt/${_pkgname}"

    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${_pkgname}/VDF.GUI" "${pkgdir}/usr/bin/$_pkgname"

    install -d "$pkgdir/usr/share/applications"
    install -Dm755 videoduplicatefinder.desktop "$pkgdir/usr/share/applications"
}
