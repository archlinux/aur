# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=clanlib10
pkgver=1.0svn3827
pkgrel=3
pkgdesc="A multi-platform game development library (legacy version)"
arch=('i686' 'x86_64')
url="http://clanlib.org/"
license=('zlib')
depends=('alsa-lib' 'libjpeg' 'libmikmod' 'libpng12'
         'libvorbis' 'libxi' 'libxxf86vm' 'mesa' 'sdl_gfx' 'glu')
conflicts=('clanlib' 'clanlib-svn')
options=('!libtool')
# source=("http://clanlib.org/download/releases-1.0/ClanLib-${pkgver}.tgz")
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/clanlib/1.0~svn3827-8/clanlib_1.0~svn3827.orig.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/clanlib/1.0~svn3827-8/clanlib_1.0~svn3827-8.debian.tar.xz"
        "include_cstddef.patch")
md5sums=('0ee29d0aeeee5e993543320a6148b372'
         '13d3f177489c2f5255249d77ab361a8f'
         'e314140173980004bd1dbb91d25e8669')

prepare() {
  cd "${srcdir}/clanlib-1.0~svn3827"
  while read -r rule
  do
    patch -p1 -i "${srcdir}/debian/patches/${rule}"
  done < "${srcdir}/debian/patches/series"
  patch -p2 -i "${srcdir}/include_cstddef.patch"
}

build() {
  cd "${srcdir}/clanlib-1.0~svn3827"
  aclocal
  libtoolize
  automake --add-missing
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/clanlib-1.0~svn3827"
  make DESTDIR="${pkgdir}" install

  # Install a license file
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
