# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=filezilla-server
pkgver=1.10.1
pkgrel=1
pkgdesc="A simple FTP, FTPS or SFTP server"
arch=(x86_64)
url="https://filezilla-project.org/download.php?type=server"
license=(AGPL-3.0-only)
depends=(libfilezilla libfilezilla.so)
makedepends=(wxwidgets-gtk3 pugixml)
optdepends=(wxwidgets-gtk3)
#source=("https://download.filezilla-project.org/server/FileZilla_Server_${pkgver}_src.tar.xz")
#source=("FileZilla_Server_${pkgver}_src.tar.xz::https://dl1.cdn.filezilla-project.org/server/FileZilla_Server_${pkgver}_src.tar.xz?h=JVfOb794svM7ZUOHWIAsYg&x=1721567973")
source=("https://sourceforge.net/projects/fabiololix-os-archive/files/src/FileZilla_Server_${pkgver}_src.tar.xz")
sha512sums=('e0127c582fb824bbfa9af3e7e4836d7633ffa6c1d4817d21e13cc96b9e9c98a69ef159aeae3d46c2010ccea26dfc0006ecdd8dd3afff89c6783dcec48e96d7f0')

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
