# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>

_name="hwloc"
pkgname="lib32-${_name}"
pkgver=2.12.2
pkgrel=1
pkgdesc="Portable Hardware Locality is a portable abstraction of hierarchical architectures (32-bit)"
url="https://www.open-mpi.org/projects/hwloc/"
arch=(
  'x86_64'
)
license=(
  'BSD-3-Clause'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-glibc'
  'lib32-libpciaccess'
  'lib32-libtool>=2.2.6'
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
sha512sums=('949d6c9d7b858ee58e477b15e6c06f57812872142fa1c7f3ef20aae2e4ef954135f839e8604404bfd0637fde99729c7d00211c8aee860dfde9ac60bba0e78aef')
b2sums=('225d457ae01bcde2f342a175b7ab33d51fcbf6cb8ce02306569368758975d620b3ad4070c87ba16196c3a2e772658a6b4f841ba586a5d2ef922c1e60f72402c1')

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
