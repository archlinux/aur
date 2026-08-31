# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit
# Tracks kdave/btrfs-progs release-tag cadence; builds only the unshipped
# internal tools btrfs-sb-mod (superblock field reader/modifier with
# checksum fixup), btrfsck (standalone original filesystem checker) and
# btrfs-corrupt-block (deliberate corruption injector for testing).
# Not provided by any AUR package or btrfs-progs-git (internal tools are
# not installed by upstream 'make install').
_repo=kdave/btrfs-progs
pkgname=btrfs-progs-internals-release-git
_tools=(btrfs-sb-mod btrfs-corrupt-block)
pkgver=7.1
pkgrel=2
pkgdesc='Unshipped btrfs-progs internal tools: btrfs-sb-mod superblock editor with checksum fixup, btrfs-corrupt-block; latest release tag build'
arch=('x86_64')
url="https://github.com/${_repo}"
license=('GPL-2.0-only')
depends=('util-linux-libs'
         'lzo'
         'zlib'
         'zstd')
makedepends=('git')
source=("git+https://github.com/${_repo}.git"
        "fix-xxhash-csum-size.patch")
b2sums=('SKIP'
        'd275660984b47930b492eb4ce988fd777849f3be520bebe25f6e9c6ac9625c1c471f3598331eeb91be987b4c8cf956c898f492caa670a9f6ca846c03fc0d330f')

pkgver() {
  cd "${srcdir}/btrfs-progs"
  git tag --list \
    | grep -E '^v[0-9]+\.' \
    | sort -V \
    | tail -1 \
    | sed 's/^v//'
}

prepare() {
  cd "${srcdir}/btrfs-progs"
  git reset --hard "v${pkgver}"
  # fix upstream csum-size bug (#1160): sb-mod hardcoded the CRC32 digest
  # length, truncating xxhash64/sha256/blake2b superblock checksums
  patch -Np1 -i "${srcdir}/fix-xxhash-csum-size.patch"
}

build() {
  cd "${srcdir}/btrfs-progs"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --disable-documentation \
    --disable-python \
    --disable-convert \
    --disable-libudev
  make "${_tools[@]}"
}

package() {
  cd "${srcdir}/btrfs-progs"
  local _tool
  for _tool in "${_tools[@]}"; do
    install -Dm755 "${_tool}" "${pkgdir}/usr/bin/${_tool}"
  done
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
