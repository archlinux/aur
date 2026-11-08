# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-manager
pkgver=4.14.10
pkgrel=1
_remRevision=1
_prodver=${pkgver}-${_remRevision}
pkgdesc="Wazuh Manager for Arch Linux"
arch=('x86_64')
url="https://wazuh.com/"
license=('gpl2')
groups=("wazuh-siem")
depends=(
  'wazuh-filebeat'
  'curl'
)

optdepends=(
)

# Manager y agente son el mismo /var/ossec: comparten ~164 ficheros. Sin esta
# declaracion pacman aborta con un "exists in filesystem" ilegible en vez de
# avisar del conflicto real entre los dos paquetes.
conflicts=('wazuh-agent')

validpgpkeys=(
)

source=(
  "https://packages.wazuh.com/4.x/yum/${pkgname}-${_prodver}.x86_64.rpm"
)

sha512sums=('f71db57241ec42ef3e68c617edf010e516d85a217e7b2cc019edd945b49ae077bccc5e0ed031d848fd903a9c31a1522f007f9399956b694a4a34d7cad0a71f30')

install=$pkgname.install

package() {
  #Setup
  cd $pkgdir
  mv $srcdir/etc .
  mv $srcdir/usr .
  mv $srcdir/var .

  #change permissions (owner will be set in post_install when user exists)
  chmod -R +w "$pkgdir/var/ossec"

  # Politicas SCA. El %post del RPM las mueve desde var/ossec/tmp/sca-*-tmp a
  # ruleset/sca y borra el temporal. Sin ese paso el manager se instala con
  # ruleset/sca VACIO (queda sin ninguna politica SCA) y ademas se dejan 21 MB
  # de temporales en disco para siempre.
  # La seleccion depende de la distro, pero en Arch y sus derivadas nunca hay
  # un sca.files propio, asi que siempre aplica el de 'generic': se puede
  # resolver aqui, en tiempo de empaquetado, y el paquete queda determinista.
  local _sca_tmp _f _base
  _sca_tmp=$(find "$pkgdir/var/ossec/tmp" -maxdepth 1 -type d -name 'sca-*-tmp' 2>/dev/null | head -1)
  if [ -n "$_sca_tmp" ] && [ -r "$_sca_tmp/generic/sca.files" ]; then
    install -dm750 "$pkgdir/var/ossec/ruleset/sca"

    # Politicas activas para esta distro
    while read -r _f; do
      [ -f "$_sca_tmp/$_f" ] && install -m640 "$_sca_tmp/$_f" "$pkgdir/var/ossec/ruleset/sca/"
    done < "$_sca_tmp/generic/sca.files"

    # El resto de politicas que el manager distribuye a sus agentes se instalan
    # desactivadas (.disabled), igual que hace el RPM.
    while read -r _f; do
      _base=$(basename "$_f")
      if [ -f "$_sca_tmp/$_f" ] && [ ! -f "$pkgdir/var/ossec/ruleset/sca/$_base" ]; then
        install -m640 "$_sca_tmp/$_f" "$pkgdir/var/ossec/ruleset/sca/${_base}.disabled"
      fi
    done < "$_sca_tmp/generic/sca.manager.files"

    rm -rf "$_sca_tmp"
  fi

  #Set systemd service file perms
  chmod 644 $pkgdir/usr/lib/systemd/system/wazuh-manager.service
}
