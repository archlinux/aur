# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Ricardo <wiiaboo@gmail.com>
# Contributor: jkl <jkl@johnluebs.com>
# Contributor: hdhoang <arch@hdhoang.space>

pkgname=nginx-mainline-mod-fancyindex
pkgver=0.6.0
pkgrel=1
_modname="${pkgname#nginx-mainline-mod-}"
pkgdesc="Fancy index module for the nginx-mainline web server"
arch=('x86_64'
      'aarch64'
      'armv7h')
url="https://www.nginx.com/resources/wiki/modules/fancy_index/"
license=('BSD-2-Clause')
depends=('nginx-mainline')
makedepends=('nginx-mainline-src')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aperezdc/ngx-$_modname/archive/v$pkgver.tar.gz")
sha256sums=('d212fdc1393261612126def3e091c376adeda5646130b4240093f47b550bc5ef')

# Required for compilation with /usr/src/nginx/configure
prepare() {
  install -d nginx
  ln -sf /usr/src/nginx/auto nginx/auto
  ln -sf /usr/src/nginx/src nginx/src
}

build() {
  cd "${srcdir}/nginx"
  /usr/src/nginx/configure --with-compat \
	--add-dynamic-module=../ngx-"$_modname-$pkgver"
  make modules
}

package() {
  local _mod

  cd "${srcdir}/nginx/objs"
  for _mod in *.so; do
	install -D "${_mod}" "$pkgdir/usr/lib/nginx/modules/$_mod"
  done
  install -Dm0644 "$srcdir/ngx-$_modname-$pkgver/LICENSE" \
	"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
