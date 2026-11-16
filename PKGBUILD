pkgname=samba-util-bin
pkgver=4.3.0
pkgrel=1
pkgdesc="A simple and modern GUI for managing Samba."
arch=('x86_64')
url="https://github.com/mijocecr/samba-util"
license=('MIT')

depends=(
  'samba'        # smbd, nmbd, testparm, smbpasswd, pdbedit
  'smbclient'    # smbclient, rpcclient (descubrimiento de red)
  'systemd'      # Control de servicios
  'xdg-utils'    # xdg-open (abrir archivos y recursos compartidos)
)

optdepends=(
  'cups: impresión a través de Samba'
  'gvfs-smb: integración con exploradores de archivos y montaje de recursos remotos'
  'cifs-utils: utilidades CIFS para montajes manuales'
)

options=('!debug' '!strip')

source=("https://github.com/mijocecr/samba-util/releases/download/samba-util_v4.3.0/SAMBA-Util.tar.gz")

sha256sums=('5b08be3cbe04465ae0bcb363fa403b5f461862ac0fe9d115c8dbbe57aaabe8ca')

package() {
  # Crear la estructura de destino en /usr/lib
  install -d "$pkgdir/usr/lib/samba-util"

  # Copiar únicamente los archivos necesarios de la aplicación (evitando duplicar el tarball o basura)
  # O si prefieres copiar todo el contenido filtrando el propio tar.gz:
  find "$srcdir" -maxdepth 1 ! -name '.' ! -name '..' ! -name '*.tar.gz' -exec cp -r {} "$pkgdir/usr/lib/samba-util/" \;

  # Asegurar permisos correctos de ejecución en el binario principal
  chmod +x "$pkgdir/usr/lib/samba-util/SAMBA-Util"

  # Crear enlace simbólico en /usr/bin para ejecución global
  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/samba-util/SAMBA-Util "$pkgdir/usr/bin/samba-util"

  # Instalar archivo desktop y icono con sus permisos estándar (644)
  install -Dm644 "$srcdir/samba-util.desktop" "$pkgdir/usr/share/applications/samba-util.desktop"
  install -Dm644 "$srcdir/samba-util.png" "$pkgdir/usr/share/pixmaps/samba-util.png"
}
