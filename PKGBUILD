# Maintainer: Pawel Mosakowski <pawel at mosakowski dot net>
pkgname=appgate-sdp-5
conflicts=('appgate-sdp-headless' 'appgate-sdp')
pkgver=5.0.3
_download_pkgver=$(expr match "$pkgver" '\([[:digit:]]\+\.[[:digit:]]\+\)')
_download_pkgname='appgate-sdp'
pkgrel=1
epoch=
pkgdesc="Software Defined Perimeter v5 - GUI client"
arch=('x86_64')
url="https://www.cyxtera.com/essential-defense/appgate-sdp/support"
license=('custom')

# dependecies calculated by namcap
depends=('gconf' 'libsecret' 'gtk3' 'python' 'nss' 'libxss' 'nodejs' 'dnsmasq')
source=("https://sdpdownloads.cyxtera.com/AppGate-SDP-${_download_pkgver}/clients/${_download_pkgname}_${pkgver}_amd64.deb"
        "appgatedriver.service"
        "nm.py.patch")

options=(staticlibs)

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -dpr "${srcdir}"/{etc,lib,opt,usr} "${pkgdir}"
    mv -v "$pkgdir/lib/systemd/system" "$pkgdir/usr/lib/systemd/"
    rm -vrf "$pkgdir/lib"

    cp -v "$srcdir/appgatedriver.service" "$pkgdir/usr/lib/systemd/system/appgatedriver.service"
    patch "$pkgdir/opt/appgate/linux/nm.py" "$srcdir/nm.py.patch"

    mkdir -vp "$pkgdir/usr/share/licenses/appgate-sdp"
    cp -v "$pkgdir/usr/share/doc/appgate/copyright" "$pkgdir/usr/share/licenses/appgate-sdp"
    cp -v "$pkgdir/usr/share/doc/appgate/LICENSE.github" "$pkgdir/usr/share/licenses/appgate-sdp"
    cp -v "$pkgdir/usr/share/doc/appgate/LICENSES.chromium.html.bz2" "$pkgdir/usr/share/licenses/appgate-sdp"
}
md5sums=('1ffc310a4aea80fb8574f7d3eaa611ec'
         '002644116e20b2d79fdb36b7677ab4cf'
         'c36c11d995cc341f2f1eb4c3b6afa732')
