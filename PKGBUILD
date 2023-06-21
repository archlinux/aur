# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=filezilla-server
pkgver=1.7.2
pkgrel=1
pkgdesc="A simple FTP, FTPS or SFTP server for ArchLinux"
arch=(x86_64)
url="https://filezilla-project.org/download.php?type=server"
license=(GPL3)
depends=(libfilezilla pugixml)
makedepends=(wxwidgets-gtk3)
optdepends=(wxwidgets-gtk3)
source=("https://download.filezilla-project.org/server/FileZilla_Server_${pkgver}_src.tar.xz")
sha256sums=('6b58081d61d4e0157f2140aabe2f86e426306d826127de7635b69b532330011a')

build() {
  cd "filezilla-server-${pkgver}"
  ./configure --prefix=/usr
  #make
}

package() {
  cd "filezilla-server-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -D pkg/unix/filezilla-server.service     -t "${pkgdir}/usr/lib/systemd/system/"
  install -D pkg/unix/filezilla-server-gui.desktop -t "${pkgdir}/usr/share/applications/"

  sed -i 's"opt/filezilla-server/bin"usr/bin"g'              "${pkgdir}/usr/lib/systemd/system/filezilla-server.service"
  sed -i 's"opt/filezilla-server/etc"etc/filezilla-server"g' "${pkgdir}/usr/lib/systemd/system/filezilla-server.service"

  sed -i 's"/opt/filezilla-server/share/icons/hicolor/scalable/apps/filezilla-server-gui.svg"filezilla-server-gui"g' \
         "${pkgdir}/usr/share/applications/filezilla-server-gui.desktop"
  sed -i 's"opt/filezilla-server"usr"g' "${pkgdir}/usr/share/applications/filezilla-server-gui.desktop"
}
