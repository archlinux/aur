# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=sentry
pkgver=8.3.1
pkgrel=1
pkgdesc="Python-based realtime logging and aggregation server."
arch=(any)
url="http://pypi.python.org/pypi/sentry"
license=(BSD)
depends=(
    jansson
    python2
    redis
)
makedepends=(python2-pip python2-setuptools python2-virtualenv)
optdepends=(
    'mariadb: MySQL backend support'
    'postgresql: PostgreSQL backend support'
    'sqlite: SQLite backend support'
)
options=(!strip)
install="${pkgname}.install"
source=(
    "${pkgname}.install"
    "sentry.service"
    "sentry-celery.service"
)
md5sums=(
    a923b21928a227eda35dd76d599fbac1 # sentry.install
    1559e7fcb42e4f0aeaaf8139baaac0d7 # sentry.service
    78dd3e18109c2bf92f7f884de0237781 # sentry-celery.service
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
