# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=dav1d
pkgname=("lib32-$_pkgbasename" "lib32-lib$_pkgbasename")
pkgver=1.5.0
pkgrel=1
pkgdesc='AV1 cross-platform decoder focused on speed and correctness (32 bit)'
url='https://code.videolan.org/videolan/dav1d/'
arch=('x86_64')
license=('BSD-2-Clause')
makedepends=(
      'doxygen'
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
      '774881d27d045f468a8617317fa751e1ce452a15c6d6c2c93c3dd3c3544d6b2b91b0c3eb5ff379f113c26b27a02dc4b54d0751b083dcbcb18bb96c66a6504acb'
      'SKIP'
      '0102abdf3310c53a09c9ae9a8bf7e662402f31ecb41624f70a6557a618e384b38dedb088241b6887a5b93573631b32c778fec90e82236c2192ae18d5914bcae4'
      )
b2sums=(
      '7cf75b9de834c77a8012fb560fadca339d0faa0ab92073fd0119f0c5ccbb19017aa271a1aa0939aa698a52e2285b79a956021776a702afe2a7de131ce92d7241'
      'SKIP'
      '4d44ffab66de96da059ceacaa1e7c5df63f362492cb9f29af44b7a9b0f1c75da1c96fa64263c23b891a7b17fe78eefcf263fb6917b499de3814bbff3b482ea3c'
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

package_lib32-libdav1d(){
  pkgdesc='AV1 cross-platform decoder focused on speed and correctness - library (32 bit)'
  depends=(
    "${_pkgbasename}>=${pkgver}"
    'lib32-glibc'
  )
  provides=('lib32-dav1d' 'libdav1d.so')

 cd ${_pkgbasename}-${pkgver}

  DESTDIR="${pkgdir}" ninja -C build install

  rm -r "$pkgdir"/usr/{include,bin}

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/doc/${_pkgbasename}/"README.md "${pkgdir}/usr/share/doc/${pkgname}/"
  ln -s "/usr/share/doc/${_pkgbasename}/"CONTRIBUTING.md "${pkgdir}/usr/share/doc/${pkgname}/"
  ln -s "/usr/share/doc/${_pkgbasename}/"NEWS "${pkgdir}/usr/share/doc/${pkgname}/"
  ln -s "/usr/share/licenses/${_pkgbasename}/"COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_lib32-dav1d() {
  pkgdesc='AV1 cross-platform decoder focused on speed and correctness (32 bit)'
  depends=(
    'lib32-glibc' 
    'lib32-libdav1d'
  )

  cd ${_pkgbasename}-${pkgver}

  DESTDIR="${pkgdir}" ninja -C build install

  # Keep files in bin since this is not a library only package. 
  # Use the same naming scheme as proposed in Arch's wiki:  https://wiki.archlinux.org/index.php/32-bit_package_guidelines
  # which is "--program-suffix="-32" with Autoconf
  for i in "${pkgdir}/usr/bin/"*; do
    mv "$i" "$i"-32
  done

  rm -r "$pkgdir"/usr/{include,lib32}

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/doc/${_pkgbasename}/"README.md "${pkgdir}/usr/share/doc/${pkgname}/"
  ln -s "/usr/share/licenses/${_pkgbasename}/"COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
