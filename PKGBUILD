# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=dav1d
pkgname=("lib32-$_pkgbasename")
pkgver=1.5.5
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
      'a3d5b91840ee6bb473c0f8d067361388ba69417a5ab27ec27ec3f3268c22b62b2eabec0bb1a275d6b4fa5b9e540f16d241a44949cd3757c3d1a14314ea0e246e'
      'SKIP'
      '973a1e4815793d18edfdfe02b491526b9cef4f6b9df1a3f01e966b6ce44b790a9646ac7a6b825b6a320a01e159bb1d29b190c8f27207a9a21816316b31bee6fe'
      )
b2sums=(
      '8f5c4ba949d71b1b73e4c2e7b51c332c3bf5ffed9cbeb198dfa949c8cbcdc173dbfdb2ee141f29823ef8f8eba244c23a90c5c73e82962cc2cd65856942df0ccb'
      'SKIP'
      'e9611cc83c917f0858c7cc340f50b838c4297b61187ffc8b92f413b57d1729448b6eddcc005ab7d70e282d29125fa2bf8dba7725d9f24c10214b2cd9c775c24d'
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
  provides=(
    'lib32-dav1d'
    'lib32-libdav1d'
    'libdav1d.so'
    )

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