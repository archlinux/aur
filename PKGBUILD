# Maintainer: Daniel Serrano Armenta (AnabasaSoft) <anabasasoft@gmail.com>
pkgname=sign-and-seal
pkgver=1.13
pkgrel=1
pkgdesc="Simple PDF Signer for Linux (Sign & Seal) - Compiled from source"
arch=('x86_64')
url="https://github.com/AnabasaSoft/SignAndSeal"
license=('LGPL3')
provides=('sign-and-seal')
conflicts=('sign-and-seal-bin')

# Dependencias mínimas del sistema para ejecutar el binario resultante
depends=('glibc' 'zlib' 'fuse2')

# Dependencias para compilar: Solo pedimos Python y Git.
# El resto lo bajaremos vía pip para evitar errores de pacman.
makedepends=('python' 'git')

source=("https://github.com/AnabasaSoft/SignAndSeal/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('962e9f8ef65012de2aadb4cbdce05ce1e45ae126df051fe883252991300e5345')

prepare() {
    cd "SignAndSeal-${pkgver}"

    # 1. Renombrar script si es necesario
    if [ -f "sign_and_seal_v2.py" ]; then
        mv sign_and_seal_v2.py sign_and_seal.py
    fi

    # 2. Generar .desktop al vuelo
    cat > sign-and-seal.desktop <<EOF
[Desktop Entry]
Name=Sign & Seal
Comment=Firmador de PDFs simple
Exec=/usr/bin/sign-and-seal
Icon=sign-and-seal
Type=Application
Categories=Office;Utility;
Terminal=false
EOF
}

build() {
    cd "SignAndSeal-${pkgver}"

    echo "--- Creando entorno virtual de compilación (aislado) ---"
    python -m venv build_env

    echo "--- Instalando dependencias de compilación con pip ---"
    # Usamos las rutas directas para no depender de 'source activate'
    ./build_env/bin/pip install --upgrade pip
    ./build_env/bin/pip install pyinstaller pymupdf PyQt6 Pillow

    echo "--- Compilando binario ---"
    # Llamamos al pyinstaller del entorno virtual
    ./build_env/bin/pyinstaller --clean --onefile --noconsole \
        --name "SignAndSeal" \
        --add-data "sign_and_seal_icon.png:." \
        sign_and_seal.py
}

package() {
    cd "SignAndSeal-${pkgver}"

    # 1. Instalar el binario generado
    install -Dm755 "dist/SignAndSeal" "${pkgdir}/usr/bin/sign-and-seal"

    # 2. Instalar el icono
    install -Dm644 "sign_and_seal_icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/sign-and-seal.png"

    # 3. Instalar el .desktop
    install -Dm644 "sign-and-seal.desktop" "${pkgdir}/usr/share/applications/sign-and-seal.desktop"
}
