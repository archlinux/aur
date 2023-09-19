# Maintainer: Mingi Sung <fiestalake@disroot.org>
# Contributor: okhsunrog <me@gornushko.com>
# Contributor: tinywrkb <tinywrkb@gmail.com>

# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Thomas Bächler <thomas.archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

pkgname=ntfsprogs-ntfs3
pkgver=2022.10.3
pkgrel=4
pkgdesc='NTFS filesystem utilities without NTFS-3G driver. For system with kernel >= 5.15'
url='https://github.com/tuxera/ntfs-3g'
arch=('x86_64')
license=('GPL2')
depends=('util-linux')
makedepends=('git')
conflicts=('ntfsprogs' 'ntfs-3g')
provides=('ntfsprogs' 'ntfs-3g')
replaces=('ntfsprogs')
source=("ntfs-3g_${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        'mount.ntfs'
        'udisks_ntfs3_mount_options.rules'
        )
sha256sums=('8bd7749ea9d8534c9f0664d48b576e90b96d45ec8803c9427f6ffaa2f0dde299'
            'c468ffe0d9baac40aff77acaf2ef71baf9cd4a05355de639ad832839156eadf6'
            'a09fb29f7546dc6702d01f408035c9d89d8edd3754539f779c97264bd6ab45a3')
b2sums=('1083d5549af9fd4ddd90e85d27b9221ab6d766813bab383c5f66cb0ee4c3cfb565ca2fe017642130d8051b63b034f2fddd8f87ee9fca59d30018eb55a55294cf'
        'aaa83ac2cf00e36c3c4f20ec3ea74f12a299d6decd66898124265ed552f0b35c7611cc45147147bf508cd81e0d5be0ded2ba13a5ba422e728e83e442c37abd84'
        'b175409fd7244eed94cd68f3411621f0c7b9114b7ab09c628fca04a608a9c0c095a8ecf8b1df82cdcf4a9ae91ee4c4ae27e1b47c21b0af966e1c3c9606224ae8')

build() {
  cd ntfs-3g-${pkgver}

  local configure_options=(
    --prefix=/usr
    --sbin=/usr/bin
    --mandir=/usr/share/man
    --disable-ldconfig
    --disable-static
    --enable-xattr-mappings
    --enable-posix-acls
    --enable-extras
    --enable-crypto
    --without-hd
    --disable-ntfs-3g
  )

  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make ntfsprogs
}

package() {
  make -C ntfs-3g-${pkgver} ntfsprogs DESTDIR=${pkgdir} install
  rm "${pkgdir}/usr/share/man/man8/ntfsfallocate.8" # uninstalled binary
  install -Dm755 mount.ntfs -t "${pkgdir}/usr/bin/"
  install -Dm644 udisks_ntfs3_mount_options.rules "${pkgdir}/usr/lib/udev/rules.d/99-udisks2-ntfs.rules"
}
