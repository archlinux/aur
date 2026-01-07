# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=ospd-openvas
pkgver=22.10.0
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
sha512sums=('213b5308d92125d2d4f3441c5c46268bbe5a663eaaa9dda1e234653febedc717c1f0d715d525460f6e2c0f591dd4b260f8f0efb5774856dd8196a9683ef05196'
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

