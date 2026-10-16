# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-filebeat
pkgver=7.10.2
pkgrel=5
_remRevision=2
_prodver=${pkgver}-${_remRevision}
# Version de Wazuh a la que acompaña este filebeat: fija el tag del que se toma
# wazuh-template.json. Filebeat mantiene su propio versionado (7.10.2).
_wazuhver=4.14.9
_modulever=0.5
pkgdesc="Filebeat version for Wazuh (forwards alerts to Wazuh Indexer)"
arch=('x86_64')
url="https://wazuh.com/"
license=('Apache-2.0')
groups=("wazuh-siem")
depends=(
    'glibc'
    'systemd'
    'curl'
)
optdepends=(
    'wazuh-manager: Wazuh server component'
)

conflicts=('filebeat' 'filebeat-bin' 'filebeat-oss')
provides=('filebeat')

# El modulo wazuh y wazuh-template.json se empaquetan como fuentes verificadas.
# Antes se descargaban con curl desde post_install: eso rompe la reproducibilidad,
# incumple las normas del AUR (toda fuente debe ir en source= con checksum), deja
# ficheros que pacman no controla y no se limpian al desinstalar, y falla en
# silencio (|| true) si no hay red durante la instalacion.
source=(
    "https://packages.wazuh.com/4.x/yum/filebeat-${_prodver}.x86_64.rpm"
    "wazuh-filebeat-module-${_modulever}.tar.gz::https://packages.wazuh.com/4.x/filebeat/wazuh-filebeat-${_modulever}.tar.gz"
    "wazuh-template-${_wazuhver}.json::https://raw.githubusercontent.com/wazuh/wazuh/v${_wazuhver}/extensions/elasticsearch/7.x/wazuh-template.json"
    "filebeat.yml"
)

backup=(
    'etc/filebeat/filebeat.yml'
)

sha512sums=('abe92f985b339894fadc1151744f3ed5e62483e1b1d89e38c6763858eb07ae7c4efdb8ab1780c0d9bd8769357e4852c0c54a897a2501d25f9037bb939efb21b3'
            '1a97f39d7d08f9f8136642cc5a4aa3190248ada5b986e4840955b78548fc17e1c68be283e44ea14b83776863c2b55e0633b48fa9a05c4f0ea597ae4cf8fd6e42'
            'd62ebb7c50a6530637546aafa5c8bc89028aea4299b633a74899070a5a75e3918b4dda2a38a5e02c7289cc0cffe4be40c821f7f19d03eaf3f83617c302251ae6'
            'd3849c90a02a69083c4f0441a767e7a0b4bdfc4df1deb235198e01e0f6a5e4e3f14085abe44519df7cf57bcb92d7c8f310dcac424c83036ed12cc378ed7b913c')

install=$pkgname.install

package() {
    cd $pkgdir

    # Move files from RPM extraction
    mv $srcdir/etc .
    mv $srcdir/usr .
    mv $srcdir/lib ./usr

    # Modulo wazuh de filebeat (el tar.gz se extrae a $srcdir/wazuh)
    cp -a "$srcdir/wazuh" "$pkgdir/usr/share/filebeat/module/"
    find "$pkgdir/usr/share/filebeat/module/wazuh" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/filebeat/module/wazuh" -type f -exec chmod 644 {} +

    # Plantilla de indices para el Wazuh Indexer
    install -Dm644 "$srcdir/wazuh-template-${_wazuhver}.json" \
        "$pkgdir/etc/filebeat/wazuh-template.json"

    # Configuracion de Wazuh en lugar del filebeat.yml generico de Elastic, que
    # no trae el modulo wazuh, ni SSL, ni la plantilla, ni el permiso seccomp
    # de rseq (sin el, filebeat aborta con glibc reciente).
    install -Dm600 "$srcdir/filebeat.yml" "$pkgdir/etc/filebeat/filebeat.yml"

    # Directorio de certificados: 500 es lo que documenta Wazuh y lo que deja
    # el despliegue de certs, asi coincide con el estado en disco y pacman no
    # avisa de permisos divergentes en cada reinstalacion.
    install -dm500 "$pkgdir/etc/filebeat/certs"

    # Set systemd service file perms
    chmod 644 $pkgdir/usr/lib/systemd/system/filebeat.service
}
