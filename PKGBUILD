# Maintainer: Bent Hillerkus <benthillerkus+aur@gmail.com>

pkgrel=0
pkgver=3.3

pkgname=jetuml
_gitname=JetUML
_iconname=jet
_jarname=$_gitname-$pkgver
_installdirectory=/usr/share/java/$pkgname
_javaver=16
pkgdesc="A desktop application for fast UML diagramming"
changelog=CHANGELOG
arch=('any')
url="https://github.com/prmr/$_gitname"
license=('GPL3')
depends=("java-runtime-openjdk=$_javaver" 'java-openjfx')
makedepends=('gendesk')
source=("https://github.com/prmr/$_gitname/releases/download/v$pkgver/$_jarname.jar"
        "$pkgname.png::https://raw.githubusercontent.com/prmr/$_gitname/v$pkgver/icons/$_iconname.png")
noextract=("$_jarname.jar")
md5sums=('e79f44d3983cacd57d71003b7a551ff3'
         '3b8e71028b14563205716aeb592e0803')

prepare() {
    # Generate a runnable shell script
    echo "#!/bin/sh
/usr/bin/java --module-path $_installdirectory/lib --add-modules=javafx.controls,javafx.swing,java.desktop,java.prefs -jar $_installdirectory/$_jarname.jar" \
    > $pkgname

    # Generate a desktop entry
    # -f: forces and overrides the file if any
    # -n: do not download an icon
    # This tool assumes the icon has the same name as pkgname.
    # For categories see https://standards.freedesktop.org/menu-spec/latest/apa.html
    gendesk -f -n \
        --pkgname $pkgname \
        --pkgdesc "$pkgdesc" \
        --name $_gitname \
        --genericname "UML Diagrammer" \
        --comment "Create a new UML diagram" \
        --exec "/usr/bin/$pkgname" \
        --categories "Development;FlowChart;2DGraphics;ComputerScience,Java" \
        --mimetypes "application/jet"
}

package() {
    # Taking cues from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=asciidocfx

    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$_jarname.jar" "$pkgdir/$_installdirectory/$_jarname.jar"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # Workaround for FS#64121
    install -dm755 "$pkgdir/$_installdirectory/lib"
    cp -t "$pkgdir/$_installdirectory/lib" /usr/lib/jvm/java-$_javaver-openjdk/lib/javafx*
}
