# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nile-git
pkgver=r47.4d10ddd
pkgrel=1
pkgdesc="Unofficial Amazon Games client"
arch=('any')
url="https://github.com/imLinguin/nile"
license=('GPL3')
depends=('bash' 'python-json5' 'python-protobuf' 'python-pycryptodome'
         'python-requests' 'python-zstandard')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/imLinguin/nile.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r assets bin "${pkgname%-git}" "$pkgdir/opt/${pkgname%-git}/"

  # compile Python bytecode for modules outside of site-packages:
  python -m compileall -d / "$pkgdir/opt/${pkgname%-git}"
  python -O -m compileall -d / "$pkgdir/opt/${pkgname%-git}"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/bin/${pkgname%-git}" "$pkgdir/usr/bin/"
}
