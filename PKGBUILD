# Maintainer: envolution
# Contributor: Sick Codes <info at sick dot codes>
# Contributor: Daniel Meszaros <easimer@gmail.com>
# Contributor: Bastien Dejean <nihilhill@gmail.com>
# Contributor: solsTice d'Hiver <solstice.dhiver@gmail.com>
# Contributor: Prurigro
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=xar
_sourcetag='501'
pkgver=501
pkgrel=2
pkgdesc='eXtensible ARchive format - apple fork'
arch=('i686' 'x86_64')
url='https://github.com/apple-oss-distributions/xar'
license=('BSD-3-Clause')
depends=('libxml2' 'openssl' 'bzip2' 'acl' 'zlib' 'glibc' 'xz')
source=(
  "https://opensource.apple.com/tarballs/xar/xar-${_sourcetag}.tar.gz"
  0001-Update-tests-for-Python-3-and-Nix-sandbox.patch
  0002-Update-for-modern-liblzma5-versions.patch
  0003-Fix-undefined-EXT2_ECOMPR_FL-for-e2fsprogs.patch
  0004-Fix-compatibility-with-openssl-1.0.patch
  0005-Fix-configure.ac-for-Linux-headers.patch
  0006-Fix-more-non-Darwin-stuff.patch
  0007-replace-initialized-constant-with-define-statement.patch
  0008-Fix-configure.ac-not-finding-AR-with-target-prefix.patch
  0009-Add-useless-descriptions-to-AC_DEFINE.patch
  0010-Update-configure.ac-for-openssl-libxml2-liblzma-and-.patch
  0011-Fix-missing-includes-and-silence-string-format-warni.patch
  0012-Fix-char-signedness-for-ARM-and-PowerPC.patch
  0013-Enable-extended-attributes-for-btrfs.patch
  0014-Fix-segfault-when-copying-xattr-buffers.patch
  0015-Fix-segfault-in-xar_attrcopy_from_heap.patch
  0016-Do-not-set-property-for-empty-ACL.patch
  0017-Fix-time-format-for-musl.patch
  0018-Replace-memcpy-with-memmove-for-musl.patch
  0019-Prefer-OpenSSL-over-CommonCrypto-if-available.patch
  0020-Fall-back-to-readlink-on-Linux.patch
)
md5sums=('050ec6c7a4d0c6dbe04a16470b6fdbaf'
         'ff8ab3ac75a8bea2f38ae56c1326e1d2'
         '228c2cc2229f9bed5fa1b7c7a87f9b2f'
         'fec59953f754c0adbb5f901e2c0dd162'
         'b702adb97cd04ca774ed0e226959ffd7'
         'c277bd6961a07fec1367f20c76938d54'
         '8c176a2e0b72ba929cd20c889b1d2057'
         'ed86fc27201c9521cb88968401a3043d'
         'c84cacb73a3b3b3cc8095216495fade3'
         '93f2081f899d64586f911d5c5e9f00a0'
         'ada112c5030162b3d6a8c27b30300210'
         'd7e2b6acd73d2184f28be51b8a5feb27'
         'cda18798bdd4ca559fadd681a6a9cd80'
         'f6da44270e3844dd9828bf47f5ea6167'
         'c67ebe800d76be6521245cbbe0007a35'
         '587fa35c6725ca795f09183356e2c342'
         '83d52be22f58a3558410af22cfa6dbd5'
         'c086867cf0c3aa656a6c56b07578912b'
         '64e286de2634d32d13af3471b3ed6bde'
         '5f8d64b2dcf69c97c9b90936b9e1b714'
         'c864ba8ad7c1a3a01d06c633b1791020')

prepare() {
  cd "${pkgname}-${pkgname}-${_sourcetag}/xar"
  #patches sourced from nixos
  patch -Np2 -i ../../0001-Update-tests-for-Python-3-and-Nix-sandbox.patch
  patch -Np2 -i ../../0002-Update-for-modern-liblzma5-versions.patch
  patch -Np2 -i ../../0003-Fix-undefined-EXT2_ECOMPR_FL-for-e2fsprogs.patch
  patch -Np2 -i ../../0004-Fix-compatibility-with-openssl-1.0.patch
  patch -Np2 -i ../../0005-Fix-configure.ac-for-Linux-headers.patch
  patch -Np2 -i ../../0006-Fix-more-non-Darwin-stuff.patch
  patch -Np2 -i ../../0007-replace-initialized-constant-with-define-statement.patch
  patch -Np2 -i ../../0008-Fix-configure.ac-not-finding-AR-with-target-prefix.patch
  patch -Np2 -i ../../0009-Add-useless-descriptions-to-AC_DEFINE.patch
  patch -Np2 -i ../../0010-Update-configure.ac-for-openssl-libxml2-liblzma-and-.patch
  patch -Np2 -i ../../0011-Fix-missing-includes-and-silence-string-format-warni.patch
  patch -Np2 -i ../../0012-Fix-char-signedness-for-ARM-and-PowerPC.patch
  patch -Np2 -i ../../0013-Enable-extended-attributes-for-btrfs.patch
  patch -Np2 -i ../../0014-Fix-segfault-when-copying-xattr-buffers.patch
  patch -Np2 -i ../../0015-Fix-segfault-in-xar_attrcopy_from_heap.patch
  patch -Np2 -i ../../0016-Do-not-set-property-for-empty-ACL.patch
  patch -Np2 -i ../../0017-Fix-time-format-for-musl.patch
  patch -Np2 -i ../../0018-Replace-memcpy-with-memmove-for-musl.patch
  patch -Np2 -i ../../0019-Prefer-OpenSSL-over-CommonCrypto-if-available.patch
  patch -Np2 -i ../../0020-Fall-back-to-readlink-on-Linux.patch
}
build() {
  cd "${pkgname}-${pkgname}-${_sourcetag}/xar"
  export CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types -isystem /usr/include/libxml2"
  export CXXFLAGS="$CXXFLAGS -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types -isystem /usr/include/libxml2"

  NOCONFIGURE=1 ./autogen.sh \
    --prefix=/usr \
    --mandir=/usr/share/man

  ./configure --disable-static --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgname}-${_sourcetag}/xar"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
