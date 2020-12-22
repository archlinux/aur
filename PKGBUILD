# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: jkl <jkl@johnluebs.com>
# Contributor: hdhoang <arch@hdhoang.space>

pkgname=nginx-mainline-mod-fancyindex
pkgver=0.5.1
pkgrel=2
_modname="${pkgname#nginx-mainline-mod-}"
_nginxver=1.19.6
pkgdesc="Fancy indexes module for the nginx web server"
arch=('x86_64')
url="https://github.com/aperezdc/ngx-fancyindex"
license=('BSD')
depends=("nginx-mainline>=${_nginxver}")
source=(https://nginx.org/download/nginx-$_nginxver.tar.gz{,.asc}
	"${pkgname}-${pkgver}.tar.gz::https://github.com/aperezdc/ngx-$_modname/archive/v$pkgver.tar.gz")
validpgpkeys=('B0F4253373F8F6F510D42178520A9993A1C052F8') # Maxim Dounin <mdounin@mdounin.ru>
sha256sums=('b11195a02b1d3285ddf2987e02c6b6d28df41bb1b1dd25f33542848ef4fc33b5'
            'SKIP'
            '238bd5521d6c9b55780e6871339a7ea79508b9a6758ad2fa4451f2dfe26d94c9')

build() {
  cd "nginx-$_nginxver"
  _opts=$(nginx -V 2>&1 | grep 'configure arguments' | sed -r 's/^[^:]+: //')
  IFS=$'\n' _opts=( $(xargs -n1 <<< "$_opts") )
  ./configure "${_opts[@]}" \
	--add-dynamic-module=../ngx-"$_modname-$pkgver"
  make modules
}

package() {
  cd "nginx-$_nginxver/objs"
  for _mod in *.so; do
	install -D $_mod "$pkgdir/usr/lib/nginx/modules/$_mod"
  done
  install -Dm644 "$srcdir/ngx-$_modname-$pkgver/LICENSE" \
	"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
