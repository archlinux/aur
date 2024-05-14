# Maintainer: Eugene Gershnik <gershnik@hotmail.com>
pkgname='wsdd-native'
pkgver='1.12'
pkgrel=2
pkgdesc='WS-Discovery Host Daemon'
arch=('x86_64')
url='https://github.com/gershnik/wsdd-native'
license=('BSD-3-Clause')
depends=('glibc' 'gcc-libs')
makedepends=('cmake>=3.25' 'make' 'gcc>=11.3' 'git' 'patch' 'libsystemd')
conflicts=('wsdd')
backup=('etc/wsddn.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gershnik/wsdd-native/archive/v$pkgver.tar.gz")
sha256sums=('370fb5cbaf581158774dee3e00ddc7703219ed0578637a39f79a0d7f74e8e3a8')


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
    install -Dm 0644 out/wsddn.conf $pkgdir/etc/wsddn.conf
    install -Dm 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

