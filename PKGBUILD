# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributer: J.W Birdsong < @ gmail>
# Contributor: Igor Nemilentsev <trezorg dog gmail.com>
# Contributor: Miroslaw "firestarter" Wojtylak mwojtylak@gmail.com
# Based on PKGBUILD from Dan Zwell <dzwell@zwell.net>

pkgname=btrfs-progs-git
_gitname=${pkgname%-git}
pkgver=6156_6.0_r0_g3db75635
pkgrel=1
pkgdesc="Btrfs filesystem utilities"
arch=("i686" "x86_64")
url="https://btrfs.wiki.kernel.org/index.php/Main_Page"
license=('GPL')
depends=('glibc' 'e2fsprogs' 'lzo' 'zlib' 'zstd' 'systemd-libs')
makedepends=('git' 'asciidoc' 'xmlto' 'python' 'python-setuptools' 'systemd' 'python-sphinx')
provides=('btrfs-progs')
conflicts=('btrfs-progs')
_url=https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/btrfs-progs/trunk/
install="${pkgname}.install"
source=(git+"https://github.com/kdave/btrfs-progs.git"
        "initcpio-hook-btrfs::${_url}initcpio-hook-btrfs?h=packages/btrfs-progs"
        "initcpio-install-btrfs::${_url}initcpio-install-btrfs?h=packages/btrfs-progs"
        "btrfs-scrub@.service::${_url}btrfs-scrub@.service?h=packages/btrfs-progs"
        "btrfs-scrub@.timer::${_url}btrfs-scrub@.timer?h=packages/btrfs-progs")
md5sums=('SKIP'
         'b09688a915a0ec8f40e2f5aacbabc9ad'
         '7241ba3a4286d08da0d50b7176941112'
         'ab4fc5bec59a09f03625d5683bae9046'
         '40ac621390e93a934b9661adbcedf7a8')
sha1sums=('SKIP'
          'bf017ec8fd82c5be282b50fc49b63fa3dc2c44a8'
          '5e32dc3a7c704c0114efcb01e48c6f4c673ea9be'
          'b58e38063b55496fd9d13b30e04b8f346f3b6a4a'
          'f75f76ff1a760f6c710cf0d5ab1c52874fc5625c')

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
    tests/fsck-tests/037-freespacetree-repair \
    tests/fsck-tests/052-init-csum-tree \
    tests/fsck-tests/056-raid56-false-alerts \
    tests/fsck-tests/057-seed-false-alerts \
    tests/fsck-tests/059-shrunk-device

  make test-fsck

  # And now convert tests need sudo... uncomment to run them
  #make test-convert
}

# vim:set ts=2 sw=2 et:
