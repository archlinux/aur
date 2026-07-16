# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=dav1d
pkgname=("lib32-$_pkgbasename")
pkgver=1.5.4
pkgrel=1
pkgdesc='AV1 cross-platform decoder focused on speed and correctness (32 bit)'
url='https://code.videolan.org/videolan/dav1d/'
arch=('x86_64')
license=('BSD-2-Clause')
replaces=("lib32-lib$_pkgbasename")
conflicts=("lib32-lib$_pkgbasename")
makedepends=(
      'doxygen'
      'lib32-gcc-libs'
      'lib32-glibc'
      'graphviz'
      'meson'
#      'meson-cross-x86-linux-gnu'
      'nasm'
      'ninja'
      'xxhash'
      )
source=(
      https://downloads.videolan.org/pub/videolan/${_pkgbasename}/${pkgver}/${_pkgbasename}-${pkgver}.tar.xz{,.asc}
      https://code.videolan.org/videolan/dav1d-test-data/-/archive/${pkgver}/dav1d-test-data-${pkgver}.tar.gz
      )
sha512sums=(
      '75ab7c922bc9647d73534c9f6c95a514748557adbf7a4debf95eee52ef1db681012cbaad165a46141d904cdd01c1e6319cdea33d254afb5c6b3d968679e55b98'
      'SKIP'
      '8e8def3d249e5fe96ec341b60da31ee360c850e312564a084f83f0ebd2051ebef02ba538497de6a9785dcc099f2447e90400c519b434568e2829a741227ddcca'
      )
b2sums=(
      '52db76db6c498301c0ff0fd1c28aeb9820e303846b5c6243c1dd8c8f9f0e0d1de1194cd618015e3ecf7f717ec1b901bc548d1103dc0c49203f2ef207ee867ed5'
      'SKIP'
      '9efa489893cfbfa372d5221b55722ff587b2c2bd8765e9004511a81e688f9d5b37d3fcc7a8b311efd62277a86bba874f8f20541daac84f0a2138b403f23fe02a'
      )
validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key

prepare() {
  cd ${_pkgbasename}-${pkgver}
  ln -s "${srcdir}/dav1d-test-data-${pkgver}" tests/dav1d-test-data

  # Patching if needed
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS} -I/usr/include/glslang"

  cd ${_pkgbasename}-${pkgver}
  arch-meson build \
    --prefix=/usr \
    --libdir=lib32 \
    -D enable_tests=false \
    -D enable_docs=false

# Options disabled
#     --cross-file x86-linux-gnu \ ## Meson doesn't use the system's LDFLAGS with cross-file yet...

  ninja -C build
}

check() {
  cd ${_pkgbasename}-${pkgver}/build
#  meson test
}

package_lib32-dav1d(){
  pkgdesc='AV1 cross-platform decoder focused on speed and correctness - library (32 bit)'
  depends=(
    "${_pkgbasename}>=${pkgver}"
    'lib32-gcc-libs'
    'lib32-glibc'
  )
  provides=('lib32-dav1d' 'libdav1d.so')

  cd ${_pkgbasename}-${pkgver}

  DESTDIR="${pkgdir}" ninja -C build install

  # Keep files in bin since this is not a library only package.
  # Use the same naming scheme as proposed in Arch's wiki:  https://wiki.archlinux.org/index.php/32-bit_package_guidelines
  # which is "--program-suffix="-32" with Autoconf
  for i in "${pkgdir}/usr/bin/"*; do
    mv "$i" "$i"-32
  done

  rm -r "${pkgdir}"/usr/include

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/doc/${_pkgbasename}/"README.md "${pkgdir}/usr/share/doc/${pkgname}/"
  ln -s "/usr/share/doc/${_pkgbasename}/"CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/"
  ln -s "/usr/share/doc/${_pkgbasename}/"NEWS "${pkgdir}/usr/share/doc/${pkgname}/"
  ln -s "/usr/share/licenses/${_pkgbasename}/"COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}