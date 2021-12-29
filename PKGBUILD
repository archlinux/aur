# Maintainer: Andrew Mascillaro <amascillaro@gmail.com>
pkgname=weffe-git
pkgver=1.0.0.r1.g449d0db
pkgrel=1
pkgdesc="Lightweight CLI for video effects on webcams"
arch=('any')
url="https://github.com/intermezzio/weffe.git"
license=('MIT')
depends=(ffmpeg 'v4l2loopback-dkms>=0.12.5-1')
makedepends=(git)
optdepends=()
provides=(weffe)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  mkdir -p "$pkgdir/usr/share/$pkgname/static"
  install -Dm755 ./weffe "$pkgdir/usr/share/$pkgname/weffe"
  install -Dm644 ./help.md "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  install -t "$pkgdir/usr/share/$pkgname/static" static/*.png

  # TODO: manpage
  # mkdir -p "$pkgdir/usr/share/man/man1"
  # install -Dm755 ./help.md "$pkgdir/usr/share/man/man1/weffe.1"

  rm -f ./tempbin
  echo "#!/bin/sh
/usr/share/$pkgname/weffe \"\$@\"" >> ./tempbin
  install -Dm755 ./tempbin "$pkgdir/usr/bin/weffe"
}
