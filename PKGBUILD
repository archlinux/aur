# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-agent
pkgver=4.13.1
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=1
pkgdesc="Wazuh Agent actively protects Arch Linux systems with advanced threat prevention, detection, and response capabilities."
arch=('x86_64' 'aarch64')
url="https://wazuh.com/"
license=('gpl2')
depends=(
  'curl'
  'sudo'
  'perl'
  'python'
  'brotli'
  'nodejs'
  'inetutils'
)
optdepends=(
  'lsb-release'
)

validpgpkeys=(
)

source_aarch64=("https://packages.wazuh.com/4.x/yum/${pkgname}-${pkgver}-${pkgrel}.aarch64.rpm"
)
source_x86_64=("https://packages.wazuh.com/4.x/yum/${pkgname}-${pkgver}-${pkgrel}.x86_64.rpm"
)

backup=(
  "var/ossec/etc/client.keys"
  "var/ossec/etc/local_internal_options.conf"
  "var/ossec/etc/ossec.conf"
)

sha512sums_x86_64=('3005046b3c9af416f26ea66ce01c20c72070d3ecc042b8bccf8d1f7ebe0876e3328cc62d7d1290af6d7819ad06502faf891620bbe1c019466d52a85a3cc66162')
sha512sums_aarch64=('5fd09e2f0d5f33b46b638739e0ca6628b242cf8b7c61b921d56068b27a146ef78c9ed264e95497e03b62ed90779f749f21a01387bb1f0d3ef69e9af1252cf1f6')

install=$pkgname.install

package() {
  # Cambiar permisos
  chmod -R +w "$srcdir/var/ossec"

  # Configuración
  cd $pkgdir
  mv $srcdir/etc .
  mv $srcdir/usr .
  mv $srcdir/var .

  # Asegurarse de que los archivos de configuración existen y tienen permisos adecuados
  mkdir -p $pkgdir/var/ossec/etc

  # Verificamos si los archivos existen antes de intentar establecer permisos
  if [ -f "$pkgdir/var/ossec/etc/ossec.conf" ]; then
    chmod 644 $pkgdir/var/ossec/etc/ossec.conf
  fi

  if [ -f "$pkgdir/var/ossec/etc/local_internal_options.conf" ]; then
    chmod 644 $pkgdir/var/ossec/etc/local_internal_options.conf
  fi

  # Si client.keys no existe, crear uno vacío con permisos adecuados
  if [ ! -f "$pkgdir/var/ossec/etc/client.keys" ]; then
    install -Dm644 /dev/null "$pkgdir/var/ossec/etc/client.keys"
  else
    chmod 644 $pkgdir/var/ossec/etc/client.keys
  fi

  # Establecer permisos del archivo de servicio systemd
  chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-agent.service
}
