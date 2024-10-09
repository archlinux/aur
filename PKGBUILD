# Maintainer: Eugene Gershnik <gershnik@hotmail.com>
pkgname='wsdd-native'
pkgver='1.15'
pkgrel=2
pkgdesc='WS-Discovery Host Daemon. Makes your machine visible in Network view of Windows Explorer'
arch=('x86_64' 'aarch64')
url='https://github.com/gershnik/wsdd-native'
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs')
makedepends=('cmake>=3.25' 'make' 'gcc>=11.3' 'git' 'patch' 'libsystemd')
conflicts=('wsdd')
backup=('etc/wsddn.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gershnik/wsdd-native/archive/v$pkgver.tar.gz")
sha256sums=('d7939b70507ee521d090fd733407f45685d29e01ea70baab41d0e6668ede5e4d')


build() {
    cd "$pkgname-$pkgver"
    cmake -S . -B out -DCMAKE_BUILD_TYPE=None
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
    install -Dm 0644 config/systemd/etc/ufw/applications.d/wsddn \
                            $pkgdir/etc/ufw/applications.d/wsddn
    install -Dm 0644 out/wsddn.conf $pkgdir/etc/wsddn.conf
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

