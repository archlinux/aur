# Maintainer: Daniel Serrano <dani.eus79@gmail.com>
pkgname=visagevault
pkgver=1.6.8
pkgrel=1
pkgdesc="Gestor de fotografías inteligente con reconocimiento facial (Código Fuente)"
arch=('any') # 'any' porque es Python puro, corre en cualquier arquitectura
url="https://github.com/danitxu79/visagevault"
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danitxu79/visagevault/archive/refs/tags/v${pkgver}.tar.gz")

# Generar checksums con 'updpkgsums' antes de subir, o usar SKIP para desarrollo
sha256sums=('b2105141e07078f5053eab6871f3bacf7417907ed81106b5f91ff1c24f916a11')

# No hay función build() porque Python no se "compila" en binario,
# pero podemos pre-compilar el bytecode para que arranque más rápido.
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m compileall -b .
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # 1. Crear directorios de sistema
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    # 2. Instalar el código fuente y recursos
    # Copiamos todos los .py y .pyc (compilados) y la imagen
    cp -r *.py *.pyc visagevault.png "${pkgdir}/usr/share/${pkgname}/"

    # Copiar carpetas auxiliares si las tienes (face_recognition_models se instala via dependencia sistema,
    # pero si tienes carpetas locales, añádelas aquí)

    # 3. Crear el script lanzador en /usr/bin
    # Este script arranca la app usando el python del sistema
    echo "#!/bin/sh" > "${pkgdir}/usr/bin/visagevault"
    echo "exec python /usr/share/${pkgname}/visagevault.py \"\$@\"" >> "${pkgdir}/usr/bin/visagevault"
    chmod 755 "${pkgdir}/usr/bin/visagevault"

    # 4. Instalar Icono
    install -Dm644 visagevault.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    # 5. Instalar Desktop Entry (Acceso directo)
    # Lo generamos al vuelo para no depender de un archivo externo en el source
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
EOF
    chmod 644 "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
