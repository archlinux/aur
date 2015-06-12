# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=httpbin
pkgver=0.2.0
pkgrel=1
pkgdesc="HTTP request and response service."
arch=(any)
url="http://pypi.python.org/pypi/httpbin"
license=(ISC)
depends=(python)
makedepends=(python-pip python-setuptools python-virtualenv)
options=(!strip)
#install="${pkgname}.install"
source=(
    "https://pypi.python.org/packages/3.4/h/${pkgname}/${pkgname}-${pkgver}-py2.py3-none-any.whl"
    httpbin.service
    httpbin.confd
)
md5sums=(
    66a4290ddf8f0111253b98d851c5460f # httpbin tarball
    921f3b939d3370d405539b9bafc075af # httpbin service
    418aea521325ca495317590192d505a0 # httpbin conf.d environment
)

package () {

    mkdir -p "${pkgdir}/opt/httpbin"
    virtualenv --python=python3.4 "${pkgdir}/opt/httpbin"

    source "${pkgdir}/opt/httpbin/bin/activate"

    cd "${srcdir}"    
    "${pkgdir}/opt/httpbin/bin/pip" install "${pkgname}-${pkgver}-py2.py3-none-any.whl"

    # Install gunicorn into the virtualenv. You can optionally run httpbin via:
    # source /opt/httpbin/bin/activate && /opt/httpbin/python -m httpbin.core
    "${pkgdir}/opt/httpbin/bin/pip" install gunicorn

    virtualenv --relocatable "${pkgdir}/opt/httpbin"
    sed -i "s#${pkgdir}##" "${pkgdir}/opt/httpbin/bin/activate"

    install -Dm0644 "${srcdir}/httpbin.service" "${pkgdir}/usr/lib/systemd/system/httpbin.service"
    install -Dm0644 "${srcdir}/httpbin.confd" "${pkgdir}/etc/conf.d/httpbin"
}
