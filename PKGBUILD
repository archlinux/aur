# Maintainer: Uwe Koloska <kolewu [at] koloro [dot] de>
# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=snack
pkgver=2.2.10
pkgrel=11
pkgdesc="a sound toolkit for scripting languages (Tcl, Python, Ruby, ...)"
url="http://www.speech.kth.se/snack/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('tk' 'alsa-lib' 'libxft' 'libxss')
source=(http://www.speech.kth.se/snack/dist/${pkgname}${pkgver}.tar.gz
        configure.patch
        alsa.patch
        deprecated-functions.patch)
md5sums=('98da0dc73599b3a039cba1b7ff169399'
         '330da66b5e9763933a8d8262af914a9a'
         '5d92710f4515f70861fd45312c7372bb'
         '3167282bd079291792337bd7f0ad8997')

build() {
  cd ${pkgname}${pkgver}

  # bug from glib - error from /usr/include/bits/mathcalls.h:310
  sed -i -e 's|^\(#define roundf(.*\)|//\1|' generic/jkFormatMP3.c

  patch -p0 -i ../configure.patch
  patch -p0 -i ../alsa.patch
  patch -p0 -i ../deprecated-functions.patch

  cd unix

  ./configure --prefix=/usr \
              --with-tcl=/usr/lib \
	      --with-tk=/usr/lib \
	      --enable-alsa
  make
}

package() {
  cd ${pkgname}${pkgver}/unix

  make DESTDIR=${pkgdir} install
}
