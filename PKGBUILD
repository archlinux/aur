# Maintainer: Daniel Serrano Armenta <dani.eus79@gmail.com>
pkgname=sentinelx-bin
_pkgname=sentinelx
pkgver=0.4.1
pkgrel=1
pkgdesc="Tu Guardián de Red para Linux. Simple. Potente. Inteligente."
arch=('x86_64')
url="https://github.com/danitxu79/SentinelX"
license=('LGPL3')
keywords=('firewall' 'gui' 'security' 'firewalld' 'ufw' 'clamav' 'antivirus' 'network' 'protection' 'manager' 'python' 'qt6')
provides=('sentinelx')
conflicts=('sentinelx')

# Dependencias vitales para ejecutar AppImages y aplicaciones gráficas
depends=('zlib' 'fuse2' 'hicolor-icon-theme' 'polkit')

# Aquí descargamos el AppImage directamente de tus releases de GitHub
# y el icono del código fuente para que se vea bonito en el menú
source=("https://github.com/danitxu79/SentinelX/releases/download/v${pkgver}/SentinelX-v${pkgver}-x86_64.AppImage"
        "https://raw.githubusercontent.com/danitxu79/SentinelX/main/SentinelX-Icon-512.png")

# Usamos SKIP para desarrollo rápido.
# Para publicar "de verdad", deberías generar los sha256sums con 'updpkgsums'
sha256sums=('1ac957f13b5d5e0bcb88aec7195688205e1b5d1540a384f53b9cc7b787d7ba72'
            'cef6978cd295b07bf81be4c1b5c6475fe8983fae9abdf6f5a03aefcea71c7fa3')

package() {
    # 1. Preparamos las carpetas de destino
    install -dm755 "${pkgdir}/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"

    # 2. Instalamos el AppImage en /opt (el lugar correcto para software externo)
    # Le damos permisos de ejecución (755)
    install -m755 "SentinelX-v${pkgver}-x86_64.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    # 3. Creamos el enlace simbólico en /usr/bin
    # Esto permite que el usuario escriba 'sentinelx' en la terminal y arranque
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # 4. Instalamos el Icono
    install -m644 "SentinelX-Icon-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    # 5. Creamos el archivo .desktop al vuelo
    # Esto hace que aparezca en el menú de inicio de KDE/GNOME
    cat << EOF > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Name=SentinelX
Comment=Tu Guardián de Red para Linux
Exec=/usr/bin/${_pkgname}
Icon=${_pkgname}
Type=Application
Categories=System;Security;Network;
Terminal=false
EOF
}
