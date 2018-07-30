# Maintainer: Justin Gallardo <me@jirw.in>

pkgname=nginx-mod-auth-accessfabric
pkgver=1.0.0
pkgrel=1

_nginxver=1.14.0

pkgdesc='Nginx module for authenticating requests from the ScaleFT Access Fabric'
arch=('i686' 'x86_64')
depends=('glibc>=2.25' 'nginx' 'xjwt')
url="https://github.com/ScaleFt/nginx_auth_accessfabric"
license=('Apache')

source=(https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
        https://github.com/ScaleFT/nginx_auth_accessfabric/archive/v$pkgver.tar.gz
        remove_get_entropy.patch
)
validpgpkeys=(B0F4253373F8F6F510D42178520A9993A1C052F8)
md5sums=('2d856aca3dfe1d32e3c9f8c4cac0cc95'
         'SKIP'
         '28eac06b4247ed32939ca8c70e347342'
         'b10c128e65a36c7cb22fc9c2ec20ce92')

prepare() {
  cd "$srcdir"/nginx_auth_accessfabric-$pkgver
  patch -Np1 -i "${srcdir}/remove_get_entropy.patch"
}

build() {
  cd "$srcdir"/nginx-$_nginxver
  ./configure --with-compat --add-dynamic-module=../nginx_auth_accessfabric-$pkgver
  make modules
}

package() {
  install -Dm644 "$srcdir/"nginx_auth_accessfabric-$pkgver/LICENSE \
                 "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$srcdir"/nginx-$_nginxver/objs
  for mod in *.so; do
    install -Dm755 $mod "$pkgdir"/etc/nginx/modules/$mod
  done
}

