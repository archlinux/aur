# $Id$
# Maintainer: Martchus <martchus@gmx.net>
# Maintainer: Jakob (XDjackieXD) <aur at chaosfield dot at>
# Contributor: Trevor Bergeron <aur at sec dot gd>

pkgname=nginx-mod-rtmp
pkgver=1.2.2
pkgrel=3
_dirname="nginx-rtmp-module-$pkgver"
_nginxver=1.22.0

pkgdesc='Module for nginx that adds RTMP support'
arch=('x86_64')
depends=("nginx=$_nginxver" "libutil-linux")
makedepends=("nginx-src")
url='https://github.com/arut/nginx-rtmp-module'
license=('BSD')

source=("$pkgname-$pkgver::https://github.com/arut/nginx-rtmp-module/archive/v${pkgver}.tar.gz")
sha256sums=('07f19b7bffec5e357bb8820c63e5281debd45f5a2e6d46b1636d9202c3e09d78')

prepare() {
  cd "$srcdir/$_dirname"
}

build() {
  cp -r /usr/src/nginx .
  cd "$srcdir"/nginx
  ./configure --with-compat --add-dynamic-module="../$_dirname"
  make modules
}

package() {
  install -Dm755 "$srcdir/$_dirname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  cd "$srcdir"/nginx/objs
  for mod in ngx_*.so; do
    install -Dm755 $mod "$pkgdir"/usr/lib/nginx/modules/$mod
  done
}
