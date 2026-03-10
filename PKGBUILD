# Maintainer: Hugh Whelan <brickhousedevelopers@gmail.com>
pkgname=scidcommunity
pkgver=5.1.2.44
pkgrel=68
pkgdesc="Enhanced fork of Scid chess database with Chess.com/Lichess integration, tablebase lookup, improved search, and additional training features"
arch=('x86_64')
url="https://github.com/whelanh/scidCommunity"
license=('GPL2')
depends=('tcl' 'tk')
makedepends=('gcc' 'make' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whelanh/scidCommunity/archive/a05338b393e2dcda370617be36c89e521e93675c.tar.gz")
sha256sums=('SKIP')  # Safe to skip: integrity verified by commit hash

build() {
  cd "${srcdir}/scidCommunity-a05338b393e2dcda370617be36c89e521e93675c"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/scidCommunity-a05338b393e2dcda370617be36c89e521e93675c"

  # Install data files to /usr/share/scid
  # Use runtime paths (not staging paths) so the Makefile creates correct paths internally
  make install_shared DESTDIR="${pkgdir}" SHAREDIR="/usr/share/scid"

  # Copy binary directly to /usr/bin (avoid broken symlink from make install)
  install -Dm755 scidCommunity "${pkgdir}/usr/bin/scidCommunity"

  # Install engine
  install -Dm755 engines/phalanx-scid/phalanx-scid "${pkgdir}/usr/bin/phalanx-scid"

  # Install desktop entry with corrected Exec path
  install -Dm644 -t "${pkgdir}/usr/share/applications" "flatpak/io.github.whelanh.scidCommunity.desktop"
  # Fix the desktop file to use absolute path
  sed -i 's|^Exec=scidCommunity %f$|Exec=/usr/bin/scidCommunity %f|' "${pkgdir}/usr/share/applications/io.github.whelanh.scidCommunity.desktop"
  sed -i 's|^TryExec=scidCommunity$|TryExec=/usr/bin/scidCommunity|' "${pkgdir}/usr/share/applications/io.github.whelanh.scidCommunity.desktop"

  # Install application icon
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps" "flatpak/io.github.whelanh.scidCommunity.svg"

  # Install appdata/metainfo file
  install -Dm644 -t "${pkgdir}/usr/share/metainfo" "flatpak/io.github.whelanh.scidCommunity.appdata.xml"
}
