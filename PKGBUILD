# Maintainer: Zoltan Guba <zoltan.guba@gubamm.hu>
# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
# Developer: Maxime Rijnders <ximi.obs@gmail.com>
_pkgbase=SysTray-X
_pkgname=systray-x
pkgname=systray-x-git
pkgver=0.9.12.r2.gdb2ff67
pkgrel=1
pkgdesc="SysTray-X is a system tray extension for Thunderbird 68+. The addon uses the WebExtension API's to control an external system dependent system tray application."
arch=('any')
url="https://github.com/Ximi1970/systray-x"
license=('MPL2')
groups=(internet)
depends=('qt6-base')
makedepends=('git' 'zip' 'unzip' 'libx11' 'strip-nondeterminism')
provides=('systray-x-git')
optdepends=('betterbird' 'thunderbird') # marked as optional to allow using either, but be aware that this program won't work without one of these two!
conflicts=('systray-x')
source=("git+$url"
        'Makefile.patch'
        'binary_path.patch')
b2sums=('SKIP'
        '28b7ea18696ea3293a41a9a81baae7c33e69f09365412306631af2396f7d6fb23dcfb8e3c2f34543ef1c0d82db1ce0718a3b5ddcb14a38f4a89f6457a789e6a2'
        'bfaf91fb20cbd9ebbe639386fbad57c0d9d88f2ae95ddb9f50cf461c745a4ee5e05efaf0cec0b6f082d4276f3e380057820d56618c8334ef77a06ae242186307')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 -i "../binary_path.patch" && patch -Np1 -i "../Makefile.patch"
}

build() {
    cd "$_pkgname"
    make OPTIONS="DEFINES+=NO_KDE_INTEGRATION" APP="systray-x-common"
    strip-nondeterminism -t zip systray-x@Ximi1970.xpi
}

package() {
    cd "$_pkgname"
    install -Dm 755 "app/-build/${_pkgbase}-app/${_pkgbase}" "${pkgdir}/usr/bin/${_pkgbase}"
    install -Dm 644 "app/${_pkgbase//-/_}.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/${_pkgbase//-/_}.json"
    install -Dm 644 "${_pkgname}@Ximi1970.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_pkgname}@Ximi1970.xpi"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    sed -i 's/\/path\/to\/native-messaging\/app/\/usr\/bin/g' "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/SysTray_X.json"
}
