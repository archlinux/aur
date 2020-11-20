# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='openwebrx'
pkgver='0.20.0'
pkgrel='1'
pkgdesc='Open source, multi-user SDR receiver software with a web interface'
arch=('i686' 'x86_64')
url='https://www.openwebrx.de/'
license=('AGPL3')
depends=('csdr>=0.17' 'rtl-sdr' 'js8py' 'owrx_connector')
optdepends=('sox' 'mbelib' 'digiham' 'dsd' 'codec2' 'direwolf')
source=("https://github.com/jketterl/openwebrx/archive/$pkgver.tar.gz")
sha256sums=('1531c9f55706d3245c4c0b01a5de45fa8cae9841b1721f19803e1d17fc7936f5')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i "2 a import sys\n\nsys.path.insert(1, \"/usr/lib/openwebrx\")\n" openwebrx.py
}

package() {
    pwd
    install -Dm 0644 ../sysusers.conf ${pkgdir}/usr/lib/sysusers.d/openwebrx.conf
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 openwebrx.py ${pkgdir}/usr/bin/openwebrx
    find owrx -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/python3.8/{}" \;
    find csdr -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/python3.8/{}" \;
    find htdocs -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/openwebrx/{}" \;
    install -Dm 0644 config_webrx.py ${pkgdir}/etc/openwebrx/config_webrx.py
    install -Dm 0644 systemd/openwebrx.service ${pkgdir}/usr/lib/systemd/system/openwebrx.service
}
