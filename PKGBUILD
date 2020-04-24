# Maintainer: Erich Eckner <arch at eckner dot net>

_nginxver=1.18.0

pkgname=nginx-mod-ipscrub
pkgver=1.0.1
pkgrel=7
pkgdesc='IP address anonymizer for nginx log files'

arch=('i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h')
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
sha512sums=('8c21eeb62ab6e32e436932500f700bd2fb99fd2d29e43c08a5bfed4714c189c29c7141db551fcd5d2437303b7439f71758f7407dfd3e801e704e45e7daa78ddb'
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
