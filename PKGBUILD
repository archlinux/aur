# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=sentry
pkgver=8.3.1
pkgrel=2
pkgdesc="Python-based realtime logging and aggregation server."
arch=(any)
url="http://pypi.python.org/pypi/sentry"
license=(BSD)
depends=(
    jansson
    python2
    postgresql
    redis
)
makedepends=(python2-pip python2-setuptools python2-virtualenv)
options=(!strip)
install="sentry.install"
source=(
    "sentry.install"
    "sentry.service"
    "sentry-celery.service"
)
sha256sums=(
    b6bad889a0908133db9662e38cc34fcb408f04d03422b0245d04b145f1cfc7d7  # sentry.install
    7d835be498471eabe6ab9b72c9632d44b718e798984d9db40d17707162573ca4  # sentry.service
    6188e3fca3e9b4a6fd32fd3a9f39a3e4b489632b79cc6db307d767066fbbe518  # sentry-celery.service
)

package () {

    mkdir -p "${pkgdir}/opt/sentry"
    virtualenv2 --python=python2.7 "${pkgdir}/opt/sentry"

    source "${pkgdir}/opt/sentry/bin/activate"

    # Begin Sentry installation for our specific version via PyPI. This
    # guarantees we'll grab all of the appropriate dependencies and
    # automates the process.
    "${pkgdir}/opt/sentry/bin/pip" install "sentry==${pkgver}"

    # Make certain the virtualenv is relocatable.
    virtualenv2 --relocatable "${pkgdir}/opt/sentry"
    sed -i "s#${pkgdir}##" "${pkgdir}/opt/sentry/bin/activate"

    mkdir -p "${pkgdir}/opt/sentry/.python-eggs"
    mkdir -p "${pkgdir}/etc/sentry"

    # Remove Desktop Services Store from package. At least one of these files
    # still persists in the Sentry package. They're harmless, but I don't like
    # them. :) More information: http://en.wikipedia.org/wiki/.DS_Store
    find "${pkgdir}" -name '.DS_Store' -delete

    install -Dm0644 "${srcdir}/sentry.service" "${pkgdir}/usr/lib/systemd/system/sentry.service"
    install -Dm0644 "${srcdir}/sentry-celery.service" "${pkgdir}/usr/lib/systemd/system/sentry-celery.service"

}
