# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=dav1d
pkgname=("lib32-$_pkgbasename")
pkgver=1.5.3
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
      '3d6a1a67a3c7d171747fd244566b23c66c174c4aad1964fef95367b2b33a187abb544e83dccc27d9cda409c8156b7c44a8bf33af810e8fa79d08cb5f3796fa54'
      'SKIP'
      'e6a2e00685e6f1fe78f5f207a6df5a185eaf958064d0da0fbadbea487833c6bfdd89a164aeb8861f93bd7f38e8ef5a740561f32b5ddb488532a33e86efa26da4'
      )
b2sums=(
      'e8eb38c2b4a280f5fdc812e4ce37f0e1a8a24e95a787ac407114681f884fcee0d03800ebb14ee18b0088ef3396fa3be94eff927cc2796fd69fde0732c178750b'
      'SKIP'
      'eaa18260b5c7596c8318b4f7c75ecf0a5c96101990ad4bbad57bb3825a6a9f11c9f3c1eac4e789847daaf09f432df1c5ee6f61189736f574251c462153c9e46d'
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