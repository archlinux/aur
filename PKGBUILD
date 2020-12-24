# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_modname="ngx_pagespeed"
_psolver=1.13.35.2

pkgname=nginx-mainline-mod-pagespeed-git
pkgver=r1134.9e70f6dac
pkgrel=1
pkgdesc="Module to reduce latency and bandwidth."
arch=('i686' 'x86_64')
depends=('nginx-mainline')
makedepends=('git' 'nginx-mainline-src')
provides=('nginx-mainline-mod-pagespeed')
conflicts=('nginx-mainline-mod-pagespeed')
url="https://github.com/apache/incubator-pagespeed-ngx"
license=('CUSTOM')
source=("$_modname::git+https://github.com/apache/incubator-pagespeed-ngx.git")
source_i686=(pagespeed-$_psolver-i686.tar.gz::https://dl.google.com/dl/page-speed/psol/$_psolver-ia32.tar.gz)
source_x86_64=(pagespeed-$_psolver-x86_64.tar.gz::https://dl.google.com/dl/page-speed/psol/$_psolver-x64.tar.gz)
validpgpkeys=(
  'B0F4253373F8F6F510D42178520A9993A1C052F8' # Maxim Dounin <mdounin@mdounin.ru>
)
sha256sums=('SKIP')
sha256sums_i686=('9155acfc1764c3554ef21b17b00739d6879822eabeada9a1578a848b0b2d70d0')
sha256sums_x86_64=('df3ba3c8fc54e13845d0a1daa7a6e3d983126c23912851bbf8ba35be646a434f')

pkgver() {
  cd "$_modname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -r /usr/src/nginx .

  cd "$srcdir"/$_modname

  sed 's@/usr/local@/usr@' -i config

	ln -s ../psol
	sed -r 's@^pagespeed_libs="(\$psol_binary.*)"@pagespeed_libs="\1 -Wl,-z,noexecstack"@' -i config
}

build() {
  cd "$srcdir"/nginx
 
  ./configure --with-compat --add-dynamic-module=../$_modname
 
  make modules
}

package() {
  install -Dm644 "$srcdir"/$_modname/LICENSE \
                  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$srcdir"/nginx/objs
	for mod in ngx_*.so; do
		install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
	done
}
