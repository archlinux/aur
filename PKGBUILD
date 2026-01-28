# Maintainer: MiguVT <contacto@miguvt.com>
# Contributor: dakataca <🐬danieldakataca@gmail.com>
# Contributor: Cristophero <cristophero.alvarado@gmail.com>

pkgname=pseint-bin
_pkgname=${pkgname%-*}
pkgver=20250314
pkgrel=2
pkgdesc='Tool to learn the basics of programming using a simple and intuitive pseudolanguage in Spanish'
arch=('x86_64')
url='http://pseint.sourceforge.net'
license=('GPL2')
conflicts=("$_pkgname")
makedepends=('rsync')
depends=('wxwidgets-gtk3')
noextract=(creator.psz)
source=("$_pkgname-$pkgver.tgz::https://cfhcable.dl.sourceforge.net/project/$_pkgname/$pkgver/$_pkgname-l64-$pkgver.tgz")
sha256sums=('871312634da8e1a0e45b0badbdcb8a0e67dbe51e4bf8cf5fe3ff37fd9817191b')

# Función 'prepare': Prepara el entorno antes de compilar/empaquetar el paquete.
prepare() {
    cd $_pkgname
    cat > $_pkgname.desktop << EOF
[Desktop Entry]
Version=$pkgver-$pkgrel
Type=Application
Name=PSeInt PSeudocode Interpreter.
Name[es]=PSeInt PSeudocódigo Intérprete.
GenericName=PSeInt
Comment=Tool to learn the basics of programming using a simple and intuitive pseudolanguage in Spanish.
Comment[es]=Herramienta para aprender las bases de la programación usando un simple e intuitivo pseudolenguaje en español.
Exec=/opt/$_pkgname %F
Icon=$_pkgname
Terminal=false
Categories=Development;Education;
EOF
}

# Función 'pkgver': Devuelve la versión del paquete.
pkgver(){
    cd $_pkgname
    cat version
}

# Función 'package': Empaqueta los archivos compilados en el paquete final.
package(){
    cd $_pkgname

    # Crear el directorio de destino y copiar en él, el contenido de pseint-bin.
    rsync -a . --mkpath "$pkgdir/opt/$_pkgname/"

    # Instala el archivo .desktop en la ubicación (-t) adecuada.
    install -Dvm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"

    # Instalar icono de pseint-bin.
    install -Dvm644 "imgs/icon.icns" "$pkgdir/usr/share/pixmaps/$_pkgname.icns"

    # Crea un archivo ejecutable en la ubicación /usr/bin/$_pkgname que ejecuta el programa wxPSeInt(pseint).
    install -Dvm755 <(echo -e '#!/usr/bin/env bash\n/opt/pseint/wxPSeInt') $pkgdir/usr/bin/$_pkgname
}