# Maintainer:  dreieck
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

_pkgname=bglibs
pkgname="${_pkgname}"
pkgver=2.04
_debianrel=9
pkgrel=1
pkgdesc="Collection of libraries needed for software from untroubled.org (by Bruce Guenter)."
arch=(
  'i686'
  'x86_64'
  'aarch64'
  'armv6h'
  'armv7h'
)
url="http://untroubled.org/bglibs"
license=('LGPL-2.1-or-later')
depends=(
  'glibc'
)
optdepends=(
  "perl: For '/usr/bin/cli-generate'."
)
provides=(
  "bg-installer=${pkgver}"
  "cli-generate=${pkgver}"
  "crc-gentab=${pkgver}"
  "libbg-cli.a=${pkgver}"
  "libpwcmp.a=${pkgver}"
  "libpwcmp-module.a=${pkgver}"
  "libvmailmgr.a=${pkgver}"
  "libbg.so"
)
conflicts=(
  "bg-installer"
  "cli-generate"
  "crc-gentab"
  "libbg-cli.a"
  "libpwcmp.a"
  "libpwcmp-module.a"
  "libvmailmgr.a"
  "libbg.so"
)
source=(
  "https://untroubled.org/bglibs/bglibs-${pkgver}.tar.gz"
  "https://untroubled.org/bglibs/bglibs-${pkgver}.tar.gz.sig"
  "https://deb.debian.org/debian/pool/main/b/bglibs/bglibs_${pkgver}+dfsg-${_debianrel}.debian.tar.xz" # https://packages.debian.org/source/sid/bglibs
  "bglibs_0001_properly-align-HMAC-state-buffers-on-stack.patch::https://github.com/bruceg/bglibs/pull/1.patch"
  "bglibs_0002_feature-tests-gcc14.patch::https://github.com/bruceg/bglibs/pull/8.patch"
  "bglibs_0003_fix-build-with-musl-libc.patch::https://github.com/bruceg/bglibs/pull/9.patch"
  "bglibs_0004_fixes-for-newer-GCC.patch::https://github.com/bruceg/bglibs/pull/10.patch"
  "bglibs_0005_fix-documentation-typo-seperately.patch::https://github.com/bruceg/bglibs/pull/4.patch"
  "bglibs_0006_add-feature-macro-for-glibc-in-sig_suspend.c.patch::https://github.com/bruceg/bglibs/pull/7.patch"
)
validpgpkeys=('D0B7C8DD365DA39529DA2E2AE96FB2DC699980E8')
sha256sums=(
  'e4ae34a4c43f72ff0c5f100b3ac432460e7d736a7f0708d5e429c97dd5c52474'
  'b5cb24d7c9dba6984eb8dc33168c5382fb33e24846944219a49b6de4cdd31ef2'
  '1ee0ccc8a5a7fd01a89a6c7e3180587d1e01498d78a8cda214d2fdd78cef520d'
  '479cba5acc7720d3c3cefcde1bb226e63dc06409d146418f3ce3c704c835d74c'
  '9184a4dd8a67d8bf32591086231c59ead5a607214223fc849c8617b5985a77de'
  '02c49c3cd026068319133127250fc5606672a2d3d9be37ca17d24a25cc2498a6'
  '78c1e461a1ca0c5f45673718f49bec8b89572fab825aacf4eb5fb77e9e00577f'
  '0739cad7a181b39e76bd88ceeb638481cb9297c3c9d227df8d87a9e4ad02c78c'
  '159ed85a0225ba1f490dab712d9a9f510a5a9a1c4bdc5b4d95f09fac99ac349b'
)
options+=('staticlibs' 'emptydirs')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local _patch
  for _patch in "${srcdir}"/bglibs_[0-9]*.patch "${srcdir}/debian"/patches/001_ensure_use_of_usr_bin_perl.patch; do
    printf '%s\n' "Applying patch $(basename "${_patch}" ...)"
    patch -Np1 --follow-symlinks -i "${_patch}"
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local _CFLAGSADDITIONS _NO_ERROR _noerror
  _CFLAGSADDITIONS=""
  _NO_ERROR=("unterminated-string-initialization" "address" "cast-function-type" "sizeof-pointer-memaccess" "old-style-definition" "unused-but-set-variable" "implicit-fallthrough" "misleading-indentation" "unterminated-string-initialization" "array-parameter" "stringop-overread" "stringop-overflow")
  for _noerror in "${_NO_ERROR[@]}"; do
    _CFLAGSADDITIONS+=" -Wno-${_noerror} -Wno-error=${_noerror}"
  done
  CFLAGS+="${_CFLAGSADDITIONS}"
  export CFLAGS

  echo "/usr/bin" > conf-bin
  echo "/usr/include" > conf-include
  echo "/usr/lib" > conf-lib
  echo "/usr/share/man" > conf-man
  sed -i "1s/\$/ $(echo -n $CFLAGS | sed 's/[\/&]/\\&/g')/" conf-cc
  sed -i "1s/\$/ $(echo -n $LDFLAGS | sed 's/[\/&]/\\&/g')/" conf-ld

  # 'make' also runs selftests, which fail with segmentation fault at some point
  #make -j1
  make -j1 compile
  make -j1 sysdeps.h
  make -j1 libraries
  make -j1 programs
  make -j1 man
  make -j1 dl.lib
  make -j1 bg-installer
  make -j1 bg-installer.1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install_prefix="${pkgdir}" make -j1 install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      ANNOUNCEMENT LIBVERSION NEWS README TODO VERSION
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
