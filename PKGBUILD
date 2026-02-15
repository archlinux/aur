# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>

_name="hwloc"
pkgname="lib32-${_name}"
pkgver=2.13.0
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
sha512sums=('88958a624211fbc3fd2f424de8eed2d6b47a0e3b3cf524725c9695d8a73929de71f3615d4f2e610678a8e1b169c7a592eae45464493f6288b16b0ce368015b28')
b2sums=('4c92526d67fb075ee46b36b921dacc0e07e4fc967e2542c3a21ba541a278469d9f6b1dcc0a8592ebb96ba546d5f31aee37acb22b6b560dff7a3bced444ad5582')

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
