pkgname=samba-util-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="A simple and modern GUI for managing Samba."
arch=('x86_64')
url="https://github.com/mijocecr/samba-util"
license=('MIT')

depends=(
  'samba'        # smbd, nmbd, testparm
  'systemd'      # Control de servicios
  'cifs-utils'   # Utilidades de montaje cifs
)

optdepends=(
  'cups: impresión a través de Samba'
  'gvfs-smb: integración con exploradores de archivos'
  'nss-mdns: descubrimiento de red mDNS'
  'avahi: soporte para mDNS/zeroconf'
)

options=('!debug' '!strip')

source=("https://github.com/mijocecr/samba-util/releases/download/samba-util_v4.2/SAMBA-Util.tar.gz")

sha256sums=('cf5104f91e926483ab571ecb5e9a4d380c6b82df11cd3d9b2b1efdb87297112f')

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
