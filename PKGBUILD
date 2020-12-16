# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='openwebrx'
pkgver='0.20.1'
pkgrel='3'
pkgdesc='Open source, multi-user SDR receiver software with a web interface'
arch=('i686' 'x86_64')
url='https://www.openwebrx.de/'
license=('AGPL3')
depends=('csdr>=0.17' 'rtl-sdr' 'js8py' 'owrx_connector' 'netcat')
optdepends=('sox' 'mbelib' 'digiham' 'dsd' 'codec2' 'direwolf')
source=("https://github.com/jketterl/openwebrx/archive/$pkgver.tar.gz")
sha256sums=('88dd025734651af9da5973c2ca6329a4b0f1bdd38c0fefa4b8a4ba66842376de')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i "2 a import sys\n\nsys.path.insert(1, \"/usr/lib/openwebrx\")\n" openwebrx.py
}

package() {
    pwd
    install -Dm 0644 ../sysusers.conf ${pkgdir}/usr/lib/sysusers.d/openwebrx.conf
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 openwebrx.py ${pkgdir}/usr/bin/openwebrx
    find owrx -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/python3.9/{}" \;
    find csdr -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/python3.9/{}" \;
    find htdocs -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/openwebrx/{}" \;
    install -Dm 0644 config_webrx.py ${pkgdir}/etc/openwebrx/config_webrx.py
    install -Dm 0644 systemd/openwebrx.service ${pkgdir}/usr/lib/systemd/system/openwebrx.service
}
