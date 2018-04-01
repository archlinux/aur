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
        zero-length_array.diff)
sha256sums=('1d0542de10b189f8785a5adc62b7d49e6c1c7be1fa9cf1fecdd88e609ebd2172'
            '37d7f2f6339c13fa63402dba5a013f2b1c9927212662ee26978f641cbccdd2c1'
            '09427c25abe0a4eddf07e5ff799e42e752703a15e4e6228e8b783a2d944565f3'
            '8f129420264bd59e574890408089355d5f79331f23a9fe0cd28040f3a75570bd'
            '86c2661b5883738ee180527a32416e311c6b6ab95c325bfbc7f4563ff7b71fd9'
            '099cac639a20b84f2726ef3af62840e0aac61af903d9fc83b3d7dc40954a4f68')

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
  # flexible array members are not allowed in structures that are members of union
  # zero-length arrays GCC extension allows this
  patch -Np1 -i "$srcdir"/zero-length_array.diff
}

build() {
  cd "$srcdir/mathmap-$pkgver"

  make
}

package() {
  cd "$srcdir/mathmap-$pkgver"
  make DESTDIR="$pkgdir" install
}
