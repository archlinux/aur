# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

# The mono-tool package now calls make-search-index by post_install().
# Whenever a package is installed which places doc-sources into:
# /usr/lib/monodoc/sources it should call --make-search-index with
# post_install() and with post remove. mond-tools itself deletes the index
# file pre_remove(), so pacman finds the directory empty an removes it
# properly.

pkgname=mono-tools
pkgver=2.11
pkgrel=1
pkgdesc="collection of testing and development tools for use with mono (including monodoc browser)"
arch=(i686 x86_64)
license=('GPL')
url="http://www.mono-project.com/"
depends=('libgnome-sharp' 'webkit-sharp')
makedepends=('gconf-sharp' 'git' 'zip')
install=$pkgname.install
options=('!makeflags')
source=('git+https://github.com/mono/mono-tools.git#commit=d858f5f27fa8b10d734ccce7ffba631b995093e5'
        fix-build.patch)
md5sums=('SKIP'
         '9b4671fbfce76d883abbf779cbc504f3')

prepare() {
  cd $pkgname
  patch -Np1 -i ../fix-build.patch
  mv configure.in configure.ac
}

build() {
  cd $pkgname
  glib-gettextize --force
  autoreconf -fi
  GMCS=/usr/bin/dmcs ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
 }
