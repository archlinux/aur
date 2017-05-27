#!/bin/bash
# Maintainer: Nissar Chababy <funilrys at outlook dot com>

_pkg_short_name='kaku'

pkgname=kaku-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="The next generation music client."
arch=('x86_64' 'i686')
url="http://kaku.rocks"
license=('MIT')
depends=('gconf' 'gtk2' 'fuse' 'xdg-utils' 'libxtst' 'libxss' 'nss' 'alsa-lib')
conflicts=('kaku')
install='kaku-bin.install'
options=(!strip)

source=("https://raw.githubusercontent.com/EragonJ/Kaku/master/LICENSE" "http://kaku.rocks/public/img/logo.png")
source_x86_64=("https://github.com/EragonJ/Kaku/releases/download/$pkgver/Kaku-$pkgver.tar.gz")
source_i686=("https://github.com/EragonJ/Kaku/releases/download/$pkgver/Kaku-$pkgver-ia32.tar.gz")

sha512sums=('354016d1de60b330e50f996dcdf61989091b44b28f096f7cb83f83c006cb2d51ef3da94a49d2ba73b71bc294a206a524d38a6b3c0f5bf1cc3ac6048d57624b04' 'fbc59e8bc4b3e39bbdf75a824e3f1e3accd372bf1fda194ec433443feff88158a0df14cac0f3a1a3aef18ada98c3b02b40b5b254d1096ae28e3a84aace8b842f')
sha512sums_x86_64=('430fb9fa12cf39f354c6d872e250b7f8695eafb9220df8dc8d0f16cd624e684cb8faa2c2d90ec70ff2c701fa41ff29f9684850d48a844fef95ef308e9605b5dd')
sha512sums_i686=('8e4d172e420b46062d398360ac46bcaea9eb697e29becc5c56054c876ec90614bcf6a520dcd4b1c5d071c0fa39e94fbd7fc0b2b68b8be0f02541661505a6a320')

package() {
    install -d ${pkgdir}{/usr/share/applications,/usr/{bin,share/${pkgname}/}}

    if [ $CARCH == "x86_64" ]
    then
        cp -r ${srcdir}/Kaku-${pkgver}/* ${pkgdir}/usr/share/${pkgname}
    else
        cp -r ${srcdir}/Kaku-${pkgver}-ia32/* ${pkgdir}/usr/share/${pkgname}
    fi
    sed -i "s|Icon=/usr/share/kaku/logo.png|Icon=/usr/share/${pkgname}/logo.png|g" ${pkgdir}/usr/share/${pkgname}/misc/linux/*.desktop

    install -Dm644 ${srcdir}/logo.png ${pkgdir}/usr/share/${pkgname}/
    install -Dm644 ${pkgdir}/usr/share/${pkgname}/misc/linux/kaku.desktop ${pkgdir}/usr/share/applications/
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    chgrp -R audio ${pkgdir}/usr/share/${pkgname}
    chmod -R 775 ${pkgdir}/usr/share/${pkgname}

    ln -s /usr/share/${pkgname}/kaku ${pkgdir}/usr/bin/${_pkg_short_name}
}
