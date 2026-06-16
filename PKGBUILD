# Maintainer: Paolo Mezzano Barahona <pmezzano@gmail.com>
pkgname=jisocreator-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Herramienta para crear archivos ISO (versión binaria)"
arch=('x86_64')
url="https://github.com/Cavallinux/jisocreator"
license=('GPL3')
depends=('java-runtime>=21' 'gtk3>=3.24.52-1.1')
provides=('jisocreator')
conflicts=('jisocreator')
source=("https://github.com/Cavallinux/jisocreator/releases/download/v${pkgver}/jisocreator-${pkgver}-gtk.linux.x86_64.zip"
        "jisocreator.desktop")
sha256sums=('aec1c2e0b097e476ca077aee30b7e4748e1c86195b3b92b8ad4d79e4efd406af'
            '90777606d96171becf2a35fee41e86a39b8a8b45fb8f50e2e0614b1769b29138')

package() {
    install -d "${pkgdir}/opt/jisocreator"
    install -d "${pkgdir}/usr/bin"
    cp -r "${srcdir}/lib" "${pkgdir}/opt/jisocreator/"
    install -m644 "${srcdir}/jisocreator.jar" "${pkgdir}/opt/jisocreator/"
    cat <<EOF > "${pkgdir}/usr/bin/jisocreator"
#!/bin/sh
cd /opt/jisocreator

LOG_DIR="\${XDG_CACHE_HOME:-\$HOME/.cache}/jisocreator/logs"

exec java -Dpath.logs="\$LOG_DIR" \
          --add-opens java.base/java.util=ALL-UNNAMED \
          --enable-native-access=ALL-UNNAMED \
          -jar jisocreator.jar "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/jisocreator"
    install -Dm644 "${srcdir}/jisocreator.desktop" "${pkgdir}/usr/share/applications/jisocreator.desktop"
}
