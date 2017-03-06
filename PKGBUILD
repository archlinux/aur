# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target="arm-frc-linux-gnueabi"
pkgname=${_target}-binutils
pkgver=2.28
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files (${_target})"
arch=(i686 x86_64)
license=(GPL)
options=(!libtool !buildflags !emptydirs)
url="http://sources.redhat.com/binutils"
groups=('frc-2017')
depends=('glibc')
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2)
md5sums=('9e8340c96626b469a603c15c9d843727')

build() {
  cd "$srcdir/binutils-${pkgver}"

  find -name config.cache -exec rm {} \;

  [ $NOEXTRACT -eq 1 ] || ./configure \
    --prefix=/usr \
    --target=${_target} \
    --with-pkgversion='GNU Binutils for FRC' \
    --with-sysroot=/usr/${_target} \
    --disable-multilib \
    --disable-nls \
    --enable-lto \
    --disable-libiberty-install \
    --enable-ld \
    --enable-gold=default \
    --enable-plugins

  make configure-host
  make
}

package() {
  cd "$srcdir/binutils-${pkgver}"

  make DESTDIR=$pkgdir install

  rm -rf "$pkgdir"/usr/share/info
}
