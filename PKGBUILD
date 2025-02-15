# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

_name="tk"
pkgname="lib32-${_name}"
pkgver=8.6.16
pkgrel=2
pkgdesc="A windowing toolkit for use with tcl (32-bit)"
arch=('x86_64')
url="https://tcl.sourceforge.net"
license=('TCL')
depends=('lib32-fontconfig' 'lib32-glibc' 'lib32-libx11' 'lib32-libxss'
         'lib32-libxft' "lib32-tcl>=${pkgver}" "${_name}>=${pkgver}")
makedepends=('lib32-gcc-libs' "lib32-tcl-ar>=${pkgver}")
options=('staticlibs')
_pkgsrc="${_name}${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/sourceforge/tcl/${_pkgsrc}-src.tar.gz"
        "${_name}_only_target_libraries.patch")
sha256sums=('be9f94d3575d4b3099d84bc3c10de8994df2d7aa405208173c709cc404a7e5fe'
            'be8473767e440c428e3629a0da03f464234e47ec877ade2aa6f6c3a927937cd1')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}_only_target_libraries.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32" # -L/usr/lib32 -lm
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}/unix"
  ./configure \
    --prefix='/usr' \
    --program-suffix='-32' \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --enable-threads \
    --disable-rpath \
    --with-tcl='/usr/lib32/'
  # make binaries
  make "libtkstub8.6.a" "libtk8.6.so"
}

# check() {
#   cd "${srcdir}/${_pkgsrc}/unix"
#   make test
# }

package() {
  cd "${srcdir}/${_pkgsrc}/unix"
  make INSTALL_ROOT="${pkgdir}" install-binaries

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "lib" "man" "share"

  cd "lib32"
  ln -vsf "lib${_pkgsrc%.*}.so" "lib${_name}.so"

  # remove buildroot traces
  sed -e "s#${srcdir}/${_pkgsrc}/unix#/usr/lib32#" \
      -e "s#${srcdir}/${_pkgsrc}#/usr/include#" \
      -i 'tkConfig.sh'

  # remove unrequired execute permissions (FS#75042)
  chmod -x "libtkstub8.6.a"
}
