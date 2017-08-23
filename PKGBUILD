# Maintainer: Ondřej Hruška <ondra@ondrovo.com>

pkgname=rpw

pkgver=4.4.0
pkgrel=1

# jar filename on dropbox
FNAME="ResourcePackWorkbench.jar"
# icon file in the jar
ICONFILE="icon-96.png"

pkgdesc="Minecraft resource pack editor by MightyPork"
arch=("any")
url="http://mcrpw.github.io/"
license=("RPW license")

# Gendesk entries
_name="RPW"
_genericname="Resource Pack Editor"
_comment="$pkgdesc"
_exec=("rpw")
_categories="Application;Development"

source=("https://github.com/mcRPW/rpw/releases/download/v4.4.0/$FNAME"
        "https://raw.githubusercontent.com/mcRPW/rpw/master/LICENSE.txt")

depends=('java-runtime')

optdepends=("gimp: Editing textures"
            "audacity: Editing sound files"
            "minecraft: Source of vanilla asset files (.minecraft folder)")

makedepends=("unzip"
	         "gendesk")

provides=("rpw")

md5sums=('804aa7850d427c4651d5536b19bd61ca'
         '604f46ee27f8c28ba680499f436b80b6')

prepare() {
	# extract icon as rpw.png
    unzip -o "$srcdir/$FNAME" "$ICONFILE"
    mv "$ICONFILE" "$pkgname.png"

	# build desktop file (categories field is ignored by gendesk - bug?)
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --categories="$_categories"

    # generate launcher
    echo -e "#!/bin/bash\nexec /usr/bin/java -jar '/usr/share/$pkgname/$FNAME' \"\$@\"\n" > "launcher.sh"
}

package() {
    # install license
    install -Dm 644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # install the JAR in /usr/share
    install -Dm 755 "$FNAME" "$pkgdir/usr/share/$pkgname/$FNAME"

    # Extract & install the icon
    install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # Install the desktop file
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # generate a launcher script
    install -Dm 755 "launcher.sh" "$pkgdir/usr/bin/rpw"
}
