# Maintainer: fitu996 <fitu996 _at_ gmail _dot_ com>
# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: C2D6@aur (PKGBUILD improvements)

#       NOTE: Previous versions of this PKGBUILD contained an unused signature file.
#       If you wish you validate the source file against its signature,
#       please import the developer's public key (E3AFE70396CCC0D9E5D8381CB0DBCA7D64F770B2),
#       and use their signed file (.gpg) found on the upstream website (https://dvdisaster.jcea.es/index.html).

pkgname=dvdisaster
pkgver=0.79.10
pkgrel=2
provides=('dvdisaster')
pkgdesc="Provides a margin of safety against data loss on newly created ISO, CD, DVD, BDR, and M-Disc media caused by aging or scratches"
arch=('x86_64')
url="https://dvdisaster.jcea.es"
license=('GPL')
depends=('gtk2')
options=('!makeflags')
source=(${pkgname}-${pkgver}.tar.bz2::${url}/downloads/${pkgname}-${pkgver}.tar.bz2)
# Upstream only publishes an MD5 hash, which is why MD5 is specfically used in this checksum array
md5sums=('e913b8375a2bd41a55df7f53379f8d0d')

build() {
  export CFLAGS="$CFLAGS -fcommon"
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --docdir=/usr/share/doc \
    --localedir=/usr/share/locale \
    --with-nls=yes \
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make BUILDROOT="${pkgdir}" install
  # Remove unnecessary uninstaller script 
  rm -f "${pkgdir}/usr/bin/dvdisaster-uninstall.sh"
  # Copy .desktop file to standard applications directory
  install -D -m 644 contrib/dvdisaster.desktop "${pkgdir}/usr/share/applications/dvdisaster.desktop"
  # Rename all .png icons to strip their resolution from their names, and place them in the proper standard icon subdirectories
  for i in 16 24 32 48 64 ; do
    install -D -m 644 contrib/dvdisaster${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/dvdisaster.png"
  done
}
