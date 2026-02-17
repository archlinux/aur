pkgname=spackit
pkgver=1.3
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
    # 1. Crear las carpetas necesarias en la raíz del sistema (pkgdir)
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/usr/bin"

    # 2. Copiar tu código de Python a /usr/share/spackit
    cp -r "${srcdir}/Spackit/"* "${pkgdir}/usr/share/${pkgname}/"

    # 3. AQUÍ ESTÁ EL TRUCO: Escribir el nuevo lanzador limpio
    # El comando 'echo' crea el archivo desde cero, borrando lo anterior
    echo -e "#!/bin/bash\npython /usr/share/${pkgname}/main.py \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
    
    # 4. Darle el permiso de ejecución (el +x)
    chmod +x "${pkgdir}/usr/bin/${pkgname}"

    # 5. Instalar los alias automáticos
    install -Dm644 "${srcdir}/setup_aliases.sh" "${pkgdir}/etc/profile.d/spackit.sh"
}
