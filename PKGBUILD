# Maintainer: Eugene Gershnik <gershnik@hotmail.com>
pkgname='wsdd-native'
pkgver='1.22'
pkgrel=1
pkgdesc='WS-Discovery Host Daemon. Makes your machine visible in Network view of Windows Explorer'
arch=('x86_64' 'aarch64')
url='https://github.com/gershnik/wsdd-native'
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs')
makedepends=('cmake>=3.25' 'make' 'gcc>=11.3' 'git' 'libsystemd')
backup=('etc/wsddn.conf')
source=("$pkgname-$pkgver.tar.bz2::https://github.com/gershnik/wsdd-native/releases/download/v$pkgver/wsddn-src-prefetch-$pkgver.tar.bz2")

build() {
    cd "$pkgname-$pkgver"
    cmake -S . -B out -C external/external.cmake -DCMAKE_BUILD_TYPE=None -DFETCHCONTENT_FULLY_DISCONNECTED=ON
    cmake --build out
    cp installers/wsddn.conf out/
    sed -i "s/{RELOAD_INSTRUCTIONS}/# sudo systemctl restart wsddn\n/g" out/wsddn.conf
    sed -i "s/{SAMPLE_IFACE_NAME}/eth0/g" out/wsddn.conf
}

package() {
    cd "$pkgname-$pkgver"
    cmake --install out --prefix $pkgdir/usr 
    install -Dm 0644 config/systemd/usr/lib/systemd/system/wsddn.service \
                            $pkgdir/usr/lib/systemd/system/wsddn.service
    install -Dm 0644 config/firewalls/etc/ufw/applications.d/wsddn \
                            $pkgdir/etc/ufw/applications.d/wsddn
    install -Dm 0644 out/wsddn.conf $pkgdir/etc/wsddn.conf
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm 0644 Acknowledgements.md $pkgdir/usr/share/doc/$pkgname/Acknowledgements.md

}

sha256sums=('8b8d04c625652c51dd0ccd66a8626f15e4ed7a30c3ae90119b1dbe6193a03afa')
