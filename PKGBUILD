# Maintainer: yuhldr <yuhldr@gmail.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol dot pomozov at gmail>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>

_pkgname=openmpi
pkgname=${_pkgname}-slurm
pkgver=4.1.2
pkgrel=2
pkgdesc='patch for openmpi to support slurm-llnl'
url='https://www.open-mpi.org'
arch=('x86_64')
license=('custom:OpenMPI')
depends=('openmpi' 'glibc' 'libltdl' 'hwloc' 'openssh' 'zlib' 'libnl' 'perl' 'libevent')
options=('staticlibs')
source=(https://www.open-mpi.org/software/ompi/v${pkgver%.*}/downloads/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('9b78c7cf7fc32131c5cf43dd2ab9740149d9d87cadb2e2189f02685749a6b527')
b2sums=('2e6fc12b4564a302d2c364528d0f6bea8b23f9b1cd6059763b8d5de583d86aae2812c239b1d0bb40c83f3c7682c8e666ce1de3112e95de54848169cb5e2805e8')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/${_pkgname} \
    --libdir=/usr/lib/${_pkgname} \
    --enable-builtin-atomics \
    --enable-mpi-cxx \
    --enable-memchecker \
    --enable-pretty-print-stacktrace \
    --with-slurm \
    --with-hwloc=/usr \
    --with-libltdl=/usr  \
    --with-libevent=/usr
  make -j
}

check() {
  cd ${_pkgname}-${pkgver}
  make check
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # FS#28583
  install -dm 755 "${pkgdir}/usr/lib/pkgconfig"
  for i in "${pkgdir}/usr/lib/openmpi/pkgconfig/"*.pc; do
    ln -sf "/usr/lib/openmpi/pkgconfig/$(basename ${i})" "${pkgdir}/usr/lib/pkgconfig/"
  done

  install -dm 755 "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_pkgname}" > "${pkgdir}"/etc/ld.so.conf.d/${_pkgname}.conf
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"

  find  ${pkgdir} -not -name '*slurm*' -exec rm {} \;

}

# vim: ts=2 sw=2 et:
