# Maintainer: Erich Eckner <arch at eckner dot net>

_nginxver=1.14.0

pkgname=nginx-mod-ipscrub
pkgver=1.0.1
pkgrel=1
pkgdesc='IP address anonymizer for nginx log files'

arch=('i686' 'x86_64')
depends=(
  "nginx=$_nginxver"
  'libbsd'
)
url='https://github.com/masonicboom/ipscrub'
license=('custom')

source=(
    https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
    ${pkgname}-${pkgver}.tar.gz::https://github.com/masonicboom/ipscrub/archive/v${pkgver}.tar.gz
)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8) # Maxim Dounin <mdounin@mdounin.ru>
sha512sums=('40f086c9f741727e6f55802b6c3a66f081f7c49c38646dc1491aa3e3c35bae12b65ea6594386609fc849bcd99a60d7cd8ecb3f8d519e0e9ab8db01d653e930e9'
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
