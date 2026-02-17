pkgname=spackit
pkgver=1.4
pkgrel=1
pkgdesc="Kit de herramientas y alias personalizados"
arch=('any')
url="https://github.com/Jeicobroot-jrt/Spackit"
license=('MIT')
depends=('python' 'bash' 'git')
source=("git+${url}.git"
        "setup_aliases.sh")
sha256sums=('SKIP'
            '0db91cbd7396a71578f8b170b1d74713ab7a01eb7cdf605ac1cd4ff0ab0ca20d')

package() {
    # 1. Creamos las carpetas de destino
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/usr/bin"

    # 2. EL MISIL: Busca el main.py y el __init__.py donde sea que estén y los copia
    # Buscamos la carpeta que contiene el código real
    local REAL_SRC=$(find "${srcdir}/Spackit" -name "main.py" -printf '%h' -quit)
    
    if [ -n "$REAL_SRC" ]; then
        echo "--> Código encontrado en: $REAL_SRC"
        cp -r "$REAL_SRC/"* "${pkgdir}/usr/share/${pkgname}/"
    else
        echo "--> ERROR: No se encontró main.py" && exit 1
    fi

    # 3. Creamos el lanzador limpio (Bash)
    echo -e "#!/bin/bash\npython /usr/share/${pkgname}/main.py \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"

    # 4. Instalamos los alias automáticos
    install -Dm644 "${srcdir}/setup_aliases.sh" "${pkgdir}/etc/profile.d/spackit.sh"
}
