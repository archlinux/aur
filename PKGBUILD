#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: "UnCO Lin" <trash__box <at> 163.com>
# Contributor: PLum <plum.michalski <at> gmail.com>

pkgname=pcompress-git
_pkgname=pcompress
pkgver=3.1Bugfix.r75.gc6e779c
_wavpack_ver=4.70.0
pkgrel=1
epoch=1
arch=(x86_64)
pkgdesc="Utility to do compression/decompression and deduplication in parallel by splitting input data into chunks."
url="https://moinakg.github.io/pcompress/"
license=(LGPL3)
depends=(bzip2 zlib openssl-1.0)
makedepends=(git yasm)
options=(!makeflags)
source=("git+https://github.com/moinakg/${_pkgname}.git"
        "http://wavpack.com/wavpack-${_wavpack_ver}.tar.bz2"
        "openssl.patch::https://github.com/moinakg/pcompress/pull/55.patch"
        "gcc11.patch::https://github.com/moinakg/pcompress/pull/56.patch"
        "advance_opts.patch")
sha256sums=('SKIP'
            '2cade379b0aba99fbc4e442ccc6dac6c609f6212e46516a083e24c8c364430a4'
            '6138cd04fe61ebfbe8f43ecf81a0f9e986a8ef4d2bffc474ee3622a33088699e'
            '4e246ab296ccdab436d66dc356b2e41700f334f4ccbe04c914eafd9c2dbaade6'
            '0dfbad3cb21260e90196ab6bda653480ae38cb01c35eef834242b5cff73eaccb')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git apply -v "${srcdir}"/{openssl,gcc11,advance_opts}.patch
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
    _config_flags+=( --enable-debug{,-stats} )
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
  make DESTDIR="${pkgdir}" install
}
