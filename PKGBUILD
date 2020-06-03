# Maintainer: Hexhu <i at hexhu.net>
# Contributor : Thermi <noel [at] familie-kuntze dot de>

pkgname=ndppd-git
pkgver=0.x
pkgrel=1
pkgdesc="NDP Proxy Daemon, version 0.x (git version)"
arch=('x86_64')
url="https://github.com/DanielAdolfsson/ndppd"
license=('GPL3')
depends=()
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/ndppd.conf')
source=('git+https://github.com/DanielAdolfsson/ndppd')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"

# pacmans version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-git}"

    make DEBUG=1 PREFIX=/usr all
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make PREFIX=/usr SBINDIR=/${pkgdir}/usr/bin DESTDIR=${pkgdir} install
    install -D -m 644 "ndppd.service" "${pkgdir}/usr/lib/systemd/system/ndppd.service"
    install -D -m 644 "ndppd.conf-dist" "${pkgdir}/etc/ndppd.conf"
}
