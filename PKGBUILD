# Maintainer: Zoltan Guba <zoltan.guba@gubamm.hu>
# Developer: Maxime Rijnders <ximi.obs@gmail.com>

pkgname=systray-x-git
_pkgname=systray-x
pkgver=0.8.0.r0.g0257ad1
pkgrel=1
pkgdesc="SysTray-X is a system tray extension for Thunderbird 68+. The addon uses the WebExtension API's to control an external system dependent system tray application."
arch=('any')
url="https://github.com/Ximi1970/systray-x"
license=('MPL2')
groups=(internet)
depends=(zip gcc glibc hicolor-icon-theme knotifications libx11 qt5-base thunderbird)
makedepends=('git')
provides=('systray-x-git')
conflicts=('systray-x')
source=("git+https://github.com/Ximi1970/systray-x.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    make
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/lib/thunderbird/extensions"
    mkdir -p "${pkgdir}/usr/lib/mozilla/native-messaging-hosts"
    mkdir -p "$pkgdir/usr/share/doc/$_pkgname"
    install -m 755 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${srcdir}/${_pkgname}/README.md" 
    install -m 755 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${srcdir}/${_pkgname}/LICENSE"
    install -m 755 -t "${pkgdir}/usr/lib/thunderbird/extensions" "${srcdir}/${_pkgname}/systray-x@Ximi1970.xpi"
    install -m 755 -t "${pkgdir}/usr/lib/mozilla/native-messaging-hosts" "${srcdir}/${_pkgname}/app/SysTray_X.json"
    sed -i 's/\/path\/to\/native-messaging\/app/\/usr\/bin/g' "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/SysTray_X.json"
    install -m 755 -t "${pkgdir}/usr/bin" "${srcdir}/${_pkgname}/SysTray-X"
}
