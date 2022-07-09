# Maintainer: tinywrkb <tinywrkb@gmail.com>
# Contributor: okhsunrog <me@gornushko.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Thomas Bächler <thomas.archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

pkgname=ntfsprogs-ntfs3
pkgver=2022.5.17
pkgrel=1
pkgdesc='NTFS filesystem utilities without NTFS-3G driver. For system with kernel >= 5.15'
url='https://www.tuxera.com/company/open-source/'
arch=('x86_64')
license=('GPL2')
depends=('util-linux')
makedepends=('git')
conflicts=('ntfsprogs' 'ntfs-3g')
provides=('ntfsprogs' 'ntfs-3g')
replaces=('ntfsprogs')
_commit=875a1d4e90874457151466870fe2c70a2bedfd98  # tags/2022.5.17
source=("ntfs-3g::git+https://github.com/tuxera/ntfs-3g#commit=$_commit"
        'mount.ntfs'
        'udisks2-ntfs.rules')
sha256sums=('SKIP'
            'c468ffe0d9baac40aff77acaf2ef71baf9cd4a05355de639ad832839156eadf6'
            '35cbd5290944b8ce9536dcee42321e5b418ff135f5b623bed6797760e1a1ad5b')

pkgver() {
  cd ntfs-3g
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd ntfs-3g

  local configure_options=(
    --prefix=/usr
    --sbin=/usr/bin
    --mandir=/usr/share/man
    --disable-ldconfig
    --disable-static
    --enable-xattr-mappings
    --enable-posix-acls
    --enable-extras
    --disable-ntfs-3g
  )

  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make ntfsprogs
}

package() {
  make -C ntfs-3g ntfsprogs DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/share/man/man8/ntfsfallocate.8 # uninstalled binary
  install -Dm755 mount.ntfs -t "${pkgdir}"/usr/bin/
  install -Dm644 udisks2-ntfs.rules "${pkgdir}"/usr/lib/udev/rules.d/99-udisks2-ntfs.rules
}
