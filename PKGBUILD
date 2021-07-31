# Maintainer: "UnCO Lin" <trash__box <at> 163.com>
# Contributor: PLum <plum.michalski <at> gmail.com>
pkgname=pcompress-git
_pkgname=pcompress
pkgver=434
_wavpack_ver=4.70.0
pkgrel=1
arch=(x86_64)
pkgdesc="Pcompress is a utility to do compression/decompression and deduplication in parallel by splitting input data into chunks."
url="http://moinakg.github.io/pcompress/"
license=('LGPL v3')
options=('!makeflags')
depends=('glibc' 'gcc-libs-multilib' 'bzip2' 'zlib' 'openssl-1.0')
makedepends=('git' 'yasm')
source=("git+https://github.com/moinakg/${_pkgname}.git"
        "http://wavpack.com/wavpack-${_wavpack_ver}.tar.bz2"
        "openssl.patch::https://github.com/moinakg/pcompress/pull/55.patch"
        "gcc11.patch::https://github.com/moinakg/pcompress/pull/56.patch"
        "advance_opts.patch")
md5sums=('SKIP'
         '4c0186ef0dc8367ce5cd7cc0f398b714'
         '22f1a4e1bf373c6f6b86c49f70ee3be3'
         '16a91b9f94f56a4981d18aa6c7bfdfdd'
         'a0ef3e2d8cbcab5582aaa23b433339fc')

pkgver() {
  cd "$_pkgname"
  git rev-list --count HEAD
}

prepare() {
  cd "$_pkgname"
  git apply -v ${srcdir}/{openssl,gcc11,advance_opts}.patch
}

build() {
  cd "$_pkgname"

# ./config flags:
# --prefix=<val>          The installation prefix (default: /usr).
# --enable-debug          Enable debug mode compilation (default: disabled).
# --disable-allocator     Disable use of internal memory allocator mechanism (default: enabled).
# --enable-debug-stats    Enable printing of some verbose debug info (default: disabled).
# --with-openssl=<path to OpenSSL installation tree> (Default: System)
# --with-zlib=<path to zlib installation tree> (Default: System)
# --with-bzlib=<path to Bzip2 library installation tree> (Default: System)
# --with-external-libbsc=<path to libbsc source tree>
# --wavpack-dir=<path to WavPack source tree>
# --disable-wavpack       Disables the WavPack filter.
# --no-sse-detect         Do NOT attempt to probe the system`s SSE capability for build flags.
# --no-avx-detect         Do NOT attempt to probe the system's AVX capability for build flags.
# --no-1.3-archive-compat Disable compatibility with compressed archives created with Pcompress
# --limit-key128          Limit key length to 128-bit encryption keys.

  if check_option "debug" "y"; then
    _config_flags+=('--enable-debug')
  fi
  ./config --prefix=/usr \
    --wavpack-dir="$srcdir"/wavpack-${_wavpack_ver} \
    --with-openssl-incdir="/usr/include/openssl-1.0" \
    --with-openssl-libdir="/usr/lib/openssl-1.0" \
    "${_config_flags[@]}"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR=${pkgdir} install
}
