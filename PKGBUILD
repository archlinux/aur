# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=unity-system-compositor-bzr
pkgver=191
pkgrel=1
pkgdesc="System compositor for Ubuntu"
arch=(i686 x86_64)
url="https://launchpad.net/unity-system-compositor"
license=(GPL)
depends=(boost cairo lightdm mesa-mir mir protobuf qt5-base xorg-server-mir)
makedepends=(cmake)
provides=(unity-system-compositor)
conflicts=(unity-system-compositor)
options=(!emptydirs)
source=(bzr+https://code.launchpad.net/~unity-system-compositor-team/unity-system-compositor/trunk)
sha512sums=('SKIP')

pkgver() {
    cd trunk
    bzr revno
}

build() {
    cd trunk
    cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DMIR_ENABLE_TESTS=OFF
    make
}

package() {
    cd trunk
    make DESTDIR="${pkgdir}/" install

    mv "${pkgdir}"/usr/{sbin/*,bin/}

    install -dm755 "${pkgdir}"/usr/share/lightdm/lightdm.conf.d/
    install -m644 debian/10-unity-system-compositor.conf \
                  "${pkgdir}"/usr/share/lightdm/lightdm.conf.d/

    install -m755 debian/unity-system-compositor.sleep "${pkgdir}"/usr/bin/
    sed -i 's/sbin/bin/g' "${pkgdir}"/usr/bin/unity-system-compositor.sleep
}
