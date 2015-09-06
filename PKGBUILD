# Maintainer: Ondřej Hruška <ondra@ondrovo.com>

pkgname=rpw

pkgver=4.3.0
pkgrel=3

# jar filename on dropbox
FNAME="RPW-4-3-0.jar"
# icon file in the jar
ICONFILE="icon-96.png"

pkgdesc="Minecraft resource pack editor by MightyPork"
arch=("any")
url="http://rpw.ondrovo.com/"
license=("RPW license")

# Gendesk entries
_name="RPW"
_genericname="Resource Pack Editor"
_comment="$pkgdesc"
_exec=("rpw")
_categories="Application;Development"

source=("https://dl.dropboxusercontent.com/u/64454818/RPW/$FNAME"
        "https://raw.githubusercontent.com/MightyPork/rpw/master/LICENSE.txt")

depends=('java-runtime')

optdepends=("gimp: Editing textures"
            "audacity: Editing sound files"
            "minecraft: Source of vanilla asset files (.minecraft folder)")

makedepends=("unzip"
	         "gendesk")

provides=("rpw")

md5sums=('314d5fe7db04ca774d59982d95f23024'
         '34ccc931e00e0e1354d2409159824290')

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
