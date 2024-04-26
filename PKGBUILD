# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: Butui Hu <hot123tea123@gmail.com>
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgbase=mafft
pkgname=('mafft' 'mafft-extensions' 'mafft-mpi')
pkgver=7.526
pkgrel=1
arch=('x86_64')
url='https://mafft.cbrc.jp/alignment/software'
license=('BSD')
makedepends=('make' 'openmpi')
source=("${pkgbase}-${pkgver}.tgz::https://gitlab.com/sysimm/mafft/-/archive/v${pkgver}/mafft-v${pkgver}.tar.gz")
sha1sums=('98d36d806bc215bb1f32143b4090e90d6a073062')

build() {
  make -C "${pkgbase}-v${pkgver}/core" PREFIX=/usr LIBDIR=/usr/lib/mafft
  make -C "${pkgbase}-v${pkgver}/extensions" PREFIX=/usr LIBDIR=/usr/lib/mafft
  make -C "${pkgbase}-v${pkgver}/MPI" PREFIX=/usr LIBDIR=/usr/lib/mafft
}

package_mafft() {
  depends=('perl' 'sh')
  optdepends=('mafft-extensions: extension support'
	      'mafft-mpi: mpi support')
  pkgdesc='Multiple alignment program for amino acid or nucleotide sequences. https://doi.org/10.1093/molbev/mst010'
  make DESTDIR="${pkgdir}" -C "${pkgbase}-v${pkgver}/core" install PREFIX=/usr LIBDIR=/usr/lib/mafft
  rm -vf "${pkgdir}/usr/lib/mafft/mafft-homologs.1" "${pkgdir}/usr/lib/mafft/mafft.1"
}

package_mafft-extensions() {
  depends=('mafft')
  pkgdesc='MAFFT extensions'
  make DESTDIR="${pkgdir}" -C "${pkgbase}-v${pkgver}/extensions" install PREFIX=/usr LIBDIR=/usr/lib/mafft
}

package_mafft-mpi() {
  depends=('mafft' 'openmpi')
  pkgdesc='MAFFT MPI support'
  make DESTDIR="${pkgdir}" -C "${pkgbase}-v${pkgver}/MPI" install PREFIX=/usr LIBDIR=/usr/lib/mafft
}
