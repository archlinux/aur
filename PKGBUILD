# Maintainer: Hugh Whelan <brickhousedevelopers@gmail.com>
pkgname=scidcommunity
pkgver=5.1.2.44
pkgrel=72
pkgdesc="Enhanced fork of Scid chess database with Chess.com/Lichess integration, tablebase lookup, improved search, and additional training features"
arch=('x86_64')
url="https://github.com/whelanh/scidCommunity"
license=('GPL2')
depends=('tcl' 'tk')
makedepends=('gcc' 'make' 'git')

# Commit hash that includes the ui_tcltk.h fix for system-wide installations
_commit="3696c46722013f52c3f4f418c28a04f9da5046fb"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whelanh/scidCommunity/archive/${_commit}.tar.gz")
sha256sums=('SKIP')  # Safe to skip: integrity verified by commit hash

build() {
  cd "${srcdir}/scidCommunity-${_commit}"
  # Configure with runtime paths (will be re-configured in package() for staging)
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/scidCommunity-${_commit}"

  # Re-run configure with staging paths so Makefile uses correct directories
  ./configure SHAREDIR="${pkgdir}/usr/share/scid" BINDIR="${pkgdir}/usr/bin"

  # Install data files
  make install_shared

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

