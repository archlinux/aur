# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
# Creator: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=compsize-git
pkgver=r123.a57aa34
pkgrel=1
pkgdesc="Btrfs: find compression type/ratio on a file or set of files"
arch=('any')
url="https://github.com/justinbrewer/compsize"
license=('GPL2')
makedepends=('gcc' 'git')
source=('git+https://github.com/justinbrewer/compsize#branch=btrfs-progs-fixes')
conflicts=('compsize')
provides=('compsize')
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  cd "${pkgname%-git}"
  make
  gzip -9 compsize.8
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 \
          "./compsize" \
          "${pkgdir}/usr/bin/compsize"
  install -Dm755 \
          "./compsize.8.gz" \
          "${pkgdir}/usr/share/man/man8/compsize.8.gz"
}
