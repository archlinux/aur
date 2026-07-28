# Maintainer: Joar Heimonen <joar@lightside-instruments.com>

pkgname=yuma123-git
pkgver=latest
pkgrel=2
pkgdesc="Open-source YANG API in C, yangcli and netconfd server"
arch=('any')
url="https://github.com/vlvassilev/yuma123"
license=('BSD')
depends=()
makedepends=('git' 'autoconf' 'automake' 'make' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+https://github.com/vlvassilev/yuma123#commit=4ee2d632ccfd3d00ccfb7c0faf96639d0b47ec73"
        "yuma123-libxml2-prolog-newline.patch")
sha256sums=('a82ab24dd79a80f1a98df4d7fd94009a70613d0ade77d3c6e8cd5a71e4f7757f'
            '6ea9f3fe25b5bf57f6e8c3fbc8da8b0948efff5e05e423cef522fe0ccf4293a0')

prepare() {
  cd "$srcdir/yuma123"
  patch -Np1 -i "$srcdir/yuma123-libxml2-prolog-newline.patch"
  autoreconf -i -f
}

build() {
  cd "$srcdir/yuma123"
  ./configure CFLAGS='-O2' CXXFLAGS='-O2' --prefix=/usr
  make
}

package() {
  cd "$srcdir/yuma123"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/bin/sbin/netconfd" "${pkgdir}/usr/bin/netconfd"
  mv "${pkgdir}/usr/bin/sbin/netconf-subsystem" "${pkgdir}/usr/bin/netconf-subsystem"
  rm -rf "${pkgdir}/usr/sbin"
}