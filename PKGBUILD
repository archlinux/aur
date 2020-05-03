# Contributor: aphirst <adam@aphirst.karoo.co.uk>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgbase=fgsl
pkgname=('fgsl' 'fgsl-docs')
pkgver=1.3.0
pkgrel=1
pkgdesc="A Fortran interface to the GNU Scientific Library"
arch=('i686' 'x86_64')
url="https://github.com/reinh-bader/fgsl"
license=('GPL2')
depends=("gsl" 'gcc-fortran')
makedepends=('git' 'automake')
source=("git+${url}#tag=v${pkgver}"
	"undefined.patch::https://github.com/tschoonj/fgsl/commit/c306e9f936983df5bab68f8ba55006c0f88bc775.patch")
sha256sums=('SKIP'
            'b6b248dc4aa514da84ecf81a1de4a33a7e2c73feee0d1fc3d57a82205e721bc4')

build() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i "$srcdir"/undefined.patch
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}"
  make -j1 check
}

package_fgsl() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="${pkgdir}"
  rm -rf "$pkgdir"/usr/share
}

package_fgsl-docs() {
  pkgdesc="${pkgdesc} - docs"
  depends=('fgsl')
  arch=('any')

  cd "${srcdir}/${pkgbase}/doc"
  install -dm644 "$pkgdir"/usr/share/{doc,examples}
  make DESTDIR="$pkgdir" install
}
