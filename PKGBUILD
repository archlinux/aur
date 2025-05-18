# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Llewelyn Trahaearn <WoefulDerelict [at] GMail [dot] com>

_name="hwloc"
pkgname="lib32-${_name}"
pkgver=2.12.1
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
sha512sums=('8da48f29447f9df06b5039b592c2fc790bc19308fc61d1e25e8b44e1acc99cf3cba35da9689a4e339fa35051d3fb4d47c375dd1aad1cd8d3af079846f428f1f3')
b2sums=('effc7398c357f436bb95ef5daa3004f2d7033e03adcfd05112558a7ff75219ae1e9d0673d75487d62d5f6532577ec9835c9cc93b170d35c77f10b36eee4c2cfa')

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
