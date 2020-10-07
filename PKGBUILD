# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passwall-desktop-git
_pkgname=passwall
pkgdesc="Desktop client of the PassWall platform (git)"
pkgver=0.1.3.r70.g481a826
pkgrel=1
arch=('x86_64')
url="https://github.com/passwall/passwall-desktop"
license=('unknown')
conflicts=("${pkgname%-git}")
makedepends=('git' 'yarn' 'npm')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  yarn && yarn run build
}

package() {
  cd "${pkgname%-git}"

  # Install resources and binary
  install -dm 755 "$pkgdir/usr/share/${pkgname%-git}"
  cp -r build/linux-unpacked/* "$pkgdir/usr/share/${pkgname%-git}"
  install -dm 755 "$pkgdir/usr/local/bin"
  ln -s "/usr/share/${pkgname%-git}/$_pkgname" "$pkgdir/usr/local/bin/$_pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  # Install pixmaps and fonts
  install -dm 755 "$pkgdir/usr/share/pixmaps"
  install -Dm 644 static/img/logo.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm 644 static/img/error-notify.png "$pkgdir/usr/share/pixmaps/error-notify.png"
  cp -r static/fonts/ "$pkgdir/usr/share/"
}
