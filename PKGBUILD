# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-agent
pkgver=4.12.0
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
);
optdepends=(
    'lsb-release'
);

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

sha512sums_x86_64=('d9dd42536b374cb61402d12ca86333f95c625e1b735bfec36dcb66fa2369bd06280e4d815775b330ed018718043edaac2a0f79ffa5128c3ad077be1aab82cfba')
sha512sums_aarch64=('15f853ba9c964639105b5435014166ba562d587791dd1ddbd4a25603513a9bb06d7e26c2601ae9d94e2af8530c2e23fb478cc08511a1b282b848ed3e5adc5433')

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
