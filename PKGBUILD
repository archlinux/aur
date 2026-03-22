# Maintainer: tu-usuario <tu@email.com>
#
# rubrika — Firma digital de PDFs con DNIe
# https://github.com/tu-usuario/rubrika

pkgname=rubrika
pkgver=1.0.0
pkgrel=1
pkgdesc="Firma digital de PDFs con DNIe o certificado .p12 — interfaz nativa KDE"
arch=('any')
url='https://github.com/tu-usuario/rubrika'
license=('GPL3')
depends=(
    # ── Sistema ──────────────────────────────────────────────────────────────
    'opensc'                    # librería PKCS#11 para DNIe (/usr/lib/opensc-pkcs11.so)
    'ccid'                      # driver para lectores de tarjeta USB
    'pcsclite'                  # demonio PC/SC para comunicación con el lector

    # ── Certificados (nuestro paquete) ────────────────────────────────────────
    'rubrika-certificates'

    # ── Python — repos oficiales ──────────────────────────────────────────────
    'python'
    'python-pymupdf'            # renderizado de páginas PDF como imágenes
    'python-python-pkcs11'      # interfaz PKCS#11 para el DNIe
    'python-pillow'             # procesado de imagen para la rúbrica
    'python-pyside6'            # interfaz gráfica nativa Qt/KDE
    'python-asn1crypto'         # extracción del nombre del certificado X.509
    'python-numpy'              # conversión de pixels en la rúbrica

    # ── Python — AUR ──────────────────────────────────────────────────────────
    'python-pyhanko'            # motor de firma PDF/PAdES
    # python-pyhanko-certvalidator se instala como dependencia de python-pyhanko
)
optdepends=(
    'qt6-style-breeze: tema Breeze nativo de KDE'
    'xdg-utils: abrir el PDF firmado desde la aplicación'
)
install=rubrika.install
source=(
    "rubrika-${pkgver}.tar.gz::https://github.com/vrieraj/rubrika/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('1845873bb5418d939c58cf22788301caf8ff958052a9f784c2a0612abccfc3f2')   # actualizar con el hash real al publicar en el AUR

package() {
    cd "rubrika-${pkgver}"

    # ── Archivos principales ──────────────────────────────────────────────────
    install -Dm644 main.py  "${pkgdir}/usr/share/rubrika/main.py"
    install -Dm644 utils.py "${pkgdir}/usr/share/rubrika/utils.py"

    # ── Wrapper ejecutable ────────────────────────────────────────────────────
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/rubrika" << 'EOF'
#!/bin/bash
exec python /usr/share/rubrika/main.py "$@"
EOF

    # ── Entrada en el menú de aplicaciones ───────────────────────────────────
    install -Dm644 rubrika.desktop \
        "${pkgdir}/usr/share/applications/rubrika.desktop"

    # ── Icono ─────────────────────────────────────────────────────────────────
    install -Dm644 rubrika.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/rubrika.svg"

    # ── Documentación ─────────────────────────────────────────────────────────
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/rubrika/README.md"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/rubrika/LICENSE"
}
