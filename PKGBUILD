# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=filezilla-server
pkgver=1.10.3
pkgrel=1
pkgdesc="A simple FTP, FTPS or SFTP server"
arch=(x86_64)
url="https://filezilla-project.org/download.php?type=server"
license=(AGPL-3.0-only)
depends=(pugixml libfilezilla libfilezilla.so)
makedepends=(wxwidgets-gtk3)
optdepends=(wxwidgets-gtk3)
#source=("https://download.filezilla-project.org/server/FileZilla_Server_${pkgver}_src.tar.xz")
#source=("FileZilla_Server_${pkgver}_src.tar.xz::https://dl1.cdn.filezilla-project.org/server/FileZilla_Server_${pkgver}_src.tar.xz?h=JVfOb794svM7ZUOHWIAsYg&x=1721567973")
source=("https://sourceforge.net/projects/fabiololix-os-archive/files/src/FileZilla_Server_${pkgver}_src.tar.xz")
sha512sums=('266477399522c5d72e405eaa371c3561902100549c02656f78be7c27ac7c7026bfdab20740495070c5f223fba60bcabaca582b5e7caa4aa7714a13b4b2d33305')

build() {
  cd "filezilla-server-${pkgver}"
  ./configure --prefix=/usr --with-pugixml=system
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
