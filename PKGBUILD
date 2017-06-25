# $Id: PKGBUILD 195253 2016-11-09 21:24:04Z stativ $
# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Serge Gielkens <gielkens.serge@mumeli.org>
pkgname=gimp-plugin-mathmap
pkgver=1.3.5
pkgrel=8
pkgdesc="A GIMP plug-in which allows distortion of images specified by mathematical formulae"
arch=('i686' 'x86_64')
url="http://www.complang.tuwien.ac.at/schani/mathmap/"
license=('GPL')
depends=('gimp' 'gsl' 'gtksourceview2' 'fftw' 'giflib')
makedepends=('doxygen' 'unzip')
provides=('gimp-mathmap')
replaces=('gimp-mathmap')
source=(https://www.complang.tuwien.ac.at/schani/mathmap/files/mathmap-${pkgver}.tar.gz
        fix_libnoise_build.patch libpng15.patch giflib-5.1.patch mathmap-gsl2.patch
        flexible_array_member.diff)
md5sums=('6ff66d070ea410dee1a27283d05b8beb'
         'eca40de0ba0e6b8d34b7d1f904bc3d18'
         '9780d6354b7380b772c4616253ecee54'
         'a4dae904ede98ee8d3104bcfd285cec5'
         '34350e9d8edc451926298919a9300990'
         '769f284e7c0388f11849509487f5275f')

prepare() {
  cd "$srcdir/mathmap-$pkgver"

  # fix problem with building libnoise
  patch -Np1 < "$srcdir"/fix_libnoise_build.patch
  # fix for libpng 1.5
  patch -Np1 < "$srcdir"/libpng15.patch
  # fix for giflib 5.1
  patch -Np1 < "$srcdir"/giflib-5.1.patch
  # fix build with GSL 2
  patch -Np1 -i "$srcdir"/mathmap-gsl2.patch
  # fix build, GCC doesn't like flexible array members in unions
  patch -Np1 -i "$srcdir"/flexible_array_member.diff
}

build() {
  cd "$srcdir/mathmap-$pkgver"

  make
}

package() {
  cd "$srcdir/mathmap-$pkgver"
  make DESTDIR="$pkgdir" install
}
