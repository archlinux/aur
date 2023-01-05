# Maintainer: Erich Eckner <arch at eckner dot net>

_nginxver=1.22.1

pkgname=nginx-mod-ipscrub
pkgver=1.0.1
pkgrel=18
pkgdesc='IP address anonymizer for nginx log files'

arch=('i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h')
depends=(
  'libbsd'
  "nginx=$_nginxver"
)
url='https://github.com/masonicboom/ipscrub'
license=('custom')

source=(
    https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
    ${pkgname}-${pkgver}.tar.gz::https://github.com/masonicboom/ipscrub/archive/v${pkgver}.tar.gz
)
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
              '13C82A63B603576156E30A4EA0EA981B66B0D967') # Konstantin Pavlov <thresh@nginx.com>
sha512sums=('1d468dcfa9bbd348b8a5dc514ac1428a789e73a92384c039b73a51ce376785f74bf942872c5594a9fcda6bbf44758bd727ce15ac2395f1aa989c507014647dcc'
            'SKIP'
            '71d376c8d26d1f697ded361675186a2bd44b56afbfe6a2db3bee82d83402876e7ac685bd1e1318d9b2143ee9f85196e60c828af62b2685e8b1165dcaa025d196')

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
