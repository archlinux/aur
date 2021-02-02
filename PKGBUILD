# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Sergey Shatunov <me@prok.pw>

# Based on nginx-mod-http-xslt-filter AUR package.

pkgname='nginx-mainline-mod-http-xslt-filter'
#pkgver=$(pacman -Si nginx-mainline-src | sed -nE 's/^Version *: ([[:alnum:]._]+).*$/\1/p')
pkgver=1.19.6
#pkgrel=$(pacman -Si nginx-mainline-src | sed -nE 's/^Version *: [^-]+-(.*)$/\1/p')
pkgrel=2
pkgdesc="HTTP XSLT module for the Nginx mainline web server"
arch=('x86_64')
url='https://nginx.org/en/docs/http/ngx_http_xslt_module.html'
license=('custom:BSD-2-Clause')
depends=('nginx-mainline' 'libxslt')
makedepends=('nginx-mainline-src')

prepare() {
  cp -r /usr/src/nginx/ ./
}

build() {
  cd nginx
  _options=$(nginx -V |&
             sed -nE 's/^configure arguments: ([^\n]*)$/\1/p' |
             sed -nE 's/([^'"'"' \t\n]+('"'"'([^'"'"'\]|\\'"'"'?)*'"'"'|"([^"\\]|\\"?)*")?) ?/\1\n/gp')
  IFS=$'\n' xargs ./configure --with-http_xslt_module=dynamic <<< ${_options[@]}
  make modules
}

package() {
  cd "nginx/objs"
  for f in *.so; do install -Dm644 "$f" "$pkgdir/usr/lib/nginx/modules/$f"; done
  install -dm755 "$pkgdir/usr/share/licenses/"
  ln -s /usr/share/licenses/nginx/ "$pkgdir/usr/share/licenses/$pkgname"
}
