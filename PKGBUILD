# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: tjbp (archlinux@tjbp.net)

pkgname='openwebrx-plus'
_pkgname='openwebrx'
pkgver='1.2.41'
pkgrel='1'
pkgdesc='Open source, multi-user SDR receiver software with a web interface'
arch=('any')
url='https://luarvique.github.io/ppa/'
license=('AGPL3')
depends=('csdr' 'python-csdr' 'rtl-sdr' 'js8py' 'owrx_connector' 'netcat' 'python-setuptools')
optdepends=('sox' 'mbelib' 'digiham' 'dsd' 'codec2' 'direwolf')
source=("$pkgname-$pkgver".tar.gz::"https://github.com/luarvique/openwebrx/archive/$pkgver.tar.gz"
        'openwebrx-plus.sysusers' 'openwebrx-plus.tmpfiles')
sha256sums=('4e634e7bef4036ebaa734098fae94c99a2594f0e1e48eecedeb89848557988ac'
            '1a675698545a28c2645a925a8c2bd70775a0a45af44d918499e63e7e21510bfe'
            'c5fd92043b7d380c16a12cdc627b78c4c753ff11a469c2a7692c29851ebfe7c3')
provides=('openwebrx')
conflicts=('openwebrx')

prepare() {
    cd "$srcdir/openwebrx-$pkgver"
    sed -i "2 a import sys\n\nsys.path.insert(1, \"/usr/lib/openwebrx\")\n" openwebrx.py
}

package() {
    install -Dm 0644 ${srcdir}/$pkgname.sysusers ${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf
    install -Dm 0644 ${srcdir}/$pkgname.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf

    cd "$srcdir/openwebrx-$pkgver"
    install -Dm 0755 openwebrx.py ${pkgdir}/usr/bin/openwebrx
    PYTHON_VER=$(python --version | grep -E -o '[0-9]+\.[0-9]+')
    find owrx -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/python$PYTHON_VER/{}" \;
    find csdr -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/python$PYTHON_VER/{}" \;
    find htdocs -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/openwebrx/{}" \;
    #install -Dm 0644 config_webrx.py ${pkgdir}/etc/openwebrx/config_webrx.py
    for config in bands.json bookmarks.json openwebrx.conf; do
        install -Dm 0644 ${config} ${pkgdir}/etc/openwebrx/${config}
    done
    for config in bookmarks.d/*; do
        install -Dm 0644 ${config} ${pkgdir}/etc/openwebrx/${config}
    done

    install -Dm 0644 systemd/openwebrx.service ${pkgdir}/usr/lib/systemd/system/openwebrx.service
}
