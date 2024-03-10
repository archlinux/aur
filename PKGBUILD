# Maintainer: Alexis Williams <alexis@typedr.at>
pkgname=frink-lang-bin
pkgver=20240227
pkgrel=2
pkgdesc="A practical calculating tool and programming language."
arch=('any')
url="https://frinklang.org/"
license=('unknown')
depends=('bash' 'java-runtime')
makedepends=('awk' 'imagemagick' 'unzip')
optdepends=('rlwrap: readline support for the command-line shell')
source=(
	"$pkgname.jar::https://frinklang.org/frinkjar/frink.jar"
	"$pkgname-unitnames.txt::https://frinklang.org/frinkjar/unitnames.txt"
	"$pkgname-functionnames.txt::https://frinklang.org/frinkjar/functionnames.txt"
)
noextract=("${source[@]%%::*}")
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	unzip -l "$srcdir/$pkgname.jar" | awk '/META-INF\/MANIFEST.MF/ { gsub("-",""); print $2 }';
}

build() {
	unzip -p "$srcdir/$pkgname.jar" "data/icon.gif" > "$srcdir/$pkgname-icon.gif"
	convert "$srcdir/$pkgname-icon.gif" -interpolate Nearest -filter point -resize '512x512' "$srcdir/$pkgname-icon.png"
}

package() {


	mkdir -p "$pkgdir/usr/share/java/frink/";
	cp "$srcdir/$pkgname.jar" "$pkgdir/usr/share/java/frink/frink.jar";

	mkdir -p "$pkgdir/usr/share/frink/";
	cp "$srcdir/$pkgname-unitnames.txt" "$pkgdir/usr/share/frink/unitnames.txt";
	cp "$srcdir/$pkgname-functionnames.txt" "$pkgdir/usr/share/frink/functionnames.txt";

	mkdir -p "$pkgdir/usr/bin/"
	cat > "$pkgdir/usr/bin/frink" << 'EOF'
#!/bin/bash
CP=/usr/share/java/frink/frink.jar

rlwrap=$(command -v rlwrap)
rlwrap_args=""
if [ -n "${rlwrap}" ] 
then
	rlwrap_args="-f /usr/share/frink/unitnames.txt -b '$' -f /usr/share/frink/functionnames.txt"
fi

java_opts=(
	"-Dawt.useSystemAAFontSettings=on"
	"-Dswing.aatext=true"
	"-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
	"-Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
)

exec $rlwrap $rlwrap_args /usr/bin/java ${java_opts[*]} -cp $CP frink.gui.FrinkStarter "$@"
EOF
	chmod a+x "$pkgdir/usr/bin/frink"

	mkdir -p "$pkgdir/usr/share/icons/"
	cp "$srcdir/$pkgname-icon.png" "$pkgdir/usr/share/icons/frink.png"

	mkdir -p "$pkgdir/usr/share/applications/"
	cat > "$pkgdir/usr/share/applications/frink.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Version=1.0
Name=Frink
Comment=A practical calculating tool and programming language.
Exec=frink --gui
Icon=frink
Terminal=false
Categories=Utility;Science;Math;Calculator;Java
EOF
}
