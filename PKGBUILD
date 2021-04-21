# Maintainer: Repentinus <aur at repentinus dot eu>

# It is the authors' firm belief this file lacks sufficient originality to
# qualify for copyright protection. In the event they are wrong, the authors
# hereby explictly waive all copyright and related or neighbouring rights to this
# work using the CC0 <https://creativecommons.org/publicdomain/zero/1.0/>.

pkgname='nginx-mod-http-xslt-filter'
pkgver=1.20.0.1
pkgver() {
  pacman -Si nginx-src | sed -nE 's/^Version *: ([^-]*)-(.*)$/\1.\2/p'
}
pkgrel=1
pkgdesc="Transform nginx XML responses using XSLT stylesheets"
arch=('x86_64')
url='https://nginx.org/en/docs/http/ngx_http_xslt_module.html'
license=('custom:BSD-2-Clause')
depends=('nginx' 'libxslt')
makedepends=('nginx-src')

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
