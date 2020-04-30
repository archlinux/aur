# Contributor: Jürgen Hötzel <juergen@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=bigloo-devel
pkgver=4.3h
pkgrel=7
epoch=1
pkgdesc="Fast scheme compiler"
arch=('x86_64')
url="https://www-sop.inria.fr/mimosa/fp/Bigloo/"
license=('GPL' 'LGPL')
depends=('gmp' 'openssl' 'libunistring' 'libnsl' 'gc' 'libuv')
makedepends=('java-environment' 'emacs' 'zip' 'sqlite' 'alsa-lib' 'flac' 'avahi' 'chrpath')
optdepends=('java-environment' 'emacs' 'zip' 'sqlite' 'alsa-lib' 'flac' 'avahi')
options=('!makeflags' 'staticlibs')
conflicts=('bigloo')
provides=("bigloo=$pkgver")
source=(ftp://ftp-sop.inria.fr/indes/fp/Bigloo/${pkgname%-devel}-unstable.tar.gz bigloo-emacs.patch)
md5sums=('ba9a823da14d97da91b666a750839ea4'
         '35b417dfd1928c8cacca3e3931cc4c3a')
elisp_dir=/usr/share/emacs/site-lisp/bigloo

build() {
  cd ${pkgname%-devel}-${pkgver} 
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
    --jvm=no \
    --native-default-backend \
    --enable-avahi \
    --enable-flac \
    --enable-sqlite \
    --enable-ssl \
    --disable-gstreamer

  make build compile-bee
}

prepare() {
  patch -p0 -d "${srcdir}/${pkgname%-devel}-${pkgver}" -i "${srcdir}/bigloo-emacs.patch"
}

check() {
  cd ${pkgname%-devel}-${pkgver} 
  make test
}

package() {
  cd ${pkgname%-devel}-${pkgver}

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
      -i  ${pkgdir}/usr/lib/bigloo/$pkgver/Makefile.config

}
