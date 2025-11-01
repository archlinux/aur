# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=filezilla-server
pkgver=1.10.5
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
source=("https://sourceforge.net/projects/fabiololix-os-archive/files/src/FileZilla_Server_${pkgver}_src.tar.xz"
		filezilla-server-Remove-demos-leftovers.patch)
sha512sums=('d74385b730acf5efda2caa8a803ea50342836e49e65ab7b6eeb0e4a80de920f3930e14e66268e8ff9036ff81fb392bd67ef143fd602370d9a244ed202048ff07'
            '8981c2e10e12b627fc3b68e271e3449b05062fc717c537b6bf8cc38e8e2ea6bd79b47fb326ec5c36b718c7054f50b40e282fcd70b9cb902f25213602d6e52e3f')

prepare() {
  cd "filezilla-server-${pkgver}"
  patch -Np2 -i ../filezilla-server-Remove-demos-leftovers.patch
}

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
