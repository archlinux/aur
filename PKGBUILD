# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

# The mono-tool package now calls make-search-index by post_install().
# Whenever a package is installed which places doc-sources into:
# /usr/lib/monodoc/sources it should call --make-search-index with
# post_install() and with post remove. mond-tools itself deletes the index
# file pre_remove(), so pacman finds the directory empty an removes it
# properly.

pkgname=mono-tools
pkgver=3.10
pkgrel=3
pkgdesc="collection of testing and development tools for use with mono (including monodoc browser)"
arch=(i686 x86_64)
license=('GPL')
url="http://www.mono-project.com/"
depends=('libgnome-sharp' 'webkit-sharp')
makedepends=('gconf-sharp' 'git' 'zip')
install=$pkgname.install
options=('!makeflags')
source=($pkgname-$pkgver.tar.gz::https://github.com/mono/mono-tools/archive/$pkgver.tar.gz
	fix-build.patch
	monodoc.xml)
#source=(http://download.mono-project.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('8df1eed41d5ff6dc6d48541f1c593319'
         '9b4671fbfce76d883abbf779cbc504f3'
         '641a50e8414132c425df2d87edfdaa95')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../fix-build.patch
  mv configure.in configure.ac
}

build() {
  cd $pkgname-$pkgver
  glib-gettextize --force
  autoreconf -fi
  GMCS=/usr/bin/dmcs ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 "${srcdir}"/monodoc.xml "${pkgdir}"/usr/lib/monodoc/monodoc.xml
 }
