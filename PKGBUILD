# Maintainer: AnabasaSoft <tu_correo@ejemplo.com>
pkgname=fastfetch-configurator
pkgver=1.1
pkgrel=3
pkgdesc="Herramienta gráfica para crear, editar y visualizar configuraciones de Fastfetch"
arch=('x86_64')
url="https://github.com/AnabasaSoft/fastfetch-configurator"
license=('GPL3')
depends=('fastfetch')
makedepends=('pyinstaller' 'python-pyqt6' 'python-pillow')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AnabasaSoft/fastfetch-configurator/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4244c51652f64846b05ee2c5c94392ac8d37c8d243e770493fe3126484bd1179')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Creamos un entorno virtual que pueda ver PyQt6 y Pillow instalados en el sistema
    python -m venv --system-site-packages venv
    source venv/bin/activate

    # Instalamos pyinstaller localmente para que sea capaz de "ver" ansi2html
    pip install pyinstaller ansi2html

    # Compilamos el binario (ahora usará el pyinstaller local del venv)
    pyinstaller --noconsole --onefile --icon=icono.png --add-data "icono.png:." --name fastfetch-config main.py

    deactivate
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Instalar el binario ejecutable
    install -Dm755 "dist/fastfetch-config" "$pkgdir/usr/bin/fastfetch-config"
    
    # Instalar el icono en el sistema para que el .desktop lo encuentre
    install -Dm644 "icono.png" "$pkgdir/usr/share/pixmaps/fastfetch-configurator.png"
    
    # Generar e instalar el archivo .desktop al vuelo
    mkdir -p "$pkgdir/usr/share/applications"
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
