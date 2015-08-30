# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>

pkgname=musepack-tools
pkgver=475
pkgrel=4
pkgdesc="Musepack decoder/encoder"
arch=('i686' 'x86_64')
url="http://www.musepack.net/"
license=('LGPL')
depends=('libcuefile' 'libreplaygain')
makedepends=('cmake')
source=("http://files.musepack.net/source/musepack_src_r$pkgver.tar.gz"
        'math.patch'
        'static.patch')
md5sums=('754d67be67f713e54baf70fcfdb2817e'
         '9de31f07a3492c7b1db1248b055fbdc8'
         'cf1f60e9fce97687f28a4aa43b80f17d')

build() {
  cd "$srcdir/musepack_src_r$pkgver"

  #export LDFLAGS+="-lm"

  patch -Np1 -i "$srcdir/math.patch"
  patch -Np1 -i "$srcdir/static.patch"
  
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_SKIP_RPATH=ON
}

package() {
  cd "$srcdir/musepack_src_r$pkgver"

  make DESTDIR="$pkgdir" install

  for bin in chap cut dec enc gain 2sv8; do
    install -Dm755 mpc$bin/mpc$bin "$pkgdir/usr/bin/mpc$bin"
  done

  find ${pkgdir} -depth -type d -name .svn -exec rm -rf {} \;
}
