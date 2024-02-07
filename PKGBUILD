#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=poissonrecon-git
pkgver=8.0.r70.ga5c7d35
pkgrel=1
pkgdesc="Screened Poisson Surface Reconstruction (and Smoothed Signed Distance Reconstruction)"
arch=('i686' 'x86_64')
url="http://www.cs.jhu.edu/~misha/Code/PoissonRecon/Version9.0/"
license=('MIT')
groups=('photogrametry')
depends=('glibc' 'libpng' 'libjpeg')
makedepends=('git')
# use ccache-ext to make gcc8 cacheable if using options=(ccache)
[[ "${BUILDENV[*]}" =~ [^!]+ccache ]] && makedepends+=('ccache-ext')
options=(!makeflags)
provides=('poissonrecon' 'ssdrecon' 'surfacetrimmer')
source=("${pkgname}::git+https://github.com/mkazhdan/PoissonRecon.git")
sha256sums=('SKIP')

pkgver() {
  # cutting off 'V' prefix that presents in the git tag
  git -C ${pkgname} describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CCACHE_BASEDIR="$srcdir"
  make -C ${pkgname}
}

package() {
  cd ${pkgname}
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm755 Bin/Linux/PoissonRecon "${pkgdir}"/usr/bin/poisson-recon
  install -Dm755 Bin/Linux/SSDRecon "${pkgdir}"/usr/bin/ssd-recon
  install -Dm755 Bin/Linux/SurfaceTrimmer "${pkgdir}"/usr/bin/surface-trimmer
}

# vim:set ts=2 sw=2 et:
