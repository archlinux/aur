# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgbase=sentry
pkgname=('sentry')
pkgver=9.1.0
pkgrel=2
pkgdesc="Python-based realtime logging and aggregation server."
arch=(any)
url="http://pypi.python.org/pypi/sentry"
license=(BSD)
makedepends=(
    'clang'
    'llvm'
    'python2-pip'
    'python2-setuptools'
    'python2-virtualenv'
)
install='sentry.install'

depends=(
    'jansson'
    'libjpeg-turbo'
    'libxml2'
    'libxslt'
    'ncurses5-compat-libs'
    'python2'
    'postgresql-libs'
)

# Redis is declared in the `optdepends` array because it is a "soft"
# dependency. sentry-celery requires it for background task processing and
# pub/sub, but it need not run on the same server as Sentry. As of 9.1.0-2,
# Redis has been removed from `depends` to ease the dependency requiresments
# of users running Sentry on a separate server or container.
optdepends=(
    'minio: self-hosted S3-compatible file storage backend'
    'redis: required by sentry-celery but need not run on the same server'
)

options=(!strip)
source=(
    "sentry.install"
    "sentry-celery.service"
    "sentry-cron.service"
    "sentry.service"
    "sentry-web.service"
    "sentry.target"
    "sentry-sysusers.conf"
)
sha256sums=(
    f546dfbb4c3dac72a9588f18c7dca668b680ddc4d8878f54b174756acc6de2bf # sentry.install
    d60b097721ec4acbc5b1232a0f29ef9d21d60228d17db655848a8e2a5c9a5281 # sentry-celery.service
    d22b9bde7c39d9d0f031ba1b01c955c9dbe4ffe3f3f083875fe557f75f0050f7 # sentry-cron.service
    3c471417a279ac6605d3bb82b7377eaab0e24efe9cf582a11eef0d9e4c89428e # sentry.service
    0fe0062a77f78b01ab3729f0217a9d6b448cbfb7521c4a04c79d6e3062b4c635 # sentry-web.service
    94121159756f7ac863e2b1149b530ea633efa2f3eeef57cc332e1f4cba724e2d # sentry.target
    682917f4da89a526949fec71c1afa5849a3a73453b812c8edd945e2f8b146926 # sentry-sysusers.conf
)

package() {

    mkdir -p "${pkgdir}/opt/sentry"
    virtualenv2 --python=python2.7 "${pkgdir}/opt/sentry"
    source "${pkgdir}/opt/sentry/bin/activate"

    # Begin Sentry installation for our specific version via PyPI. This
    # guarantees we'll grab all of the appropriate dependencies and
    # automates the process.
    #
    # If you're running GCC 6.1 and Sentry won't build, uncomment the following
    # line and comment-out or remove the one immediately after it. If you wish
    # to be more specific, replace -Wno-error with -Wno-misleading-indentation.
    #CFLAGS="-Wno-error" "${pkgdir}/opt/sentry/bin/pip" install "sentry==${pkgver}"
    "${pkgdir}/opt/sentry/bin/pip" install "more-itertools==5.0.0" "psycopg2==2.7.3" "six==1.10.0" "sentry==${pkgver}" --no-binary "psycopg2"

    # Make certain the virtualenv is relocatable.
    virtualenv2 --relocatable "${pkgdir}/opt/sentry"
    sed -i "s#${pkgdir}##" "${pkgdir}/opt/sentry/bin/activate"

    mkdir -p "${pkgdir}/opt/sentry/.python-eggs"
    mkdir -p "${pkgdir}/etc/sentry"

    # Remove Desktop Services Store from package. At least one of these files
    # still persists in the Sentry package. They're harmless, but I don't like
    # them. :) More information: http://en.wikipedia.org/wiki/.DS_Store
    find "${pkgdir}" -name '.DS_Store' -delete

    install -Dm0644 "${srcdir}/sentry-celery.service" "${pkgdir}/usr/lib/systemd/system/sentry-celery.service"
    install -Dm0644 "${srcdir}/sentry-cron.service" "${pkgdir}/usr/lib/systemd/system/sentry-cron.service"
    install -Dm0644 "${srcdir}/sentry-web.service" "${pkgdir}/usr/lib/systemd/system/sentry-web.service"
    install -Dm0644 "${srcdir}/sentry.service" "${pkgdir}/usr/lib/systemd/system/sentry.service"
    install -Dm0644 "${srcdir}/sentry.target" "${pkgdir}/usr/lib/systemd/system/sentry.target"
    install -Dm0644 "${srcdir}/sentry-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/sentry.conf"

}
