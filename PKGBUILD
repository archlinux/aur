# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Vladislav Petrov <ejiek@mail.ru>

pkgname=freerdp-1.1.0
_pkgname=freerdp
_projname=FreeRDP
pkgver=1.1.0
pkgrel=2
pkgdesc='RDP client legacy version 1.1.0 with patches from Ubuntu Bionic (18.04 LTS)'
arch=('i686' 'x86_64' 'aarch64')
url="http://freerdp.sourceforge.net"
license=('GPL')
depends=('openssl-1.0' 'libxcursor' 'libcups' 'alsa-lib' 'libxext' 'libxdamage'
         'ffmpeg' 'libxkbfile' 'libxinerama' 'libxv' 'libpulse')
makedepends=('krb5' 'cmake' 'xorgproto' 'xmlto' 'docbook-xsl')
conflicts=('freerdp' 'freerdp-git' 'freerdp-102')
provides=('freerdp')
_commit='590fa7dbf6ecab58fb70dd57ef6d3ecfdbfc3c4f'
source=("${_projname}-${pkgver}-${_commit}.tar.gz::https://github.com/${_projname}/${_projname}/archive/${_commit}.tar.gz"
        1001_hide-internal-symbols.patch
        1002_update-pkg-config-file.patch
        1003_multi-arch-include-path.patch
        1004_64-bit-architectures.patch
        1005_parse-buffer-endianess.patch
        1006_test-unicode-endianess.patch
        1007_detect-arm-arch-correctly.patch
        1008_gcc-fPIC-on-arm64.patch
        1009_libusb-debug.patch
        1010_libudev-link.patch
        1011_ffmpeg-2.9.patch
        1012_typo-fix.patch
        1013_aligned_meminfo_alignment.patch
        2001_detect-ffmpeg-on-Debian.patch
        tsmf_ffmpeg.patch)
md5sums=('1dd186838d20d757822c2daec959b7a3'
        '4b234f9fd511784b5afc8b509f2a55ca'
        'e2e046945d90738180a0a74ed1f5716e'
        'f8ffb6e5892a9f4779035a643c28a69b'
        'f45f4ccbb75bc375b66c1f26516638e4'
        '4d806b51c39fb31d151dd1ad2d0d7bef'
        'b00de13c7d72b7140fc7979636446aac'
        'c6e549c8ab2db539daf780e999d5defa'
        '081bef0c3443f2abb4509e8827f18404'
        'b189033a55f32fe940f1643b5a848480'
        '50ce07e227a119cc14f68b1e9da6e502'
        '2849fc753e757b3e28242327c6e592db'
        '7c373a53c8506fd14c836c45bbeefddd'
        '9d1d6b827a0d6b3f8fa308b85e6917bc'
        '1fcc55173b3921698b711cccc9b6594a'
        'ce69a20d193e9aec0a2dedd55253405f')

prepare() {
  cd "${_projname}-${_commit}"
  (set -x
    patch --forward --strip=1 --unified --input=../1001_hide-internal-symbols.patch
    patch --forward --strip=1 --unified --input=../1002_update-pkg-config-file.patch
    patch --forward --strip=1 --unified --input=../1003_multi-arch-include-path.patch
    patch --forward --strip=1 --unified --input=../1004_64-bit-architectures.patch
    patch --forward --strip=1 --unified --input=../1005_parse-buffer-endianess.patch
    patch --forward --strip=1 --unified --input=../1006_test-unicode-endianess.patch
    patch --forward --strip=1 --unified --input=../1007_detect-arm-arch-correctly.patch
    patch --forward --strip=1 --unified --input=../1008_gcc-fPIC-on-arm64.patch
    patch --forward --strip=1 --unified --input=../1009_libusb-debug.patch
    patch --forward --strip=1 --unified --input=../1010_libudev-link.patch
    patch --forward --strip=1 --unified --input=../1011_ffmpeg-2.9.patch
    patch --forward --strip=1 --unified --input=../1012_typo-fix.patch
    patch --forward --strip=1 --unified --input=../1013_aligned_meminfo_alignment.patch
    patch --forward --strip=1 --unified --input=../2001_detect-ffmpeg-on-Debian.patch
    patch --forward --strip=1 --unified --input=../tsmf_ffmpeg.patch
  )
}

build() {
  cd "${_projname}-${_commit}"
  cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DWITH_CUPS=ON \
        -DWITH_GSTREAMER=OFF \
        -DWITH_PULSE=ON \
        -DOPENSSL_ROOT_DIR=/usr/lib/openssl-1.0 \
        -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so \
        -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so \
        -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
        .
  make
}

package() {
  cd "${_projname}-${_commit}"
  make DESTDIR="${pkgdir}" install
}
