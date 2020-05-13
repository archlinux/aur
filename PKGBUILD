# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=nginx-upload-module-git
pkgver=2.3.0.r19.g4423994
pkgrel=2

_modname=nginx-upload-module
_nginxver=1.18.0

pkgdesc="A module for nginx web server for handling file uploads using multipart/form-data encoding (RFC 1867)."
arch=('i686' 'x86_64')
depends=('nginx')
makedepends=('git')
url="https://github.com/vkholodkov/nginx-upload-module"
license=('GPL')
provides=("$_modname=$pkgver")
conflicts=("$_modname")


source=("$_modname"::"git+https://github.com/vkholodkov/$_modname.git"
        https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
        config)
sha512sums=('SKIP'
            '8c21eeb62ab6e32e436932500f700bd2fb99fd2d29e43c08a5bfed4714c189c29c7141db551fcd5d2437303b7439f71758f7407dfd3e801e704e45e7daa78ddb'
            'SKIP'
            '898eb9dd5f50985ddad1571c056739761045e60fce04315a38f3a4334394534140925aad649c2a2c3c1c285a4c015c04864d0d8f59110bdd39630d7d1eaf64c9')

validpgpkeys=(
  'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)

pkgver() {
  cd $srcdir/$_modname
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $srcdir/$_modname
  [ -f config ] && rm config
  cp -a "$srcdir/config" .
}

build() {
  cd $srcdir/nginx-$_nginxver

  ./configure --with-compat --add-dynamic-module=../$_modname
  make modules
}

package() {
  install -Dm644 "$srcdir"/$_modname/LICENCE \
                  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$srcdir"/nginx-$_nginxver/objs
  for mod in ngx_*.so; do
      install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done

}
