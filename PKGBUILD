# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=sysstat-mail-report-git
_pkgname=sysstat-mail-report
pkgver=r73.039c137
pkgrel=1
pkgdesc='Send periodic email reports with graphs plotted from sysstat data'
arch=('any')
_gitname='sysstat_mail_report'
url="https://github.com/desbma/${_gitname}"
license=('LGPL')
depends=('gnuplot' 'python' 'smtp-forwarder' 'sysstat')
optdepends=('scour: for lossless SVG crunching'
            'optipng: for lossless PNG crunching'
            'oxipng: for lossless PNG crunching')
makedepends=('git')
backup=("etc/conf.d/${_pkgname}")
source=("git+https://github.com/desbma/${_gitname}")
sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/${_gitname}"
    sed -i "s@/etc/conf.d/sysstat-report@/etc/conf.d/${_pkgname}@w /dev/stdout" systemd/sysstat-report@.service
    sed -i "s@/usr/local/bin/sysstat_report.py@/usr/bin/${_pkgname}@w /dev/stdout" systemd/sysstat-report@.service
}

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_gitname}"

    install -Dm 755 sysstat_report.py "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm 644 systemd/sysstat-report.conf "${pkgdir}/etc/conf.d/${_pkgname}"

    install -Dm 644 systemd/sysstat-report@.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
    install -Dm 644 systemd/sysstat-report@.timer "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.timer"
}
