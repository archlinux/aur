# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>

_name="hwloc"
pkgname="lib32-${_name}"
pkgver=2.12.0
pkgrel=1
pkgdesc="Portable Hardware Locality is a portable abstraction of hierarchical architectures (32-bit)"
url="https://www.open-mpi.org/projects/hwloc/"
arch=('x86_64')
license=('BSD-3-Clause')
depends=("${_name}>=${pkgver}" 'lib32-glibc' 'lib32-libpciaccess'
         'lib32-libtool>=2.2.6' 'lib32-systemd')
makedepends=('lib32-gcc-libs' 'lib32-libxml2')
optdepends=('lib32-libxml2: full XML import/export support')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.bz2::https://www.open-mpi.org/software/${_name}/v${pkgver%.*}/downloads/${_pkgsrc}.tar.bz2")
sha512sums=('0486eb8fc49ded213ae84eb78ca87429570230b46513f90b6015a2ebc61f02c2b4f1203074a36813515ada0a8be2509d823ed03dc7ca5a065fb957523462cf30')
b2sums=('4fc582a2204ce9edb786a2978c9c5cf0766981ecc54d98e4a07aeece0f696f404b6b069cc0974378c5bdc36d15865c7420ff1871733b1adf17cea23f706a7168')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local configure_options=(
    --prefix='/usr'
    --sbindir='/usr/bin'
    --sysconfdir='/etc'
    --program-suffix='-32'
    --lib{exec,}dir='/usr/lib32'
    --build=i686-pc-linux-gnu
    --enable-plugins
    --disable-nvml
    --disable-cuda
    --disable-rsmi
  )

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make check
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}