# Maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: okhsunrog <me@gornushko.com>
# Contributor: tinywrkb <tinywrkb@gmail.com>

pkgname=ntfsprogs-ntfs3
pkgver=2022.5.17
pkgrel=2
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
        'udisks_fix_mount_options.conf'
        'udev_ntfs3_by_default.rules'
        )
sha256sums=('49680b2dd38c472368425923b0178195e24705fc355c78764632e5835000db49'
            'c468ffe0d9baac40aff77acaf2ef71baf9cd4a05355de639ad832839156eadf6'
            '9aa988de69f56fe983e9e7cb5c434a4eba1ef36889feac87725cf3220ba22cc5'
            '35cbd5290944b8ce9536dcee42321e5b418ff135f5b623bed6797760e1a1ad5b')

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
  install -Dm644 udisks_fix_mount_options.conf "${pkgdir}/etc/udisks2/mount_options.conf"
  install -Dm644 udev_ntfs3_by_default.rules "${pkgdir}/usr/lib/udev/rules.d/99-udisks2-ntfs.rules"
}
