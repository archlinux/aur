# Maintainer: Jesus Martin Ortega Martinez (madara125) <martin.ortega.arashi@gmail.com><jortega@condorbs.net>
# Contributor: Kevin Muñoz (MrHacker) <kmunoz@condorbs.net><david.munozm@proton.me>
pkgname=wazuh-agent
pkgver=4.11.2
_remRevision=2
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
  'var/ossec/etc/client.keys'
  'var/ossec/etc/local_internal_options.conf'
  'var/ossec/etc/ossec.conf'
)

sha512sums_x86_64=('2affe119f8d9429dbf2ca97fb216d54e830830ce5b6947788a48a33dc83a1fd5d324da690ba0200b7158a310b3968fe36b07c6ce7f77dff9baa6dc7f52277d79')
sha512sums_aarch64=('a6e3a34a641accbd2dafe4fc5e1bef45d24e949fe712e748ebd8aa0192798613990bfd3dd0e71012b362120bd5a6f4ad07399bb481ae153fe871031365b5309d')

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
