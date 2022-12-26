# Maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: okhsunrog <me@gornushko.com>
# Contributor: tinywrkb <tinywrkb@gmail.com>

# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Thomas Bächler <thomas.archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>

pkgname=ntfsprogs-ntfs3
pkgver=2022.10.3
pkgrel=1
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
            '8baa89042d50a1704e71aec8537315bbdc99dfe67e189db6392511fb151264ab')

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
