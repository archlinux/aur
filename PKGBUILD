# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbasename=gmp
pkgname=lib32-$_pkgbasename-hg
pkgver=6.2.1
pkgrel=1
pkgdesc="A free library for arbitrary precision arithmetic (32-bit)"
arch=('x86_64')
url="https://gmplib.org/"
depends=('lib32-gcc-libs' $_pkgbasename)
makedepends=(gcc-multilib mercurial)
license=('LGPL3' 'GPL')
source=("hg+https://gmplib.org/repo/gmp/")
provides=(lib32-gmp)
conflicts=(lib32-gmp)
sha512sums=('SKIP')
#validpgpkeys=('343C2FF0FBEE5EC2EDBEF399F3599FF828C67298') # Niels Möller

pkgver() {
	cd "gmp"

	# GMP version (extracted from gmp-h.in)
	_gmpvermaj=`sed -n -e 's/^.*__GNU_MP_VERSION[[:space:]]*\([[:digit:]]*\)[[:space:]]*$/\1/p' gmp-h.in`
	_gmpvermin=`sed -n -e 's/^.*__GNU_MP_VERSION_MINOR[[:space:]]*\([[:digit:]]*\)[[:space:]]*$/\1/p' gmp-h.in`
	_gmpverrev=`sed -n -e 's/^.*__GNU_MP_VERSION_PATCHLEVEL[[:space:]]*\([[:digit:]]*\)[[:space:]]*$/\1/p' gmp-h.in`
	_gmpver=$_gmpvermaj.$_gmpvermin.$_gmpverrev
	# Date of the last commit
	_hgver=`hg identify -n`

	echo $_gmpver.hg$_hgver;
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd gmp

  export ABI=32

  ./.bootstrap

  ./configure \
    --prefix=/usr --infodir=/usr/share/info \
    --enable-fat --enable-cxx --libdir=/usr/lib32 \
    --includedir=/usr/lib32/gmp

  #Put gmp.h in the same folder as gmpxx.h
  sed -i 's/$(exec_prefix)\/include/$\(includedir\)/' Makefile

  make
}

#check() {
#  gmp
#  make check
#}

package() {
  cd gmp
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
