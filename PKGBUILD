# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><contacto@mrhacker.com.co>
pkgname=wazuh-agent
pkgver=4.14.6
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
  "cis_arch_linux-arch-derivatives.patch"
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
            '94ef03e4ec28bf5adb6abc761adfa785e9088667e3a6df39af87b33d25cd9cdd3df3a388bb4bccae22643dc7c030927754240ab1724afaef047e08393536bf44'
            '41548675747387bc11ea755f41272d42456d82845fa9e469c3ad6f16254062ac220e6e5652721201884e2256941968b24b92d17e15b869eaf2a7ba2ba22a8d72')
sha512sums_x86_64=('e58ae95a9bacf01aeb56581dca653e8b40f8233b8ec756247ec007604399116d5a39a7c98785c6d046bca48e7f57f9699a8c6e538d060a785e24b964bb39f17d')
sha512sums_aarch64=('eb0c101b1d632e692b917ce7923dd3ef8354cd859292bd8a475e67c5ed40a62cc55f4d671674dbad54df4225f20dbc01ba78207f4170e53ccfd3be49c545e659')

install=$pkgname.install

prepare() {
  # Corregir permisos restrictivos del RPM para que makepkg pueda limpiar $srcdir
  chmod -R u+rwX "$srcdir/var/ossec"

  # makepkg enlaza las fuentes no-archivo como symlink dentro de $srcdir apuntando
  # a la caché SRCDEST. patch(1) se niega a modificar symlinks (endurecimiento
  # CVE-2015-1196) y, de seguirlos con --follow-symlinks, parchearía el archivo
  # cacheado in-place rompiendo el checksum en el siguiente build. Materializamos
  # una copia real primero: patch actúa sobre $srcdir (efímero), no sobre la caché.
  if [ -L "$srcdir/$sca_file" ]; then
    cp --remove-destination -- "$(readlink -f "$srcdir/$sca_file")" "$srcdir/$sca_file"
  fi

  # Aplicar correcciones locales al SCA de upstream:
  #  - Detección de OS por ID_LIKE=arch (soporta CachyOS y demás derivados de Arch)
  #  - Arreglo del bug "not c:comando" sin patrón en el motor SCA de Wazuh
  #  - Fallback con findmnt para las comprobaciones de montaje de /tmp
  patch -Np1 -d "$srcdir" -i "$srcdir/cis_arch_linux-arch-derivatives.patch"
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
