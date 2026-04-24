# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><contacto@mrhacker.com.co>
pkgname=wazuh-agent
pkgver=4.14.5
pkgrel=1
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
sha512sums_x86_64=('8b32ca382536af5ae920e51d2ac7c7557f9513bc543ec36e92f6891c88acea497f9061f2c50c0c9d5625b101970440f47bb479928ad0561e00428021bf651020')
sha512sums_aarch64=('7ef26b20d237ed7008f102873a0348c8f9958193d2ee7a1898a632d65911876feccbd21440273389a0ed193e334bc2b79116d7d6c1a19d66eb792a445403034c')

install=$pkgname.install

prepare() {
  # Corregir permisos restrictivos del RPM para que makepkg pueda limpiar $srcdir
  chmod -R u+rwX "$srcdir/var/ossec"
}

package() {

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
