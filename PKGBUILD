# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=btrfs-progs-unstable-integration
_gitname=${pkgname%-integration}
pkgver=20141218
pkgrel=1
pkgdesc="Btrfs filesystem utilities - David Sterba's unstable 'integration' branch"
arch=("i686" "x86_64")
url="http://btrfs.wiki.kernel.org/index.php/Main_Page"
license=('GPL2')
depends=('glibc' 'e2fsprogs' 'lzo2' 'zlib')
makedepends=('git' 'asciidoc' 'xmlto')
provides=('btrfs-progs')
conflicts=('btrfs-progs' 'btrfs-progs-git' 'btrfs-progs-integration-git')
changelog=changelog.txt
_url=https://projects.archlinux.org/svntogit/packages.git/plain/trunk/
source=($_gitname::git+"http://repo.or.cz/r/btrfs-progs-unstable/devel.git#branch=integration-${pkgver/./-}"
        "initcpio-hook-btrfs::${_url}initcpio-hook-btrfs?h=packages/btrfs-progs"
        "initcpio-install-btrfs::${_url}initcpio-install-btrfs?h=packages/btrfs-progs")
md5sums=('SKIP'
         'b09688a915a0ec8f40e2f5aacbabc9ad'
         '7241ba3a4286d08da0d50b7176941112')

build() {
  cd "$_gitname"
  make CFLAGS="$CFLAGS" all btrfs-select-super
}

package() {
  # install mkinitcpio files
  install -Dm644 initcpio-hook-btrfs "$pkgdir/usr/lib/initcpio/hooks/btrfs"
  install -Dm644 initcpio-install-btrfs "$pkgdir/usr/lib/initcpio/install/btrfs"

  cd "$_gitname"
  make prefix="$pkgdir/usr" bindir="$pkgdir/usr/bin" install
  install -m755 btrfs-select-super "$pkgdir/usr/bin/btrfs-select-super"
  install -Dm644 INSTALL "$pkgdir/usr/share/doc/btrfs/README"
}

check() {
  cd "$_gitname"
  # test #13 currently incomplete
  # http://thread.gmane.org/gmane.comp.file-systems.btrfs/41568
  rm tests/fsck-tests/013-leaf-corruption-no-extent-data.tar.xz
  make test
}

# vim:set ts=2 sw=2 et:
