# Maintainer: AnabasaSoft <tu_correo@ejemplo.com>
pkgname=fastfetch-configurator
pkgver=1.2
pkgrel=1
pkgdesc="Herramienta gráfica para crear, editar y visualizar configuraciones de Fastfetch"
arch=('any')
url="https://github.com/AnabasaSoft/fastfetch-configurator"
license=('GPL3')
depends=('python' 'python-pyqt6' 'python-pillow' 'python-ansi2html' 'fastfetch')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AnabasaSoft/fastfetch-configurator/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('205c9bc44d7717734e62ef163daf685754d822d621098a2e79ad609136dd51d6')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # 1. Crear el directorio principal de la aplicación en el sistema
    install -dm755 "$pkgdir/usr/share/$pkgname"

    # 2. Copiar el script de Python y el icono en crudo
    install -Dm644 main.py "$pkgdir/usr/share/$pkgname/main.py"
    install -Dm644 icono.png "$pkgdir/usr/share/$pkgname/icono.png"

    # 3. Crear el script lanzador en /usr/bin al vuelo
    install -dm755 "$pkgdir/usr/bin"
    cat <<EOF > "$pkgdir/usr/bin/fastfetch-config"
#!/bin/bash
exec python /usr/share/$pkgname/main.py "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/fastfetch-config"

    # 4. Instalar el icono para el sistema global
    install -Dm644 icono.png "$pkgdir/usr/share/pixmaps/fastfetch-configurator.png"

    # 5. Generar e instalar el archivo .desktop al vuelo
    install -dm755 "$pkgdir/usr/share/applications"
    cat <<EOF > "$pkgdir/usr/share/applications/fastfetch-configurator.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=Fastfetch Configurator
Comment=Herramienta gráfica para crear, editar y visualizar configuraciones de Fastfetch
Exec=fastfetch-config
Icon=fastfetch-configurator
Terminal=false
Categories=System;Utility;Settings;
EOF
}
