# Maintainer: envolution
# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# shellcheck shell=bash disable=SC2034,SC2154
pkgbase=gforth
pkgname=('gforth' 'gforth-docs')
pkgver=0.7.3
pkgrel=7
url="http://www.gnu.org/software/gforth/"
arch=('i686' 'x86_64' 'armv6h')
license=('GPL-3.0-or-later')
makedepends=('libtool' 'texinfo' 'texlive-meta')
depends=(libffi glibc ffcall)
options=(!lto)
#source=("https://git.savannah.gnu.org/cgit/gforth.git/snapshot/${pkgbase}-${pkgver}.tar.gz" #official source
source=("https://ftp.gnu.org/gnu/gforth/gforth-${pkgver}.tar.gz"
  script-hashbang.patch
  skip-install.patch
  hppa-build.patch
  minus-number.patch
  distclean.patch
  configure-assumptions.patch
  manpage.patch
  qrnnd-build.patch
  elisp-auto-mode.patch
  env-cflags.patch
  typos.patch
  hppa.patch
  double-const.patch    #the above are debian patches
  gforth-0.7.3.patch    #this was from the gnu homepage
  fflib.patch           #this was to correct the fflib forth compiled C code causing compilation failures
  gdb-set-logging.patch #Arch uses newer gdb, this avoids an annoying warning upon every disassembly
  strict-prototypes.patch  # GCC 15.1 regards () as (void) rather than "matches anything"
)
md5sums=('ff484391e5cdf405867fcf96341820ab'
         '8a38578d1b44b83d533d6be27976fbf0'
         'a1f3d22df2b283f4c7d4d96e3d6d654b'
         '28c0280b208a218ee4e701cde6c865f3'
         '98a5ef18105fe0ff675486544ae2aa0c'
         'e287a2fecd07520d6c20e52d8d9d4704'
         'bea5dce50ea17218101b76f1ddb56f37'
         '8f359f38a81fb1cbbf2def2bec23f6db'
         '0f79ed939a095f5b7f75c1f0d610808c'
         'dbdbd4c373df5e376c85044bea31d84b'
         'ca7d29dc27734907b64cb1b3adea7b06'
         '3e3bbef2a72b31a6382c0388b07e31c6'
         '537a37c2a808c89e7d7e1929e09437cf'
         '67592037dc6e7e6129aee5c6897766ff'
         '05325fb09f814940838fa1a26182a1fc'
         '11ccb8cf94f6b593771a44ee388432a9'
         '3d643861a1fd12943693328712002288'
         '15dbdf46cde43aed31244218dfd9af09')

prepare() {
  cd "$pkgbase-$pkgver"
  patch -Np1 -i ../script-hashbang.patch
  patch -Np1 -i ../skip-install.patch
  patch -Np1 -i ../hppa-build.patch
  patch -Np1 -i ../minus-number.patch
  patch -Np1 -i ../distclean.patch
  patch -Np1 -i ../configure-assumptions.patch
  patch -Np1 -i ../manpage.patch
  patch -Np1 -i ../qrnnd-build.patch
  patch -Np1 -i ../elisp-auto-mode.patch
  patch -Np1 -i ../env-cflags.patch
  patch -Np1 -i ../typos.patch
  patch -Np1 -i ../hppa.patch
  patch -Np1 -i ../double-const.patch
  patch -Np0 -i ../gforth-0.7.3.patch
  patch -Np2 -i ../fflib.patch
  patch -Np1 -i ../gdb-set-logging.patch
  patch -Np1 -i ../strict-prototypes.patch

  CONFIGURE_OPTS=(--prefix=/usr)
  if check_option "debug" "y"; then
    CONFIGURE_OPTS+=(--with-debug)
  fi
  ./configure "${CONFIGURE_OPTS[@]}"
  sed -i "s/\(-DDEFAULTPATH='\)\"\([^\"]*\)\"'\(\s*\)/\1\2'\3/g" Makefile #one of the debian patches caused a quotation issue
}

build() {
  cd "$pkgbase-$pkgver"
  make -j1 #reported failures https://aur.archlinux.org/packages/gforth#comment-1006294 - possibly means we don't need options=(!lto)
  make more
}

check() {
  cd "$pkgbase-$pkgver"
  make check
}

package_gforth() {
  pkgdesc="Fast and portable implementation of the ANS Forth language"
  arch=('i686' 'x86_64' 'armv6h')
  depends=(libffi glibc ffcall)
  optdepends=('gforth-docs: Documentation for gforth')
  install=gforth.install

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgbase/README"
}

package_gforth-docs() {
  pkgdesc="Documentation for gforth"
  arch=('any')
  depends+=('gforth')

  # Build the documentation
  cd "$pkgbase-$pkgver"
  make doc

  install -dm755 "${pkgdir}/usr/share/doc/gforth"
  
  install -m644 doc/gforth.ps "${pkgdir}/usr/share/doc/gforth/"
  install -m644 doc/vmgen.ps "${pkgdir}/usr/share/doc/gforth/"
	cp -r doc/gforth_html "${pkgdir}/usr/share/doc/gforth/html"
	cp -r doc/vmgen_html "${pkgdir}/usr/share/doc/gforth/vmgen-html"
  
  install -m644 doc/gforth.txt "${pkgdir}/usr/share/doc/gforth/" || true
  install -m644 doc/vmgen.txt "${pkgdir}/usr/share/doc/gforth/" || true
  
  install -m644 AUTHORS ChangeLog NEWS ToDo BUGS "${pkgdir}/usr/share/doc/gforth/"
  
  install -dm755 "${pkgdir}/usr/share/doc/gforth/source"
  install -m644 doc/gforth.texi doc/vmgen.texi "${pkgdir}/usr/share/doc/gforth/source/"
  
  install -m644 doc/glossaries.doc "${pkgdir}/usr/share/doc/gforth/" || true
  
  install -m644 gforth.TAGS "${pkgdir}/usr/share/doc/gforth/" || true
}

# vim:set ts=2 sw=2 et:
