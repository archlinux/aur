# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="vamp-plugin-sdk"
pkgname="lib32-${_name}"
pkgver=2.10
pkgrel=1
pkgdesc="The Vamp audio analysis plug-in system (32-bit)"
url="https://github.com/vamp-plugins/${_name}"
arch=(
  'x86_64'
)
license=(
  'BSD-3-Clause'
  'MIT'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
)
makedepends=(
  'lib32-libsndfile'
)
optdepends=(
  'lib32-libsndfile: for vamp-simple-host'
)
provides=(
  'libvamp-hostsdk.so'
  'libvamp-sdk.so'
)
groups=(
  'lib32-pro-audio'
)
_pkgsrc="${url##*/}-${_name}-v${pkgver}"
source=(
  "${url}/archive/refs/tags/${_name}-v${pkgver}/${_pkgsrc}.tar.gz"
)
sha512sums=('67a71e5396eab5ce9503e9111b4cfc16fc9755cf6ae2d8dfc99ed29fd91e75eaf0de9a9c55ce8f7751f04c235eb86430856eff18f02adde54f1850a87c917ef0')
b2sums=('ba206443d4a6f94f56c1e3b7e8f47b7c8f893d2df6601f9d26a613d56bf58fee7d0a4a996964aa0690ecf69fd1d686db28165e73a0d37880a7891c67ecaaae5f')

prepare() {
  cd "${srcdir}/${_pkgsrc}/pkgconfig"
  sed -e 's|/lib|/lib32|g' \
      -i ./*.pc.in
}

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
    # --disable-programs
  )

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make check
# }

package() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32" # -lsndfile
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "include" "share" # "bin"

  mv -v "lib" "lib32"

  cd "bin"
  for _file in *; do
    mv -v "${_file}" "${_file}-32"
  done
}
