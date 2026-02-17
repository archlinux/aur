# Maintainer: Jeicob <tu-email>
pkgname=spackit
pkgver=0.1.0
pkgrel=1
pkgdesc="Utilidad de sistema para Arch Linux"
arch=('any')
url="https://github.com/Jeicobroot-jrt/spackit"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

# Definimos las fuentes: el código de GitHub Y el archivo local de alias
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "setup_aliases.sh")

# Saltamos la verificación por ahora para que no te dé error de hash
sha256sums=('c79b8261d8c013b49940a1ad0619c3462f4ed9fb1ef67a3b0dd78412da564fa9'
            '0db91cbd7396a71578f8b170b1d74713ab7a01eb7cdf605ac1cd4ff0ab0ca20d')

build() {
    # Intentamos entrar a la carpeta (manejando posibles diferencias de mayúsculas)
    cd "${srcdir}/Spackit-${pkgver}" || cd "${srcdir}/spackit-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/Spackit-${pkgver}" || cd "${srcdir}/spackit-${pkgver}"
    
    # 1. Instalar el paquete Python
    python -m installer --destdir="$pkgdir" dist/*.whl

    # 2. Instalar el toolkit de alias
    # Usamos "${srcdir}/setup_aliases.sh" porque ahí es donde makepkg pone las fuentes extras
    install -Dm644 "${srcdir}/setup_aliases.sh" "${pkgdir}/usr/share/spackit/aliases.sh"
}
