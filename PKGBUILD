# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgbase=sentry
pkgname=('sentry' 'sentry-dsym')
pkgver=8.6.0
pkgrel=2
pkgdesc="Python-based realtime logging and aggregation server."
arch=(any)
url="http://pypi.python.org/pypi/sentry"
license=(BSD)
makedepends=(
    'clang'
    'libjpeg-turbo'
    'libxml2'
    'libxslt'
    'python2'
    'python2-pip'
    'python2-setuptools'
    'python2-virtualenv'
)
options=(!strip)
source=(
    "sentry.install"
    "sentry-celery.service"
    "sentry-cron.service"
    "sentry.service"
    "sentry-web.service"
    "sentry.target"
)
sha256sums=(
    46f4b2425652aec10dc596bdae8439efd177f2a153a416daa1c23a9438ab02bb # sentry.install
    d60b097721ec4acbc5b1232a0f29ef9d21d60228d17db655848a8e2a5c9a5281 # sentry-celery.service
    d22b9bde7c39d9d0f031ba1b01c955c9dbe4ffe3f3f083875fe557f75f0050f7 # sentry-cron.service
    224b55515630e2714d481793f9ab0644976a47d5326063a4d6f069b30012f463 # sentry.service
    0fe0062a77f78b01ab3729f0217a9d6b448cbfb7521c4a04c79d6e3062b4c635 # sentry-web.service
    94121159756f7ac863e2b1149b530ea633efa2f3eeef57cc332e1f4cba724e2d # sentry.target
)

package_sentry () {
    install="sentry.install"
    depends=(
        'jansson'
        'libjpeg-turbo'
        'libxml2'
        'libxslt'
        'python2'
        'postgresql'
        'redis'
    )

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

    install -Dm0644 "${srcdir}/sentry-celery.service" "${pkgdir}/usr/lib/systemd/system/sentry-celery.service"
    install -Dm0644 "${srcdir}/sentry-cron.service" "${pkgdir}/usr/lib/systemd/system/sentry-cron.service"
    install -Dm0644 "${srcdir}/sentry-web.service" "${pkgdir}/usr/lib/systemd/system/sentry-web.service"
    install -Dm0644 "${srcdir}/sentry.service" "${pkgdir}/usr/lib/systemd/system/sentry.service"
    install -Dm0644 "${srcdir}/sentry.target" "${pkgdir}/usr/lib/systemd/system/sentry.target"

}

package_sentry-dsym() {
    depends=(
        'llvm'
        'sentry'
    )

    mkdir -p "${pkgdir}/opt/sentry"
    virtualenv2 --python=python2.7 "${srcdir}/dsym-env"
    source "${srcdir}/dsym-env/bin/activate"

    "${srcdir}/dsym-env/bin/pip" install "symsynd>=0.6.1,<1.0.0"

    mkdir -p "${pkgdir}/opt/sentry/lib/python2.7/site-packages"
    cp -a "${srcdir}/dsym-env/lib/python2.7/site-packages/altgraph"* "${pkgdir}/opt/sentry/lib/python2.7/site-packages/"
    cp -a "${srcdir}/dsym-env/lib/python2.7/site-packages/macholib"* "${pkgdir}/opt/sentry/lib/python2.7/site-packages/"
    cp -a "${srcdir}/dsym-env/lib/python2.7/site-packages/symsynd"* "${pkgdir}/opt/sentry/lib/python2.7/site-packages/"
    cp -a "${srcdir}/dsym-env/lib/python2.7/site-packages/_symsynd_demangler.so" "${pkgdir}/opt/sentry/lib/python2.7/site-packages/"

}
