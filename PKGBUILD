# Maintainer: Daniel Serrano <anabasasoft@gmail.com>
pkgname=visagevault
pkgver=1.6.16
pkgrel=1
pkgdesc="Gestor de fotografías inteligente con reconocimiento facial (Código Fuente)"
arch=('any') # 'any' porque es Python puro, corre en cualquier arquitectura
url="https://github.com/anabasasoft/visagevault"
license=('LGPL3')
provides=('visagevault')
conflicts=('visagevault' 'visagevault-bin')

# --- DEPENDENCIAS DEL SISTEMA (Traducción de tu requirements.txt a Arch) ---
# Nota: Algunas de estas están en los repos oficiales (extra) y otras en AUR.
# El usuario (o su helper como yay/paru) las resolverá automáticamente.
depends=(
    'python>=3.11'
    'pyside6'                     # <--- CAMBIO: Nombre oficial en Arch (repositorio 'extra')
    'python-numpy'                # Repositorio oficial
    'python-scikit-learn'         # Repositorio oficial
    'python-opencv'               # Repositorio oficial
    'python-pillow'               # Repositorio oficial
    'python-requests'             # Repositorio oficial
    'python-watchdog'             # Repositorio oficial
    'python-piexif'               # AUR
    'python-google-auth-oauthlib' # AUR
    'python-google-api-python-client' # AUR
    'python-rawpy'                # AUR
    'python-face_recognition'     # AUR
)
makedepends=('git') # Necesario para descargar

# Descargamos el código fuente directamente del Tag de GitHub
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anabasasoft/visagevault/releases/download/v${pkgver}/visagevault-${pkgver}.tar.gz")

# Generar checksums con 'updpkgsums' antes de subir, o usar SKIP para desarrollo
sha256sums=('08a59144b65863a7c8c76eb26d06e96bef21acd95e08558b06fbc3b1aa68ff46')

# No hay función build() porque Python no se "compila" en binario,
# pero podemos pre-compilar el bytecode para que arranque más rápido.
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m compileall -b .
}

package() {
    # Entramos en la carpeta descomprimida del código fuente
    cd "${srcdir}/${pkgname}-${pkgver}"

    # 1. Crear directorios
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    # 2. Instalar código fuente
    cp -r *.py *.pyc visagevault.png "${pkgdir}/usr/share/${pkgname}/"

    # 3. Crear lanzador
    echo "#!/bin/sh" > "${pkgdir}/usr/bin/visagevault"
    echo "exec python /usr/share/${pkgname}/visagevault.py \"\$@\"" >> "${pkgdir}/usr/bin/visagevault"
    chmod 755 "${pkgdir}/usr/bin/visagevault"

    # 4. Instalar Icono (CORREGIDO: Lo coge de la carpeta actual, que es el código fuente)
    install -Dm644 visagevault.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    # 5. Instalar Desktop Entry
    cat <<EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Name=VisageVault
Comment=Gestor Inteligente de Fotos y Videos
Exec=visagevault
Icon=visagevault
Type=Application
Categories=Graphics;Photography;
Terminal=false
StartupNotify=true
Keywords=Photography;Image;Video;Face;Recognition;Drive;Vault;
EOF
    chmod 644 "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
