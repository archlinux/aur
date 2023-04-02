# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgbase=sentry
pkgname=('sentry')
pkgver=23.3.1
pkgrel=3
pkgdesc="Python-based realtime logging and aggregation server."
arch=(any)
url="http://pypi.python.org/pypi/sentry"
license=(BSD)
makedepends=(
    'python-pip'
    'python-setuptools'
)
install='sentry.install'

depends=(
    'jansson'
    'libjpeg-turbo'
    'libxml2'
    'libxslt'
    'python'
    'postgresql-libs'
    'xmlsec'
)

# Redis is declared in the `optdepends` array because it is a "soft"
# dependency. sentry-celery requires it for background task processing and
# pub/sub, but it need not run on the same server as Sentry. As of 9.1.0-2,
# Redis has been removed from `depends` to ease the dependency requiresments
# of users running Sentry on a separate server or container.
optdepends=(
    'llvm: required for dsym support'
    'minio: self-hosted S3-compatible file storage backend'
    'redis: required by sentry-celery but need not run on the same server'
)

options=(!strip)
source=(
    "sentry"
    "sentry.install"
    "sentry-celery.service"
    "sentry-cron.service"
    "sentry.service"
    "sentry-web.service"
    "sentry.target"
    "sentry-sysusers.conf"
)
sha256sums=('9d1b774945d9294a1bfdbe03b4e6b8e874426028145e85bac4b4e4990885c4d8'
            '3be04bc47f4f037bf157da9986874c343e6c7d1af9e30269b4f0aabf303d3291'
            '104beae867352c577d3c8f2d3c53d44fa14eb052208ed787ebb515f8dd2eb40d'
            'f22d39acafe5ed22d21fc8e2735835388ad0f1a126cccc8783c9eef3207364b1'
            '3c471417a279ac6605d3bb82b7377eaab0e24efe9cf582a11eef0d9e4c89428e'
            '285d82c9b2f26685a0686c71d662e398e6dc9a852a2b1cdcbf24116102031f8d'
            '94121159756f7ac863e2b1149b530ea633efa2f3eeef57cc332e1f4cba724e2d'
            '682917f4da89a526949fec71c1afa5849a3a73453b812c8edd945e2f8b146926')

package() {
    mkdir -p "${pkgdir}/opt/sentry"
    pip install --isolated --root="$pkgdir"/opt/sentry --ignore-installed \
        sentry-auth-ldap \
        django==2.2.28 \
        "sentry==$pkgver"

    mkdir -p "${pkgdir}/opt/sentry/.python-eggs"
    mkdir -p "${pkgdir}/etc/sentry"

    # Remove Desktop Services Store from package. At least one of these files
    # still persists in the Sentry package. They're harmless, but I don't like
    # them. :) More information: http://en.wikipedia.org/wiki/.DS_Store
    find "${pkgdir}" -name '.DS_Store' -delete

    # fixes
    touch "${pkgdir}"/opt/sentry/usr/lib/python3.10/site-packages/sentry_auth_ldap/__init__.py
    ln -s sentry_auth_ldap "${pkgdir}"/opt/sentry/usr/lib/python3.10/site-packages/sentry_ldap_auth

    # systemd files and wrappers
    install -Dm0755 "${srcdir}/sentry" "${pkgdir}/opt/sentry/bin/sentry"
    install -Dm0644 "${srcdir}/sentry-celery.service" "${pkgdir}/usr/lib/systemd/system/sentry-celery.service"
    install -Dm0644 "${srcdir}/sentry-cron.service" "${pkgdir}/usr/lib/systemd/system/sentry-cron.service"
    install -Dm0644 "${srcdir}/sentry-web.service" "${pkgdir}/usr/lib/systemd/system/sentry-web.service"
    install -Dm0644 "${srcdir}/sentry.service" "${pkgdir}/usr/lib/systemd/system/sentry.service"
    install -Dm0644 "${srcdir}/sentry.target" "${pkgdir}/usr/lib/systemd/system/sentry.target"
    install -Dm0644 "${srcdir}/sentry-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/sentry.conf"
}
