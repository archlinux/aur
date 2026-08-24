# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit
# Contributor formula: -release-git (skill Option D, source-build variant).
# Tracks kdave/btrfs-progs release-tag cadence; builds only the unshipped
# internal tool btrfs-sb-mod (superblock field reader/modifier with checksum
# fixup). Not provided by any AUR package or btrfs-progs-git (internal tools
# are not installed by upstream 'make install').
_repo=kdave/btrfs-progs
pkgname=btrfs-sb-mod-release-git
_pkgname=btrfs-sb-mod
pkgver=7.1
pkgrel=1
pkgdesc='Modify or read members of a btrfs primary superblock with checksum recalculation (unshipped btrfs-progs internal tool), latest release tag build'
arch=('x86_64')
url="https://github.com/${_repo}"
license=('GPL-2.0-only')
depends=('util-linux-libs')
makedepends=(
  'git'
  'libgcrypt'
  'lzo'
  'zlib'
  'zstd'
)
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
  # fix upstream csum-size bug: update_block_csum()/check_csum_superblock()
  # used the CRC32-sized global for xxhash64, truncating the digest
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
  make "${_pkgname}"
}

package() {
  cd "${srcdir}/btrfs-progs"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:
