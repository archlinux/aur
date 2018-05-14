# Maintainer: Erich Eckner <arch at eckner dot net>

_nginxver=1.14.0

pkgname=nginx-mod-ipscrub
pkgver=1.0.0
pkgrel=1
pkgdesc='IP address anonymizer for nginx log files'

arch=('i686' 'x86_64')
depends=("nginx=$_nginxver")
url='https://github.com/masonicboom/ipscrub'
license=('custom')

source=(
    https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
    ${pkgname}-${pkgver}.tar.gz::https://github.com/masonicboom/ipscrub/archive/v${pkgver}.tar.gz
)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=(
    '5d15becbf69aba1fe33f8d416d97edd95ea8919ea9ac519eff9bafebb6022cb5'
    'SKIP'
    '6fcfa7d04e98691aff72171c369e6d325df6a68efadddb5013aeecfc7da5287f'
)

build() {
    cd "$srcdir"/nginx-$_nginxver
    ./configure --with-compat \
        --add-dynamic-module=../ipscrub-${pkgver}/ipscrub
    make modules
}

package() {

    cd "$srcdir/nginx-$_nginxver/objs"
    install -Dm755 -t "$pkgdir/usr/lib/nginx/modules/" *.so

    sed -n '/## License$/,/###/ { /##/! p }' "$srcdir/ipscrub/README.md" | \
        install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
