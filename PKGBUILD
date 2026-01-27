pkgname=fileman-git
pkgver=b2dcb46
pkgrel=1
pkgdesc="A Java/Swing basic File Manager (development version)"
arch=('any')
url="https://github.com/javadev/file-manager"
license=('MIT')
depends=('java-runtime')
makedepends=('git' 'maven')
provides=('fileman')
conflicts=('fileman-bin')
source=("git+https://github.com/javadev/file-manager.git")
md5sums=('SKIP')

pkgver() {
    cd file-manager
    git describe --always | sed 's/-/./g'
}

prepare() {
    cd file-manager
}

build() {
    cd file-manager
    mvn package
}

package() {
    cd file-manager

    #jar
    install -Dm644 filemanager.jar "$pkgdir/usr/share/fileman/fileman.jar"

    #launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/fileman" << 'EOF'
#!/bin/sh
exec java -jar /usr/share/fileman/fileman.jar "$@"
EOF

    #desktop
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/fileman.desktop" << EOF
[Desktop Entry]
Name=FileMan
Comment=Simple Java File Manager
Exec=fileman
Terminal=false
Type=Application
Categories=Utility;FileManager;
EOF
}
