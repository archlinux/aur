# Maintainer: Uthopik <josearrillaga@ik.me>
pkgname=morinus-astrology-git
pkgver=8.2.0
pkgrel=1
pkgdesc="An easy to use, highly accurate astrology program"
arch=('any')
url="https://github.com/Uthopik/morinus-astrology"
license=('GPL-3.0-only') 
depends=('python-wxpython' 'python-pillow' 'pyswisseph')
makedepends=('git' 'python-setuptools')
source=("git+${url}.git"
        "morinus.desktop")
sha256sums=('SKIP'
            '525efa8b767513dc4cfb04efc9f28ae61e89e21c46b11b8daaf6b76fa3ed6f5d')

package() {
  cd "$srcdir/${pkgname%-git}"

  # 1. Instalamos la "Copia Maestra" en el sistema (Solo lectura)
  # Esto sirve para que el sistema sepa que el programa existe
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r * "$pkgdir/usr/share/$pkgname/"

  # 2. Icono y Desktop
  install -Dm644 "morinus.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/morinus.svg"
  install -Dm644 "$srcdir/morinus.desktop" "$pkgdir/usr/share/applications/morinus.desktop"

  # 3. Lanzador "Copiador" (La solución que buscas)
  install -dm755 "$pkgdir/usr/bin"
  printf "#!/bin/sh
MORINUS_HOME=\$HOME/.morinus

# Si no existe en el Home, lo copiamos TODO de una vez
if [ ! -d \"\$MORINUS_HOME\" ]; then
    mkdir -p \"\$MORINUS_HOME\"
    cp -r /usr/share/$pkgname/* \"\$MORINUS_HOME/\"
    # Damos permisos de escritura al usuario sobre toda SU carpeta
    chmod -R u+w \"\$MORINUS_HOME/\"
fi

# Ejecutamos directamente desde el Home
cd \"\$MORINUS_HOME\"
exec /usr/bin/python3 morinus.py \"\$@\"" > "$pkgdir/usr/bin/morinus"

  chmod +x "$pkgdir/usr/bin/morinus"

  # 5. Instalar el archivo de licencia en la ruta oficial de Arch
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}