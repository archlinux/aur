# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Mick Elliot <micke at sfu dot ca>
# Contributor: Michael Gruz <michael.gruz at gmail dot com>

pkgbase=mafft
pkgname=('mafft-git' 'mafft-extensions-git' 'mafft-mpi-git')
pkgver=7.526.r2.g0a2319b
pkgrel=2
arch=('x86_64')
url='https://mafft.cbrc.jp/alignment/software'
license=('BSD')
makedepends=('make' 'openmpi')
provides=(${pkgbase})
#conflicts=(${pkgbase})
#source=("${pkgbase}-${pkgver}.tgz::https://gitlab.com/sysimm/mafft/-/archive/v${pkgver}/mafft-v${pkgver}.tar.gz")
#sha1sums=('98d36d806bc215bb1f32143b4090e90d6a073062')
#source=("${pkgbase}-${pkgver}.tgz::git+https://gitlab.com/sysimm/mafft.git")
source=("git+https://gitlab.com/sysimm/mafft.git"
	"001-ftruncate.patch")
md5sums=('SKIP'
         '7fcc33e5ccec220c953a7a1eab09cf5a')

pkgver() {
  cd mafft
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/mafft"
  patch -Np1 -i "../001-ftruncate.patch"
}

build() {
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  make -C "mafft/core" PREFIX=/usr LIBDIR=/usr/lib/mafft
  make -C "mafft/extensions" PREFIX=/usr LIBDIR=/usr/lib/mafft
  make -C "mafft/MPI" PREFIX=/usr LIBDIR=/usr/lib/mafft
}

package_mafft-git() {
  depends=('perl' 'sh')
  optdepends=('mafft-extensions: extension support'
	      'mafft-mpi: mpi support')
  pkgdesc='Multiple alignment program for amino acid or nucleotide sequences. https://doi.org/10.1093/molbev/mst010'
  make DESTDIR="${pkgdir}" -C "mafft/core" install PREFIX=/usr LIBDIR=/usr/lib/mafft
  rm -vf "${pkgdir}/usr/lib/mafft/mafft-homologs.1" "${pkgdir}/usr/lib/mafft/mafft.1"
}

package_mafft-extensions-git() {
  depends=('mafft')
  pkgdesc='MAFFT extensions'
  make DESTDIR="${pkgdir}" -C "mafft/extensions" install PREFIX=/usr LIBDIR=/usr/lib/mafft
}

package_mafft-mpi-git() {
  depends=('mafft' 'openmpi')
  pkgdesc='MAFFT MPI support'
  make DESTDIR="${pkgdir}" -C "mafft/MPI" install PREFIX=/usr LIBDIR=/usr/lib/mafft
}
