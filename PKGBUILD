# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=compsize-git
pkgver=v1.2.r0.g7b91a8be5d0b
pkgrel=1
pkgdesc="Btrfs: find compression type/ratio on a file or set of files"
arch=('any')
url="https://github.com/kilobyte/compsize"
license=('GPL2')
makedepends=('gcc' 'git')
source=("$pkgname"::'git://github.com/kilobyte/compsize.git#branch=master')
conflicts=('compsize')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
        cd "$srcdir/${pkgname}/"
        make
        gzip -9 compsize.8
}

package() {
        cd "${srcdir}/${pkgname}/"
        install -Dm755 \
                "./compsize" \
                "${pkgdir}/usr/bin/compsize"
        install -Dm755 \
                "./compsize.8.gz" \
                "${pkgdir}/usr/share/man/man8/compsize.8.gz"
}
