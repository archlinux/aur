#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_name=poissonrecon
_fragment="#commit=c1b1214"
pkgname=${_name}
pkgver=11.0
pkgrel=2
pkgdesc="Screened Poisson Surface Reconstruction (and Smoothed Signed Distance Reconstruction)"
arch=('i686' 'x86_64')
url="http://www.cs.jhu.edu/~misha/Code/PoissonRecon/Version9.0/"
license=('MIT')
groups=('photogrametry')
depends=('glibc' 'gcc8-libs' 'libpng' 'libjpeg')
makedepends=('git' 'gcc8')
options=(!makeflags)
provides=('poissonrecon' 'ssdrecon' 'surfacetrimmer')
source=("${pkgname}::git+https://github.com/mkazhdan/PoissonRecon.git${_fragment}"
        "patch.diff::https://github.com/mkazhdan/PoissonRecon/commit/2fcb16ac782fac312dc3225bea33227cbc0d7488.diff")
sha256sums=('SKIP'
            '7a1f874a018428979b3bc66288790497be4b30635f6c6b608d48d28ebd84fd35')

#pkgver() {
#  cd ${srcdir}/${pkgname}
#  # cutting off 'V' prefix that presents in the git tag
#  git describe --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

prepare() {
  cd ${srcdir}/${pkgname}
  git apply -v ${srcdir}/*.diff
 sed -i -e 's/CC=gcc/CC=gcc-8/' -e 's/CXX=g++/CXX=g++-8/' Makefile
}

build() {
  cd ${srcdir}/${pkgname}
  
  make
}

package() {
  cd ${srcdir}/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm755 Bin/Linux/PoissonRecon ${pkgdir}/usr/bin/poisson-recon
  install -Dm755 Bin/Linux/SSDRecon ${pkgdir}/usr/bin/ssd-recon
  install -Dm755 Bin/Linux/SurfaceTrimmer ${pkgdir}/usr/bin/surface-trimmer
}

# vim:set ts=2 sw=2 et:
