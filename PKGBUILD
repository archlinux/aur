# Maintainer: Tracktark <zavodsky.richard1 at gmail dot com>

pkgname=bluej-fri
pkgver=4.2.2
pkgrel=1
pkgdesc="A custom version of the BlueJ Development Enviroment made for the University of Žilina"
arch=('any')
url="https://github.com/infjava/BlueJFRI"
license=('GPL2')
depends=('gtk2' 'archlinux-java-run' 'java-runtime=11' 'java-environment=11' 'java11-openjfx')
provides=('bluej=${pkgver}')
conflicts=("bluej")
source=("https://www.bluej.org/download/files/BlueJ-linux-${pkgver//.}.deb"
        "https://downloads.sourceforge.net/project/bluejcheckstyle/bluejcheckstyle/5.4-0/checkstyle-extension-5.4-0.jar"
        "BlueJFRI::git+$url"
        "bluej"
        "bluej.desktop"
        "default_checks.patch"
        "bluej.xml")
noextract=("BlueJ-linux-${pkgver//.}.deb"
           "checkstyle-extension-5.4-0.jar")
sha256sums=('5c2241f2208e98fcf9aad7c7a282bcf16e6fd543faa5fdb0b99b34d1023113c3'
            '48a36cba5b981385baa8dfb3034549b65e30e6f7261aae158c6d37c9bf590a02'
            'SKIP'
            'c1bdaad64fcf45b1efac00e010d5f750c417d64896cde80b9b7c5745277422b8'
            '47fa6f755cd0ec1b575b7029820f8fa8d7abb7413fa4709d053f120925edcc5f'
            '5a0e105134c36f1aa97e36462d734b7c05ba1db5efa2b372d38f23f1c6ac3a6f'
            'ca12278b71e4bd84875f10d24b74d1d24c51573825d796331d8a20794ce60c08')

prepare() {
          cd "$srcdir"
          ar p "BlueJ-linux-${pkgver//.}.deb" data.tar.xz | tar xJ
          patch --strip=1 < default_checks.patch
}

package() {
          cd "$srcdir"
          mkdir -p "$pkgdir/opt/bluej"
          mkdir -p "$pkgdir/usr/share/doc/bluej/examples"

          cp -r "usr/share/bluej" "$pkgdir/opt"
          cp -r usr/share/doc/BlueJ/*/ "$pkgdir/usr/share/doc/bluej/examples/"

          rm -R "$pkgdir/opt/bluej/english/templates"
          cp -r BlueJFRI/data/templates "$pkgdir/opt/bluej/english/templates"

          install -Dm755 bluej "$pkgdir/usr/bin/bluej"
          install -Dm644 bluej.desktop "$pkgdir/usr/share/applications/bluej.desktop"
          install -Dm644 bluej.xml "$pkgdir/usr/share/mime/packages/bluej.xml"
          install -Dm644 BlueJFRI/data/checkstyle/default_checks.xml "$pkgdir/opt/bluej/extensions/default_checks.xml"
          install -Dm644 checkstyle-extension-5.4-0.jar "$pkgdir/opt/bluej/extensions/checkstyle-extension-5.4-0.jar"
          install -Dm644 "usr/share/icons/hicolor/256x256/apps/bluej.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/bluej.png"
          install -Dm644 "usr/share/icons/hicolor/48x48/apps/bluej.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/bluej.png"
          install -Dm644 "usr/share/doc/BlueJ/README.TXT" "$pkgdir/usr/share/doc/bluej/README"
          install -Dm644 "usr/share/doc/BlueJ/LICENSE.txt" "$pkgdir/usr/share/licenses/bluej/LICENSE"
          install -Dm644 "usr/share/doc/BlueJ/THIRDPARTYLICENSE.txt" "$pkgdir/usr/share/licenses/bluej/THIRDPARTYLICENSE"
}
