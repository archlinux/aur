# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributer: J.W Birdsong < @ gmail>
# Contributor: Igor Nemilentsev <trezorg dog gmail.com>
# Contributor: Miroslaw "firestarter" Wojtylak mwojtylak@gmail.com
# Based on PKGBUILD from Dan Zwell <dzwell@zwell.net>

pkgname=btrfs-progs-git
_gitname=${pkgname%-git}
pkgver=4704_5.2_r0_g608fd900
pkgrel=1
pkgdesc="Btrfs filesystem utilities"
arch=("i686" "x86_64")
url="https://btrfs.wiki.kernel.org/index.php/Main_Page"
license=('GPL')
depends=('glibc' 'e2fsprogs' 'lzo' 'zlib' 'zstd')
makedepends=('git' 'asciidoc' 'xmlto' 'python' 'python-setuptools')
provides=('btrfs-progs')
conflicts=('btrfs-progs')
_url=https://projects.archlinux.org/svntogit/packages.git/plain/trunk/
install="${pkgname}.install"
source=(git+"https://github.com/kdave/btrfs-progs.git"
        "initcpio-hook-btrfs::${_url}initcpio-hook-btrfs?h=packages/btrfs-progs"
        "initcpio-install-btrfs::${_url}initcpio-install-btrfs?h=packages/btrfs-progs"
        "btrfs-scrub@.service::${_url}btrfs-scrub@.service?h=packages/btrfs-progs"
        "btrfs-scrub@.timer::${_url}btrfs-scrub@.timer?h=packages/btrfs-progs")
md5sums=('SKIP'
         'b09688a915a0ec8f40e2f5aacbabc9ad'
         '7241ba3a4286d08da0d50b7176941112'
         '917b31f4eb90448d6791e17ea0f386c7'
         '42475169de355a33d551b2f368eb0a50')
sha1sums=('SKIP'
          'bf017ec8fd82c5be282b50fc49b63fa3dc2c44a8'
          '5e32dc3a7c704c0114efcb01e48c6f4c673ea9be'
          '59f32f9abbe4831c3d342d9c208c8c4dea0629bc'
          'c1b4efdd9a001f5d75bcb68d6c90a4fe32b7b601')

pkgver() {
  cd ${_gitname}
  _totalcommits="$(git rev-list --count HEAD)"
  _curtag="$(git rev-list --tags --max-count=1)"
  _tagver="$(git describe --tags ${_curtag} | sed 's:^v::')"
  _commits="$(git log v${_tagver}..HEAD --oneline | wc -l)"
  _sha="$(git rev-parse --short HEAD)"
  printf "%s_%s_r%s_g%s" ${_totalcommits} ${_tagver} ${_commits} ${_sha} | sed 's:-:_:g'
}

prepare() {
  cd ${_gitname}
  ./autogen.sh
}

build() {
  cd ${_gitname}
  ./configure --prefix=/usr
  make
}

package() {
  # install mkinitcpio files
  install -Dm644 initcpio-hook-btrfs "${pkgdir}/usr/lib/initcpio/hooks/btrfs"
  install -Dm644 initcpio-install-btrfs "${pkgdir}/usr/lib/initcpio/install/btrfs"

  # install scrub service/timer
  install -Dm644 btrfs-scrub@.service "${pkgdir}/usr/lib/systemd/system/btrfs-scrub@.service"
  install -Dm644 btrfs-scrub@.timer "${pkgdir}/usr/lib/systemd/system/btrfs-scrub@.timer"

  cd ${_gitname}
  make DESTDIR="${pkgdir}" install
  
  # install bash completion
  install -Dm644 btrfs-completion "${pkgdir}/usr/share/bash-completion/completions/btrfs"
}

check() {
  cd ${_gitname}

  # Some fsck tests use sudo, remove/comment the next lines to enable them
  rm -rf tests/fsck-tests/012-leaf-corruption \
    tests/fsck-tests/013-extent-tree-rebuild \
    tests/fsck-tests/024-clear-space-cache \
    tests/fsck-tests/025-file-extents \
    tests/fsck-tests/028-unaligned-super-dev-sizes \
    tests/fsck-tests/031-metadatadump-check-data-csum \
    tests/fsck-tests/033-lowmem-collission-dir-items \
    tests/fsck-tests/037-freespacetree-repair

  make test-fsck

  # And now convert tests need sudo... uncomment to run them
  #make test-convert
}

# vim:set ts=2 sw=2 et:
