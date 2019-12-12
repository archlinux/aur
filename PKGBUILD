# Contributor: Jürgen Hötzel <juergen@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bigloo-devel
_pkgver=4.3g-alpha11Dec19
pkgver=${_pkgver/-/_}
majorver=4.3g
pkgrel=1
epoch=3
pkgdesc="Fast scheme compiler"
arch=('x86_64')
url="https://www-sop.inria.fr/mimosa/fp/Bigloo/"
license=('GPL' 'LGPL')
depends=('gmp' 'openssl' 'libunistring' 'libnsl' 'gc' 'libuv')
makedepends=('java-environment' 'emacs' 'zip' 'sqlite' 'alsa-lib' 'flac' 'avahi' 'chrpath')
optdepends=('java-environment' 'emacs' 'zip' 'sqlite' 'alsa-lib' 'flac' 'avahi')
options=('!makeflags' 'staticlibs')
conflicts=('bigloo')
provides=('bigloo')
source=(ftp://ftp-sop.inria.fr/indes/fp/Bigloo/${pkgname%-devel}${_pkgver}.tar.gz bigloo-emacs.patch)
sha256sums=('3f159ddfaa9231281c1240d8a88e948765e1b0d738cd78416daeb9a410585fde'
            '80356c27b58a302775f75e848a89ab2d588796a548f4ce7a20df048e215deab0')

elisp_dir=/usr/share/emacs/site-lisp/bigloo

build() {
  cd ${pkgname%-devel}${majorver} 
  ./configure --prefix=/usr \
    --docdir=/usr/share/doc/bigloo \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --lispdir=${elisp_dir} \
    --coflags="$CFLAGS" \
    --cpicflags="-fPIC" \
    --customgc=no \
    --customgmp=no \
    --customlibuv=no \
    --jvm=yes \
    --native-default-backend \
    --enable-avahi \
    --enable-flac \
    --enable-sqlite \
    --enable-ssl \
    --disable-gstreamer

  make build compile-bee
}

prepare() {
  patch -p0 -d "${srcdir}/${pkgname%-devel}${majorver}" -i "${srcdir}/bigloo-emacs.patch"
}

check() {
  cd ${pkgname-devel}${majorver}
  make test
}

package() {
  cd ${pkgname%-devel}${majorver}

  make DESTDIR="${pkgdir}" install install-bee
  make -C manuals DESTDIR="${pkgdir}" install-bee

  rm "${pkgdir}"/usr/bin/{bglafile,bigloo}.sh

  # Remove references to the build root
  sed -e "s|^BOOTDIR=.*|BOOTDIR=/usr|g" \
      -e "s|^BOOTBINDIR=.*|BOOTBINDIR=/usr/bin|g" \
      -e "s|^BOOTLIBDIR=.*|BOOTLIBDIR=/usr/lib/bigloo/${pkgver}|g" \
      -e "s|^BGLBUILDBINDIR=.*|BGLBUILDBINDIR=/usr/bin|g" \
      -e "s|^BGLBUILDLIBDIR=.*|BGLBUILDLIBDIR=/usr/lib/bigloo/${pkgver}|g" \
      -e "s|^\(BIGLOO=.*\)\.sh|\1|" \
      -e "s|^\(BGL.*=.*\)\.sh|\1|" \
      -i  ${pkgdir}/usr/lib/bigloo/${majorver}/Makefile.config

}
