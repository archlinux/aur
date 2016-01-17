# Maintainer: Maxqia <contrib@maxqia.com>

pkgname=als-controller
pkgver=20160117
pkgrel=1
pkgdesc="ASUS Zenbook ambient light sensor userspace controller."
arch=('i686' 'x86_64')
url="https://github.com/danieleds/Asus-Zenbook-Ambient-Light-Sensor-Controller"
license=('Apache')
depends=('qt5-base' 'libbsd')
makedepends=('git' 'als-dkms')
provides=('als-controller')
conflicts=('als-controller')
source=("${pkgname}::git+https://github.com/danieleds/Asus-Zenbook-Ambient-Light-Sensor-Controller.git"
	"als-controller.service")
md5sums=('SKIP'
	 'e3a8f7a837f761347487e733e458006a')

prepare() {
    cd ${pkgname}/example
    sed -i 's|/bin/bash|/usr/bin/env bash|;s|"\$DIR"/\.\./service/||' switch.sh
}

build() {
    cd ${pkgname}/service
    [[ "$CARCH" = "x86_64" ]] \
        && qmake als-controller.pro -r -spec linux-g++-64 \
        || qmake als-controller.pro -r -spec linux-g++
    make
}

package() {
    cd $pkgname
    install -Dm644 example/images/active.svg "$pkgdir"/usr/share/als-controller/example/images/active.svg
    install -Dm644 example/images/inactive.svg "$pkgdir"/usr/share/als-controller/example/images/inactive.svg
    install -Dm644 ../als-controller.service "$pkgdir"/usr/lib/systemd/system/als-controller.service
    install -Dm755 example/switch.sh "$pkgdir"/usr/share/als-controller/example/switch.sh
    install -Dm755 service/${pkgname} "$pkgdir"/usr/bin/${pkgname}
}
