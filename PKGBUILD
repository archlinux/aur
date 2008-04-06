# $Id: PKGBUILD,v 1.18 2008/03/27 20:02:25 daniel Exp $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

# The mono-tool package now calls make-search-index by post_install().
# Whenever a package is installed which places doc-sources into:
# /usr/lib/monodoc/sources it should call --make-search-index with
# post_install() and with post remove. mond-tools itself deletes the index
# file pre_remove(), so pacman finds the directory empty an removes it
# properly.

pkgname=mono-tools
pkgver=1.9
pkgrel=1
pkgdesc="collection of testing and development tools for use with mono (including monodoc browser)"
arch=(i686 x86_64)
license=('GPL')
url="http://www.mono-project.com/"
depends=('monodoc>=1.9' 'desktop-file-utils' 'gnome-desktop-sharp>=2.20.1')
makedepends=('gecko-sharp-2.0>=0.13')
install=$pkgname.install
source=(http://www.go-mono.com/sources/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('f00eb74bd0f467f81fad3ab62e215e1a')

build() {
 # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR="${startdir}/src/weird"
  mkdir -p "${MONO_SHARED_DIR}"

  cd ${startdir}/src/${pkgname}-${pkgver}
  aclocal || return 1
  autoconf || return 1
  automake || return 1
  #sed -i 's:^Exec=.*$:Exec=/usr/bin/monodoc:' docbrowser/monodoc.desktop.in
  ./configure --prefix=/usr || return 1
  make || return 1
  make GACUTIL="/usr/bin/gacutil /root ${startdir}/pkg/usr/lib" DESTDIR=${startdir}/pkg install || return 1
}
