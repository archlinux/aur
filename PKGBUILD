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
        "gcc11.patch::https://github.com/moinakg/pcompress/pull/56.patch")
md5sums=('SKIP'
         '4c0186ef0dc8367ce5cd7cc0f398b714'
         '22f1a4e1bf373c6f6b86c49f70ee3be3'
         '16a91b9f94f56a4981d18aa6c7bfdfdd')

pkgver() {
  cd "$_pkgname"
  git rev-list --count HEAD
}

prepare() {
  cd "$_pkgname"
  git apply -v ${srcdir}/{openssl,gcc11}.patch
}

build() {
  cd "$_pkgname"
  ./config --prefix=/usr \
    --wavpack-dir="$srcdir"/wavpack-${_wavpack_ver} \
    --with-openssl-incdir="/usr/include/openssl-1.0" \
    --with-openssl-libdir="/usr/lib/openssl-1.0"
  make -j1
}

package() {
  cd "$_pkgname"
  make DESTDIR=${pkgdir} install
}
