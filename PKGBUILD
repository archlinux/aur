# Maintainer: DJ Lucas <dj@linuxfromscratch.org>

pkgname=('python-doh-proxy')
pkgver=0.0.9
pkgrel=2
pkgdesc="Client and server software to query DNS over HTTPS, using Google DNS-over-HTTPS protocol"
pkgrelname='doh-proxy'
url="https://github.com/facebookexperimental/${pkgrelname}"
arch=('x86_64')
license=('BSD')
install=doh-proxy.install
makedepends=('python>=3.7')
depends=('python-aioh2'
         'python-aiohttp'
         'python-aiohttp_remotes'
         'python-dnspython')
backup=('etc/conf.d/doh-httpproxy'
        'etc/conf.d/doh-proxy'
        'etc/conf.d/doh-stub')
source=("$url/archive/v$pkgver.tar.gz"
        'doh-httpproxy.confd'
        'doh-httpproxy.service'
        'doh-proxy.confd'
        'doh-proxy.service'
        'doh-stub.confd'
        'doh-stub.service')
sha256sums=('d8d0e4ae9e34a0394395463b209c76f60cb8e8056b38f855aa217ad7af8c2873'
            'aa41dc60efd9e7eb3bceb59811a94bb188ca7e183ec88633c51ca259bf05f846'
            'd637e19f8412c0ebfea4f2eb20a594d57b1e2fdce386505c974c27de190c124b'
            '2dfc14742427093216f15f7fd5e9811223a48bfba547b63d621c01b817564edd'
            'a08214e85ce485f4d2964c8d9943b30c92cd9353d19e31ddbc571c3cfb70846d'
            'dc415fc6a44107cbb82ecc725c9e5bb533499bd133e76427ff2a8b5f02ebbe7e'
            '83df49c7ea461a71e9b63fae437fba3c4dd03048ba3d99c3022e75c866606a8a')

build() {
    cd "${srcdir}/${pkgrelname}-${pkgver}"
    python3 setup.py build
}

package() {
    cd "${srcdir}/${pkgrelname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}"
    install -vdm755 "${pkgdir}/usr/lib/systemd/system"
    install -vdm755 "${pkgdir}/etc/conf.d"
    install -vm644 "${srcdir}/doh-httpproxy.confd" \
                   "${pkgdir}/etc/conf.d/doh-httpproxy"
    install -vm644 "${srcdir}/doh-proxy.confd" \
                   "${pkgdir}/etc/conf.d/doh-proxy"
    install -vm644 "${srcdir}/doh-stub.confd" \
                   "${pkgdir}/etc/conf.d/doh-stub"
    install -vm644 "${srcdir}/doh-httpproxy.service" \
                   "${pkgdir}/usr/lib/systemd/system/"
    install -vm644 "${srcdir}/doh-proxy.service" \
                   "${pkgdir}/usr/lib/systemd/system/"
    install -vm644 "${srcdir}/doh-stub.service" \
                   "${pkgdir}/usr/lib/systemd/system/"
}
# vim:set ts=4 sw=4 et:
