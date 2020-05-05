# Contributor: aphirst <adam@aphirst.karoo.co.uk>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgbase=fgsl
pkgname=('fgsl' 'fgsl-docs' 'fgsl-examples')
pkgver=1.3.0
pkgrel=2
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

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

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
  
  cd "$pkgdir"
  _pick examples usr/share/examples
  _pick doc usr/share/doc
}

package_fgsl-docs() {
  pkgdesc="${pkgdesc} - docs"
  depends=('fgsl')
  arch=('any')

  mv doc/* "$pkgdir"
}

package_fgsl-examples() {
  pkgdesc="${pkgdesc} - examples"
  depends=('fgsl')
  arch=('any')

  mv examples/* "$pkgdir"
}
