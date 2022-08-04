# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='openwebrx'
pkgver='1.2.0'
pkgrel='2'
pkgdesc='Open source, multi-user SDR receiver software with a web interface'
arch=('i686' 'x86_64')
url='https://www.openwebrx.de/'
license=('AGPL3')
depends=('csdr>=0.17' 'python-csdr' 'rtl-sdr' 'python-js8py' 'owrx_connector' 'netcat')
optdepends=('sox' 'mbelib' 'digiham' 'dsd' 'codec2' 'direwolf')
backup=('etc/openwebrx/config_webrx.py')
source=("https://github.com/jketterl/openwebrx/archive/$pkgver.tar.gz")
sha256sums=('77a9573a22f6c65277ec0aeb4599aa6aee3a7873e3f651e7438f41baa12c38b3')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i "2 a import sys\n\nsys.path.insert(1, \"/usr/lib/openwebrx\")\n" openwebrx.py
}

package() {
    pwd
    install -Dm 0644 ../sysusers.conf ${pkgdir}/usr/lib/sysusers.d/openwebrx.conf
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 0755 openwebrx.py ${pkgdir}/usr/bin/openwebrx
    PYTHON_VER=$(python --version | grep -E -o '[0-9]+\.[0-9]+')
    find owrx -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/python$PYTHON_VER/{}" \;
    find csdr -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/python$PYTHON_VER/{}" \;
    find htdocs -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/openwebrx/{}" \;
    install -Dm 0644 config_webrx.py ${pkgdir}/etc/openwebrx/config_webrx.py
    install -Dm 0644 systemd/openwebrx.service ${pkgdir}/usr/lib/systemd/system/openwebrx.service
    install -dm 0755 -o openwebrx -g openwebrx ${pkgdir}/var/lib/openwebrx
}
