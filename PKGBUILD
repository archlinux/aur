# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributer: J.W Birdsong < @ gmail>
# Contributor: Igor Nemilentsev <trezorg dog gmail.com>
# Contributor: Miroslaw "firestarter" Wojtylak mwojtylak@gmail.com
# Based on PKGBUILD from Dan Zwell <dzwell@zwell.net>

pkgname=btrfs-progs-git
_gitname=${pkgname%-git}-unstable
pkgver=4.9_r33_g2a471100
pkgrel=1
pkgdesc="Btrfs filesystem utilities"
arch=("i686" "x86_64")
url="http://btrfs.wiki.kernel.org/index.php/Main_Page"
license=('GPL')
depends=('glibc' 'e2fsprogs' 'lzo2' 'zlib')
makedepends=('git' 'asciidoc' 'xmlto')
provides=('btrfs-progs')
conflicts=('btrfs-progs')
_url=https://projects.archlinux.org/svntogit/packages.git/plain/trunk/
install="${pkgname}.install"
source=($_gitname::git+"http://repo.or.cz/r/btrfs-progs-unstable/devel.git#branch=devel"
        "initcpio-hook-btrfs::${_url}initcpio-hook-btrfs?h=packages/btrfs-progs"
        "initcpio-install-btrfs::${_url}initcpio-install-btrfs?h=packages/btrfs-progs"
        "btrfs-scrub@.service::${_url}btrfs-scrub@.service?h=packages/btrfs-progs"
        "btrfs-scrub@.timer::${_url}btrfs-scrub@.timer?h=packages/btrfs-progs")
md5sums=('SKIP'
         'b09688a915a0ec8f40e2f5aacbabc9ad'
         '7241ba3a4286d08da0d50b7176941112'
         '794b867e09451284c545bae112aa0cfd'
         '502221c1b47a3bb2c06703d4fb90a0c2')

pkgver() {
  cd "$_gitname"
  _curtag="$(git rev-list --tags --max-count=1)"
  _tagver="$(git describe --tags $_curtag | sed 's:^v::')"
  _commits="$(git log v${_tagver}..HEAD --oneline | wc -l)"
  _sha="$(git rev-parse --short HEAD)"
  printf "%s_r%s_g%s" $_tagver $_commits $_sha | sed 's:-:_:g'
}

prepare() {
  cd "$_gitname"
  ./autogen.sh
}

build() {
  cd "$_gitname"
  ./configure --prefix=/usr
  make
}

package() {
  # install mkinitcpio files
  install -Dm644 initcpio-hook-btrfs "$pkgdir/usr/lib/initcpio/hooks/btrfs"
  install -Dm644 initcpio-install-btrfs "$pkgdir/usr/lib/initcpio/install/btrfs"

  # install scrub service/timer
  install -Dm644 btrfs-scrub@.service "$pkgdir/usr/lib/systemd/system/btrfs-scrub@.service"
  install -Dm644 btrfs-scrub@.timer "$pkgdir/usr/lib/systemd/system/btrfs-scrub@.timer"

  cd "$_gitname"
  make DESTDIR="$pkgdir" install
  
  # install bash completion
  install -Dm644 btrfs-completion "$pkgdir/usr/share/bash-completion/completions/btrfs"
}

check() {
  cd "$_gitname"

  # Test #12 uses sudo, remove/comment the next line to enable it
  rm -rf tests/fsck-tests/012-leaf-corruption
  # Ditto for test #13
  rm -rf tests/fsck-tests/013-extent-tree-rebuild
  # And #24...
  rm -rf tests/fsck-tests/024-clear-space-cache

  make test-fsck

  # And now convert tests need sudo... uncomment to run them
  #make test-convert
}

# vim:set ts=2 sw=2 et:
