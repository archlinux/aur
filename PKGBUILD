# Maintainer: Roald Clark <roaldclark@gmail.com>

_name=renpy
_pkgname="${_name}-sdk"
pkgname="${_pkgname}-bin"
pkgver=8.4.1.25072401
_pkgver="${pkgver%.*}"
pkgrel=1
pkgdesc="A visual novel engine"
arch=('x86_64')
url="https://github.com/${_name}/${_name}"
license=('MIT')
depends=(
    'bash'
    'gcc-libs'
    'glibc'
)
optdepends=(
    'kdialog: KDE dialog support'
    'zenity: GNOME dialog support'
)
provides=("${_name}=${_pkgver}" "${_pkgname}=${_pkgver}")
conflicts=("${_name}" "${_pkgname}")
options=('!debug' '!strip')
install="${_pkgname}.install"
source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/renpy-${_pkgver}-sdk.tar.bz2"
        "${_name}.desktop")
b2sums=('0704da0ab85d60f6f1e6c910f93098d05ebd5e39ac7a19b899c8597fb8072efc35ed5d70b7728179c9894b873f5898652a98916cc0c80bb1f8b994d610b22320'
        'ea985387093fea3fa08fe4784221bba5eceecc261b535275c235052a14fd8f09a58ebcd4fcdd6368db41ee4e58ce14f41db5c875d37921435f6f2e46ab3acbd1')

prepare() {
    cd "${srcdir}/${_name}-${_pkgver}-sdk"
    rm --recursive --verbose lib/py3-mac-universal lib/py3-windows-x86_64 renpy.app renpy.exe update
}

package() {
    cd "${srcdir}/${_name}-${_pkgver}-sdk"
    install -dm0755 "${pkgdir}/opt/${_pkgname}"
    cp --recursive --no-dereference --preserve=links --no-preserve=ownership --verbose . "${pkgdir}/opt/${_pkgname}"
    install -dm0755 "${pkgdir}/usr/bin"
    ln --symbolic --relative --verbose "${pkgdir}/opt/${_pkgname}/${_name}.sh" "${pkgdir}/usr/bin/${_name}"
    install -dm0755 "${pkgdir}/usr/share/icons"
    ln --symbolic --relative --verbose "${pkgdir}/opt/${_pkgname}/launcher/game/images/window-icon.png" "${pkgdir}/usr/share/icons/${_name}.png"
    install -dm0755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln --symbolic --relative --verbose "${pkgdir}/opt/${_pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm0644 "${srcdir}/${_name}.desktop" -t "${pkgdir}/usr/share/applications/"
}
