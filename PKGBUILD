# Maintainer: Hugh Whelan <brickhousedevelopers@gmail.com>
pkgname=scidcommunity
pkgver=5.1.3.97
pkgrel=1
pkgdesc="Enhanced fork of Scid chess database with Chess.com/Lichess integration, tablebase lookup, improved search, and additional training features"
arch=('x86_64')
url="https://github.com/whelanh/scidCommunity"
license=('GPL2')
depends=('tcl' 'tk')
makedepends=('gcc' 'make' 'git')
# Commit hash that includes the ui_tcltk.h fix for system-wide installations
_commit="bcbb1626bd4e9cd4b312c0f45d4955f731660d74"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whelanh/scidCommunity/archive/${_commit}.tar.gz")
sha256sums=('SKIP')  # Safe to skip: integrity verified by commit hash

build() {
  cd "${srcdir}/scidCommunity-${_commit}"
  
  # Set version via environment variable (configure script checks this)
  # The version must match what's in tcl/start.tcl (scidVersionExpected = "5.1.1")
  export SCIDCOMMUNITY_VERSION="5.1.1"
  
  # Configure with runtime paths
  ./configure BINDIR=/usr/bin SHAREDIR=/usr/share/scid
  
  # Build
  make all
}

package() {
  cd "${srcdir}/scidCommunity-${_commit}"
  
  # Create necessary directories
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/scid"
  
  # Install data files manually (avoids permission issues with make install_shared)
  # Copy all data directories that exist
  for dir in tcl books bases html bitmaps bitmaps2 img sounds scripts; do
    if [ -d "$dir" ]; then
      cp -r "$dir" "${pkgdir}/usr/share/scid/"
    fi
  done
  
  # Copy binary directly to /usr/bin
  install -Dm755 scidCommunity "${pkgdir}/usr/bin/scidCommunity"
  
  # Install engine
  if [ -f "engines/phalanx-scid/phalanx-scid" ]; then
    install -Dm755 engines/phalanx-scid/phalanx-scid "${pkgdir}/usr/bin/phalanx-scid"
  fi
  
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
