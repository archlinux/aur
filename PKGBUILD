# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nginx-mainline-mod-uaparser-git
pkgver=r1.f5a1e52
pkgrel=2

_modname="nginx-uaparser-module"
_nginxver=1.17.0

pkgdesc="User agent parser module for mainline nginx"
arch=('i686' 'x86_64')
makedepends=("nginx-mainline=$_nginxver")
depends=('nginx-mainline' 'uap-cpp-git')
provides=('nginx-mainline-mod-uaparser')
url="https://github.com/clarfon/nginx-uaparser-module"
license=('CC0')

source=(
  https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
  git+https://github.com/clarfon/$_modname.git
)

validpgpkeys=(
  'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

sha256sums=(
  'e21b5d06cd53e86afb94f0b3678e0abb0c0f011433471fa3d895cefa65ae0fab'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_modname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/nginx-${_nginxver}"
  ./configure --with-compat --add-dynamic-module=../$_modname
  make modules
}

package() {
  cd "$srcdir"/nginx-$_nginxver/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
