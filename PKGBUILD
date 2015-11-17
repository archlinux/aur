# Maintainer: James An <james@jamesan.ca>

_pkgname=PimpMyLog
pkgname="${_pkgname,,}-git"
pkgver=1.7.9.r0.g22f448c
pkgrel=1
pkgdesc="Log viewer for your web server (formerly the PHP Apache Log Viewer)"
arch=('any')
url="http://pimpmylog.com"
license=('GPL3')
depends=('php>=5.2')
optdepends=('apache: compatible web server'
            'nginx: compatible web server'
            'lighttpd: compatible web server'
            'darkhttpd: compatible web server')
makedepends=('git')
provides=("${_pkgname,,}=$pkgver")
conflicts=("${_pkgname,,}")
options=()
install=
source=("${_pkgname,,}"::"git+https://github.com/potsky/$_pkgname.git"
        'nginx.conf')
md5sums=('SKIP'
         '78ee0cca1e8da50b0064648ed125bbd8')

pkgver() {
    cd "${_pkgname,,}"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${_pkgname,,}"

    install -m755 -d "$pkgdir/usr/share/webapps/${_pkgname,,}"
    cp -a * "$pkgdir/usr/share/webapps/${_pkgname,,}/"

    install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname,,}/README.md"
    install -Dm644 ../nginx.conf "$pkgdir/etc/nginx/conf.d/${_pkgname,,}.conf"
}
