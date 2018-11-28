# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

# The mono-tool package now calls make-search-index by post_install().
# Whenever a package is installed which places doc-sources into:
# /usr/lib/monodoc/sources it should call --make-search-index with
# post_install() and with post remove. mond-tools itself deletes the index
# file pre_remove(), so pacman finds the directory empty an removes it
# properly.

pkgname=mono-tools
pkgver=4.2
pkgrel=2
pkgdesc="collection of testing and development tools for use with mono (including monodoc browser)"
arch=(x86_64)
license=('GPL')
url="http://www.mono-project.com/"
depends=('gtk-sharp-2')
makedepends=('git' 'zip')
install=$pkgname.install
options=('!makeflags')
source=($pkgname-$pkgver.tar.gz::https://github.com/mono/mono-tools/archive/$pkgver.tar.gz
	monodoc.xml)
sha256sums=('104f7a7e98202c44cd4f025ab8a922bd193e83ce874a48e50ffb401128ca73a8'
            '80de1af405556addbb481d9ac123e5f94b08ad7869c90fb469d71eb08c941480')

prepare() {
  cd $pkgname-$pkgver
  mv configure.in configure.ac

  sed -e 's/-warnaserror+//' -i gendarme/options.make # Fix build with newer mono
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
