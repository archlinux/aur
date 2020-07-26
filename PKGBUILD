# Maintainer: Vitaly Ankh <vitalyankh@gmail.com>
# Maintainer of digital: Ryozuki <ryo@ryozuki.xyz>
# This is an adapted version of Ryozuki's `digital` AUR package.
# Thanks to Ryozuki.
################################################################

pkgname=digital-git
pkgver=.3814
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
source=("digital-git::git://github.com/hneemann/Digital.git")
sha256sums=('SKIP')

jar_name=Digital.jar
executable_name=digital
################################################################
pkgver() {
  cd "$srcdir/digital-git"

  printf "%s.%s" \
    "$(grep AC_INIT configure.ac | \
    sed -e 's/^.\+\ \([0-9]\+\.[0-9]\+\.[0-9]\+\?\).\+$/\1/')" \
    "$(git rev-list --count HEAD)"
}

prepare() {
   
    echo -e "[Desktop Entry]\nType=Application\nVersion=1.0\nName=Digital\nComment=A digital logic designer and circuit simulator.\nExec=digital\nTerminal=false\nCategories=Education;Java;" > "$srcdir/$executable_name.desktop"
	echo -e "#!/usr/bin/env bash\njava -jar /usr/share/java/$pkgname/$jar_name \$@" > "$srcdir/$executable_name.sh"
}

build(){
    cd "$srcdir/digital-git"
    mvn install
}

package() {
    TARGET_DIR="$srcdir/digital-git/target"
    # echo -e "#!/bin/bash\n DIR=\"$( cd \"$( dirname \"$( realpath \"${BASH_SOURCE[0]}\" )\" )\" >/dev/null && pwd )\"\n java -jar $DIR/Digital.jar \"$1\" " > "$srcdir/digital.sh"
    # echo -e "#!/bin/env bash\njava -jar $TARGET_DIR/Digital.jar \$@\" " > "$srcdir/digital.sh"
	install -vDm644 "$TARGET_DIR/docu/Documentation_en.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_en.pdf"
	install -vDm644 "$TARGET_DIR/docu/Documentation_de.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_de.pdf"
	install -vDm644 "$TARGET_DIR/docu/Documentation_pt.pdf" "$pkgdir/usr/share/doc/$pkgname/documentation_pt.pdf"
	# install -vDm644 "$TARGET_DIR/ReleaseNotes.txt" "$pkgdir/usr/share/doc/$pkgname/changelog.txt"
	install -vDm644 "$TARGET_DIR/$jar_name" "$pkgdir/usr/share/java/$pkgname/$jar_name"
	install -vDm644 "$srcdir/$executable_name.desktop" "$pkgdir/usr/share/applications/$pkgname/$executable_name.desktop"
	install -vDm755 "$srcdir/$executable_name.sh" "$pkgdir/usr/bin/digital"
}