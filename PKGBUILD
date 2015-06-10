# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=sentry
pkgver=7.5.4
pkgrel=1
pkgdesc="Python-based realtime logging and aggregation server."
arch=(any)
url="http://pypi.python.org/pypi/sentry"
license=(BSD)
depends=(
    python2
    redis
)
makedepends=(python2-pip python2-setuptools python2-virtualenv)
options=(!strip)
install="${pkgname}.install"
source=(
    "https://pypi.python.org/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz"
    "${pkgname}.install"
    "sentry.service"
    "sentry-celery.service"
)
md5sums=(
    f68f9a17ca893a9c747f96d970449080 # sentry tarball
    8aab776f3d428c417f51522c256b5aeb # sentry.install
    8d1d8d166a88bc89ad2265fd67ab3523 # sentry.service
    78dd3e18109c2bf92f7f884de0237781 # sentry-celery.service
)

package () {

    mkdir -p "${pkgdir}/opt/sentry"
    virtualenv2 --python=python2.7 "${pkgdir}/opt/sentry"

    source "${pkgdir}/opt/sentry/bin/activate"

    # Workaround for circumstances where cssutils may not be installed
    # into the virtualenv at the correct version.
    "${pkgdir}/opt/sentry/bin/pip" install "cssutils>=0.9.9,<0.10.0"

    # Recent versions of Sentry rely on pytest to be installed as part
    # of the package dependencies. Unfortunately, it doesn't install
    # correctly inside a virtualenv. Preload it here.
    "${pkgdir}/opt/sentry/bin/pip" install "pytest"

    cd "${srcdir}/${pkgname}-${pkgver}"
    "${pkgdir}/opt/sentry/bin/python2" setup.py install --optimize=1

    virtualenv2 --relocatable "${pkgdir}/opt/sentry"
    sed -i "s#${pkgdir}##" "${pkgdir}/opt/sentry/bin/activate"

    mkdir -p "${pkgdir}/opt/sentry/.python-eggs"
    mkdir -p "${pkgdir}/etc/sentry"

    # Remove Desktop Services Store from package. At least one of these files
    # still persists in the Sentry package. They're harmless, but I don't like
    # them. :) More information: http://en.wikipedia.org/wiki/.DS_Store
    find "${pkgdir}" -name '.DS_Store' -delete

    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm0644 "${srcdir}/sentry.service" "${pkgdir}/usr/lib/systemd/system/sentry.service"
    install -Dm0644 "${srcdir}/sentry-celery.service" "${pkgdir}/usr/lib/systemd/system/sentry-celery.service"

}
