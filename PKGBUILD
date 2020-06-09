# Maintainer: Hexhu <i at hexhu.net>
# Contributor : Thermi <noel [at] familie-kuntze dot de>

pkgname=ndppd-git
pkgver=r116.e01d67a
pkgrel=3
pkgdesc="NDP Proxy Daemon, version 0.x (git version)"
arch=('x86_64')
url="https://github.com/DanielAdolfsson/ndppd"
license=('GPL3')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/ndppd.conf')
source=('git+https://github.com/DanielAdolfsson/ndppd'
        'ndppd.service')
md5sums=('SKIP'
         '4658734163b92421e4e4fea4cbb4f7d9')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-git}"

    # Fix versioning, though dozens of commits have been added to the master branch
    # after v0.2.5, which was released at August 2016.
    sed -i 's/\"0.2.4\"/\"0.2.5\"/' src/ndppd.h

    make DEBUG=1 PREFIX=/usr all
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make PREFIX=/usr SBINDIR=/${pkgdir}/usr/bin DESTDIR=${pkgdir} install
    install -D -m 644 "${srcdir}/ndppd.service" "${pkgdir}/usr/lib/systemd/system/ndppd.service"
    install -D -m 644 "ndppd.conf-dist" "${pkgdir}/etc/ndppd.conf"
}
