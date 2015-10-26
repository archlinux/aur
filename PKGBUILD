# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Rickard Gustafsson <rickard@allyourbase.se>
# Contributor: Nathan Owe <ndowens04 at gmail>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: Joel Klinghed <the_jk@yahoo.com>

pkgname=pike
pkgver=7.8.866
pkgrel=2
pkgdesc='Dynamic programming language with a syntax similar to Java and C'
arch=('x86_64' 'i686')
url='http://pike.lysator.liu.se/'
license=('GPL2' 'LGPL' 'MPL')
depends=('gtksourceview2' 'sane' 'libzip' 'libmysqlclient' 'gtkglarea' 'nettle')
makdepends=('nettle')
source=("http://pike.lysator.liu.se/pub/pike/latest-stable/Pike-v$pkgver.tar.gz"
        'http://www.spawned.biz/the_jk/pike-add_static_memcmp-0.patch'
        'http://www.spawned.biz/the_jk/pike-disable_libdir_reset-0.patch')
sha256sums=('0b12e1a99bd8bdd9c8a2daa46e623ac718bc0737290236a0c8474091359b594e'
            '458fb74f8c28a0a51caef392f5905c0a5803e7579eb281735029a43150cd1140'
            '0aaa97a2f19b48cd66832ed421eaaf19364a6b374e413bd0015f57dac5660b26')

prepare() {
  cd "Pike-v$pkgver"

  patch -p1 -i ../pike-add_static_memcmp-0.patch
  patch -p1 -i ../pike-disable_libdir_reset-0.patch
}

build() {
  cd "Pike-v$pkgver"

  # Thank you for the flags Gentoo <3
  # http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-lang/pike/pike-7.8.352-r2.ebuild?view=markup
  make CONFIGUREARGS=" \
    --prefix=/usr \
    --libdir=/usr/lib \
    --disable-make_conf \
    --disable-noopty-retry \
    --without-cdebug \
    --without-bundles \
    --without-copt \
    --without-libpdf \
    --without-ssleay \
    --with-crypt \
    --with-gif \
    --with-gmp \
    --with-bignums \
    --without-machine-code"
  gzip man/pike.1
}

package() {
  cd "Pike-v$pkgver"

  make buildroot="$pkgdir" INSTALLARGS='--traditional' install_nodoc
  rm -rf "$pkgdir/usr/"{doc,man}
  install -Dm644 man/pike.1.gz "$pkgdir/usr/share/man/man1/pike.1.gz"
}

# vim:set ts=2 sw=2 et:
