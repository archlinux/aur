# Contributor: Jürgen Hötzel <juergen@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bigloo-git
pkgver=4.5a.r3528.16e397e1
pkgrel=1
pkgdesc="Fast scheme compiler"
arch=('x86_64')
url="https://www-sop.inria.fr/mimosa/fp/Bigloo/"
license=('GPL' 'LGPL')
depends=('gmp' 'openssl' 'libunistring' 'libnsl' 'libuv' 'libpulse'
	 'mpg123' 'avahi' 'sqlite' 'gstreamer')
makedepends=('bigloo' 'java-environment' 'emacs' 'zip' 'sqlite' 'alsa-lib' 'flac' 'avahi' 'chrpath' 'tar')
optdepends=('java-environment' 'emacs' 'zip' 'sqlite' 'alsa-lib' 'flac' 'avahi')
options=('!makeflags' 'staticlibs')
conflicts=('bigloo')
provides=("bigloo")
source=(git+https://github.com/manuel-serrano/bigloo.git bigloo-emacs.patch no_scribe.patch)
sha256sums=('SKIP'
            '80356c27b58a302775f75e848a89ab2d588796a548f4ce7a20df048e215deab0'
            'a865861edecd0f797c7e65ddd3cc46e3d4d4cf95de53d81847844314dde91be5')

pkgver() {
  cd ${pkgname%-git}
  printf "%s.r%s.%s" $(grep ^release configure| cut -d= -f2) $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  patch -p0 -d ${pkgname%-git} -i "${srcdir}/bigloo-emacs.patch"
  cd ${pkgname%-git}
  git apply "$srcdir"/no_scribe.patch
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr \
	      --build-bindir=/usr/bin \
	      --docdir=/usr/share/doc/bigloo \
	      --mandir=/usr/share/man \
	      --infodir=/usr/share/info \
	      --lispdir=${elisp_dir} \
	      --coflags="$CFLAGS" \
	      --cpicflags="-fPIC" \
	      --customgc=yes \
	      --customgmp=no \
	      --customlibuv=no \
	      --customunistring=no \
	      --jvm=no \
	      --native-default-backend \
	      --enable-avahi \
	      --enable-flac \
	      --enable-sqlite \
	      --enable-ssl \
	      --enable-gstreamer \
	      --disable-mqtt
  
  EXTRALIBS="-ldl -lresolv -lunistring -lpcre -lgmp -lm -lc" make build compile-bee
}

package() {
  cd ${pkgname%-git}

  make DESTDIR="${pkgdir}" install install-bee
  make -C manuals DESTDIR="${pkgdir}" install-bee
}
