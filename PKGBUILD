# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgbase=sentry
pkgname=('sentry' 'sentry-dsym')
pkgver=8.4.1
pkgrel=2
pkgdesc="Python-based realtime logging and aggregation server."
arch=(any)
url="http://pypi.python.org/pypi/sentry"
license=(BSD)
makedepends=(clang python2-pip python2-setuptools python2-virtualenv)
options=(!strip)
source=(
    "sentry.install"
    "sentry.service"
    "sentry-celery.service"
)
sha256sums=(
    a8e29037fe9876230e74bc9205c950222a1b8d2319a45e472616b88d637cf076 # sentry.install
    ba4fbcb41429235e818cf6e3c67bea8434d691f4abc9a1e62405cd657fef8b4b # sentry.service
    b7321469b6800e08ed14a7a716a2574a08eaf06a759b558abf92405c7bb37dd9 # sentry-celery.service
)

package_sentry () {
    install="sentry.install"
    depends=(
        'jansson'
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

    install -Dm0644 "${srcdir}/sentry.service" "${pkgdir}/usr/lib/systemd/system/sentry.service"
    install -Dm0644 "${srcdir}/sentry-celery.service" "${pkgdir}/usr/lib/systemd/system/sentry-celery.service"

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
