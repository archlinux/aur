# Maintainer: ryester27 <ryester27@rbox.co>

pkgname=nginx-mainline-mod-ipscrub
pkgver=1.0.1
pkgrel=1

pkgdesc="ipscrub module for nginx mainline"
arch=('i686' 'x86_64')
url="https://github.com/masonicboom/ipscrub"
license=('custom')
depends=('nginx-mainline' 'libbsd')
makedepends=('nginx-mainline-src')

source=("https://github.com/masonicboom/ipscrub/archive/v${pkgver}.tar.gz")
sha256sums=('c4ae6733434f2c98f0bf6a8e3af88be6a6cc81cd7ee823eb90d124ecb9cca9ed')

prepare() {
    mkdir -p build
    cd build
    ln -sf /usr/src/nginx/auto
    ln -sf /usr/src/nginx/src
}

build() {
    # Extract license from readme file
    sed -n '/## License$/,/###/ { /##/! p }' ipscrub-${pkgver}/README.md > LICENSE

    cd build
    /usr/src/nginx/configure --with-compat --add-dynamic-module=../ipscrub-${pkgver}/ipscrub
    make modules
}

package() {
    install -Dm755 build/objs/ngx_ipscrub_module.so \
                   "$pkgdir"/usr/lib/nginx/modules/ngx_ipscrub_module.so
    install -Dm644 LICENSE \
                   "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
