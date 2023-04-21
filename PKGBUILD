# Maintainer: Vitaly Ankh <vr@vitalyr.com>
# Maintainer of digital: Ryozuki <ryo@ryozuki.xyz>
#
# This is an adapted version of Ryozuki's `digital` AUR package.
# Thanks to Ryozuki.
################################################################

pkgname=digital-git
pkgver=v0.30.r6.gaa9c14270
pkgrel=1
pkgdesc="A digital logic designer and circuit simulator. Git development version"
arch=('x86_64')
url="https://github.com/hneemann/Digital"
license=('GPL')
depends=('java-runtime')
makedepends=('git' 'maven' 'java-runtime')
provides=('digital')
conflicts=('digital')
replaces=('digital')
source=("digital-git::git+https://github.com/hneemann/Digital.git")
sha256sums=('SKIP')

jar_name=Digital.jar
executable_name=digital
################################################################
pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    echo -e "[Desktop Entry]\nType=Application\nVersion=1.0\nName=Digital\nComment=A digital logic designer and circuit simulator.\nExec=digital\nTerminal=false\nCategories=Education;Java;" > "$srcdir/$executable_name.desktop"

	# echo -e "#!/usr/bin/env bash\njava -jar /usr/share/java/$pkgname/$pkgname.jar \$@" > "$srcdir/$excutable_name.sh"
    # don't use imagemagick to convert, use the icons provided by the developer
	# for SIZE in 16 32 48 128 256 512
	# do
	    # convert "$srcdir/Digital/icon.svg" -resize ${SIZE}x${SIZE} "$srcdir/digital_${SIZE}x${SIZE}.png"
	# done
}

build() {
    cd "$srcdir/digital-git"
    mvn install
}


package() {
    TARGET_DIR="$srcdir/digital-git/target"
    # echo -e "#!/bin/bash\n DIR=\"$( cd \"$( dirname \"$( realpath \"${BASH_SOURCE[0]}\" )\" )\" >/dev/null && pwd )\"\n java -jar $DIR/Digital.jar \"$1\" " > "$srcdir/digital.sh"
    
	install -vDm644 "$TARGET_DIR/docu/Documentation_en.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_en.pdf"
	install -vDm644 "$TARGET_DIR/docu/Documentation_de.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_de.pdf"
	install -vDm644 "$TARGET_DIR/docu/Documentation_pt.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_pt.pdf"
    install -vDm644 "$TARGET_DIR/docu/Documentation_zh.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_zh.pdf"
    install -vDm644 "$TARGET_DIR/docu/Documentation_es.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_es.pdf"
    install -vDm644 "$TARGET_DIR/docu/Documentation_fr.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_fr.pdf"
	install -vDm644 "$TARGET_DIR/$jar_name" "$pkgdir/usr/share/java/$pkgname/$jar_name"
    cp -dr --no-preserve=ownership "$srcdir/digital-git/src/main/dig/lib" "$pkgdir/usr/share/java/$pkgname/lib/"

	# cp -dr --no-preserve=ownership "$srcdir/Digital/examples/" "$pkgdir/usr/share/java/$pkgname/examples/"
	install -vDm644 "$srcdir/$executable_name.desktop" "$pkgdir/usr/share/applications/$pkgname/$executable_name.desktop"
    install -vDm644 "$srcdir/digital-git/distribution/ReleaseNotes.txt" "$pkgdir/usr/share/doc/$pkgname/changelog.txt"
    
    echo -e "#!/bin/env bash\njava -jar /usr/share/java/$pkgname/$jar_name \$@"  > "$srcdir/$executable_name.sh"
	install -vDm755 "$srcdir/$executable_name.sh" "$pkgdir/usr/bin/digital"
	for SIZE in 32 48 64 128
	do
	    install -vDm644 "$srcdir/digital-git/src/main/resources/icons/icon${SIZE}.png" "$pkgdir/usr/share/icons/hicolor/${SIZE}x${SIZE}/digital.png"
	done
}
