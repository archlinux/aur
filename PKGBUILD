# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>
# Contributor: Maik93 <michael.mugnai@gmail.com>

# Instructions / Troubleshoot Download the source from
# https://www.hsl.rl.ac.uk/ipopt/ and place it in the folder,
# alongside this PKGBUILD.  Check package version and sha256sum of the
# downloaded tarball, it may be different from the one listed here.
# If so either use "SKIP" or replace with your tarball sha256sum.

pkgname=coin-or-hsl
_pkgname=coinhsl
pkgrel=1
pkgver=2024.05.15
pkgdesc="HSL Mathematical Software Library. Including solvers for sparse linear systems of equations and sparse eigenvalue problems. Compiled with coin-or-tools, supports Ipopt."
arch=('i686' 'x86_64')
url="http://www.hsl.rl.ac.uk/"
license=('LicenseRef-STFC')
makedepends=('gcc' 'gcc-fortran')
depends=('blas-openblas' 'openblas' 'metis' 'gcc-libs' 'glibc')
optdepends=('coin-or-ipopt')
source=("ThirdParty-HSL::git+https://github.com/coin-or-tools/ThirdParty-HSL.git" "manual://${_pkgname}-${pkgver}.tar.tgz")
sha256sums=('SKIP'
            '2534807b4f6a4a69661c82dc0da7094f685f0fce6443a9147ee90a21caba9e63')

prepare() {
  cd ${srcdir}/ThirdParty-HSL
  ln -sf ../${_pkgname}-${pkgver} coinhsl
  mkdir -p build
  cd build

  ../configure \
    --prefix=/usr \
    LIBS="-llapack" \
    LDFLAGS="${LDFLAGS}" \
    CFLAGS="${CFLAGS}" \
    --with-blas="-L/usr/lib -lopenblas"
}

build() {
  cd ${srcdir}/ThirdParty-HSL/build
  make
}

package () {
  cd ${srcdir}/ThirdParty-HSL
  cd build
  make DESTDIR=${pkgdir} install

  # For Ipopt:
  ln -rs ${pkgdir}/usr/lib/libcoinhsl.so ${pkgdir}/usr/lib/libhsl.so

  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
