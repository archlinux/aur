# Maintainer: Daniel Serrano Armenta <anabasasoft@gmail.com>
pkgname=sentinelx
pkgver=1.4.3
pkgrel=1
pkgdesc="Tu Guardián de Red para Linux. Simple. Potente. Inteligente. (Compila desde fuente)"
arch=('x86_64')
url="https://github.com/AnabasaSoft/SentinelX"
license=('LGPL3')
provides=('sentinelx')
conflicts=('sentinelx' 'sentinelx-bin')

# Dependencias para EJECUTAR
depends=('python' 'polkit' 'clamav' 'hicolor-icon-theme')

# Dependencias necesarias solo para COMPILAR (Build)
makedepends=('git' 'python-pip' 'python-setuptools' 'base-devel')

# Descargamos el código fuente exacto de la versión
source=("git+https://github.com/AnabasaSoft/SentinelX.git#tag=v${pkgver}")
sha256sums=('41d05caebfa543fb58d765284bc66b9a123002cefa2b9b2702594b0f19004a78')

build() {
    cd "SentinelX"

    echo "📦 Creando entorno virtual temporal..."
    python -m venv venv
    source venv/bin/activate

    echo "⬇️ Instalando dependencias..."
    pip install --upgrade pip
    pip install -r requirements.txt
    pip install pyinstaller

    echo "🔨 Compilando binario..."
    # Usamos --onedir para que sea más rápido de arrancar en sistema
    pyinstaller --noconfirm \
        --onedir \
        --windowed \
        --name "SentinelX" \
        --add-data "SentinelX-Icon-512.png:." \
        --add-data "lang:lang" \
        --hidden-import "PySide6" \
        SentinelX.py
}

package() {
    cd "SentinelX"

    echo "📂 Instalando archivos en el sistema..."

    # 1. Copiar la carpeta compilada a /opt
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "dist/SentinelX/"* "${pkgdir}/opt/${pkgname}/"

    # 2. Enlace simbólico
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/SentinelX" "${pkgdir}/usr/bin/${pkgname}"

    # 3. Icono
    install -Dm644 "SentinelX-Icon-512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    # 4. Desktop Entry
    install -dm755 "${pkgdir}/usr/share/applications"
    cat << EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Name=SentinelX
Comment=Tu Guardián de Red para Linux
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Type=Application
Categories=System;Security;Network;
Terminal=false
EOF

    # 5. Instalar licencia
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
