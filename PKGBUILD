# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><contacto@mrhacker.com.co>
pkgname=wazuh-agent
pkgver=4.14.2
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgrel=2
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

sca_file="cis_arch_linux.yml"
source=(
  "${sca_file}::https://raw.githubusercontent.com/wazuh/integrations/refs/heads/main/integrations/archlinux_sca/sca/cis_arch_linux.yml"
  "ossec.conf"
)
source_aarch64=("https://packages.wazuh.com/4.x/yum/${pkgname}-${pkgver}-${_remRevision}.aarch64.rpm"
)
source_x86_64=("https://packages.wazuh.com/4.x/yum/${pkgname}-${pkgver}-${_remRevision}.x86_64.rpm"
)

backup=(
  "var/ossec/etc/client.keys"
  "var/ossec/etc/local_internal_options.conf"
  "var/ossec/etc/ossec.conf"
)

sha512sums=('3951de83f3f61191eb5ddc5c5474a2a049e86d6a9607cdcbbe9caa77cc58d3a33f9a3e6b2070381ff6285b8b41da544a9785d1fbe3fb1dd72d956c58c516b2c6'
            '1519bf61133eaa16be796a3181f13fc8f3eb647f69f9b6eac0d794f32898880b326e9389e1aef74316cd4afa07b61aabfe82e001745f54d0267f33bb39e7d173')
sha512sums_x86_64=('008e4fadc814285ce7f70f06d914f264c19904f667870a77a25dafaeaea301a528c7debb0201610527fb639dfc77d1b7ddbdca3d8a5efb98756d295d657cacaa')
sha512sums_aarch64=('a33a0536c8c2fb0667bc0bb64e006f1c9b34d3764438cf9f56930a15aa3d8bf8a7017c90c654709a2204b4aa87bc467bb8a66490abf55bf58b6e8b7f61a614a5')

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

  # Instalar ossec.conf personalizado para Arch Linux
  install -Dm644 "$srcdir/ossec.conf" "$pkgdir/var/ossec/etc/ossec.conf"

  # Instalar archivo SCA para Arch Linux
  install -Dm640 "$srcdir/$sca_file" "$pkgdir/var/ossec/ruleset/sca/$sca_file"

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
