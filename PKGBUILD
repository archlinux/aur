# Maintainer: yifwon <wyf9661 at gmail dot com>
# Contributor: chexum <chexum+git@gmail.com>

pkgname=genromfs-git
pkgver=0.5.7.r89.e4225b
pkgrel=1
pkgdesc="tool for creating romfs images"
arch=(i686 x86_64)
url="http://romfs.sf.net"
license=('GPL')
conflicts=("${pkgname%-git}")
depends=("glibc")
source=(git+https://github.com/chexum/${pkgname%-git}.git)
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  # Get the version number.
  printf "%s.r%s.%s" \
    "$(awk -F'= ' '/^VERSION = / {print $2}' Makefile)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=6 HEAD)"
}

build() {
    cd "${pkgname%-git}"
    make
} 

package() {
    cd "${pkgname%-git}"
    
    # The provided install target does not install man page in correct folder: make PREFIX="$pkgdir" install
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 genromfs "$pkgdir/usr/bin"
    
    mkdir -p "$pkgdir/usr/share/man/man8"
    gzip -f genromfs.8
    install -m 644 genromfs.8.gz "$pkgdir/usr/share/man/man8"
} 
