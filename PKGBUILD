# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=ospd-openvas
pkgver=22.10.5
pkgrel=1
pkgdesc='OSP Server for openvas'
arch=('x86_64')
url="https://github.com/greenbone/ospd-openvas"
license=('AGPL-3.0-only')
depends=('openvas-scanner' 'python-redis' 'python-psutil' 'python-packaging' 'python-lxml' 'python-defusedxml' 'python-deprecated' 'python-paho-mqtt' 'python-gnupg')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry')
provides=('python-ospd-openvas')
conflicts=('python-ospd-openvas')
groups=('greenbone-vulnerability-manager')
backup=("etc/gvm/ospd-openvas.conf")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        ${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.gz.asc
        gvm.sysusers)
sha512sums=('2f82d134aaf37bfe2bb112291b7432d6977990fc0074e8d74c6d8c1b11c2c0cd17c065bae37453d60f8830b130c6e4dc179b7751025d1051d2e09d7d4dd7112c'
            'SKIP'
            '41cce63de96443788dd0209e164e0162c1a2116ba46ccf565672027778c60ce79ada6e7347edf0250a77d3e7959b3b76040da036fc59ce1cb7ba7b09ec4c93c9')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity


build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm 644 config/ospd-openvas.conf -t "${pkgdir}"/etc/gvm
    install -Dm 644 config/ospd-openvas.service -t "${pkgdir}"/usr/lib/systemd/system
    install -Dm 644 "${srcdir}"/gvm.sysusers "${pkgdir}"/usr/lib/sysusers.d/gvm.conf
}

