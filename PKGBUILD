# Maintainer: Nicolas Derumigny <nderumigny@gmail.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>
# Contributor: Hervé YVIQUEL <elldekaa@gmail.com>

_pkgname=hwloc
_target='aarch64-linux-gnu'
pkgname=${_target}-${_pkgname}
pkgver=2.7.1
pkgrel=2
pkgdesc='Portable Hardware Locality is a portable abstraction of hierarchical architectures'
url='https://www.open-mpi.org/projects/hwloc/'
arch=('x86_64')
license=('BSD')
depends=("${_target}-glibc" 'libtool' 'systemd-libs' 'libpciaccess')
makedepends=('cairo' 'libxml2' 'pciutils' 'systemd' 'libx11' "${_target}-gcc")
optdepends=('cairo' 'libxml2' 'pciutils' 'libx11')
options=('!docs')
source=(https://www.open-mpi.org/software/hwloc/v${pkgver%.*}/downloads/${_pkgname}-${pkgver}.tar.bz2)
sha512sums=('35de85de3f5e75de30b5ac72d2c118dcb990a2427c9812910a03772857181fd7259a27352b34a968186d02ffc811644c3411d84ee37f2d0ff9b83628951b4863')
b2sums=('26706b8835954b8baa9028eaf2da0f8ae6e57d1841d68daaa04d58a7b24a67e4e171eb439b8dbfb589a70eb1b5cced51f12a99bb7132591919c902374f89025f')

build() {
  mkdir -p ${_pkgname}-build
  pushd ${_pkgname}-build

  CFLAGS+=" -D__aarch64__ -march=armv8.8-a -fcf-protection=none -Wno-use-after-free"
  CXXFLAGS+=" -D__aarch64__ -march=armv8.8-a -fcf-protection=none -Wno-use-after-free"
  QEMU_LD_PREFIX="/usr/${_target}/" LD_LIBRARY_PATH="/usr/${_target}/lib64" ${srcdir}/${_pkgname}-${pkgver}/configure CC="${_target}-gcc" \
    --build="${_target}" \
    --host="${_target}" \
    --prefix=/usr/${_target} \
    --sbindir=/usr/${_target}/bin \
    --enable-plugins \
    --sysconfdir=/usr/${_target}/etc
  make
  popd
}

check() {
  pushd ${_pkgname}-build
  # Illegal instruction as of now, will look into it later
  # QEMU_LD_PREFIX="/usr/${_target}/" LD_LIBRARY_PATH="/usr/${_target}/lib64" make check
  popd
}

package() {
  pushd ${_pkgname}-build
  make DESTDIR="${pkgdir}" install
  install -Dm 644 ${srcdir}/${_pkgname}-${pkgver}/COPYING -t "${pkgdir}/usr/${_target}/usr/share/licenses/${_pkgname}"
  popd
  rm -rf ${_pkgname}-build
}

# vim: ts=2 sw=2 et:
