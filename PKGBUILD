# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>

_name="hwloc"
pkgname="lib32-${_name}"
pkgver=2.14.0
pkgrel=1
pkgdesc="Portable Hardware Locality is a portable abstraction of hierarchical architectures (32-bit)"
arch=(
  'x86_64'
)
url="https://www.open-mpi.org/projects/hwloc/"
license=(
  'BSD-3-Clause'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-glibc'
  'lib32-libpciaccess'
  # 'lib32-libtool>=2.2.6'
  'lib32-systemd'
)
makedepends=(
  'lib32-gcc-libs'
  'lib32-libxml2'
)
optdepends=(
  'lib32-libxml2: full XML import/export support'
)
provides=(
  "lib${_name}.so"
)
_pkgsrc="${_name}-${pkgver}"
source=(
  "https://www.open-mpi.org/software/${_name}/v${pkgver%.*}/downloads/${_pkgsrc}.tar.bz2"
)
sha512sums=('547a9ed3c6af399de9617fe675bd6d16db300cc98213d6c71b2f1b41dd4a1706c7f2cf0dd1feb0d9f8a546b1976740c7a959dca0c23a4f52eac0b25cc403d087')
b2sums=('5cc8d5dbe6d89cbe332fd4306b0c52ec781135b17dad6cdd1e7e149e5d4979f203819e02d53707b6a3e59de0e855cd4502f3c7adfbd520945ee7562291030c64')

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
