# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><contacto@mrhacker.com.co>
pkgname=wazuh-agent
pkgver=4.14.3
pkgrel=2
_remRevision=1
_prodver=${pkgver}-${_remRevision}
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
sha512sums_x86_64=('b3632379a1e031d3a19e0129688e46a68290e75cc8ef5eef53257a35e8a0eb2d0ff9f3a3e8616d4bd8258c4be092adfbd6232d1a747882c866577b25523a74e2')
sha512sums_aarch64=('5ecc0bdc9b7435ad2133259581f0061a20549743cb17a2f8049b3cfc8a5ddabdf2e3f653fa11bf09b326b010f5150586e41109eb1facda782ee85e856322035c')

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
