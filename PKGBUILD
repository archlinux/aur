# Maintainer: Young Acinonyx <young dot acinonyx at gmail dot com>

pkgname=portugol-studio-bin
_pkgname=portugol-studio
pkgver=2.7.4
pkgrel=1
pkgdesc="Ambiente de Programação didático para a linguagem Portugol 2.0."
arch=('x86_64')
url="http://lite.acad.univali.br/portugol/"
license=('GPL')
source=("https://github.com/UNIVALI-LITE/Portugol-Studio/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x64-standalone.zip")
noextract=()
md5sums=('06ff5fc05064754a457ad99cd7d2a001')

prepare() {
	# Replace "Icon=/usr/local/portugol-studio..." with "Icon=portugol-studio" inside the desktop file
	sed -i 's/Icon=.*/Icon=portugol-studio/' "$srcdir/arquivos-auxiliares/$_pkgname.desktop"
}

package() {
	# Create the "/usr/bin" directory
	mkdir -p "$pkgdir/usr/bin"

	# Set the correct permissions
	chmod -R 755 "$srcdir/$_pkgname"
	find "$srcdir/$_pkgname" -type f -execdir chmod 644 "{}" \;
	find "$srcdir/$_pkgname/java/java-linux/bin" -type f -exec chmod 755 {} \;
	chmod 755 "$srcdir/$_pkgname/executar-console-linux.sh"
	chmod 755 "$srcdir/$_pkgname/executar-studio-linux.sh"

	# Link the shell executables to "/usr/bin"
	ln -s "$pkgdir/$_pkgname/executar-console-linux.sh" "$pkgdir/usr/bin/portugol-console"
	ln -s "$pkgdir/$_pkgname/executar-studio-linux.sh" "$pkgdir/usr/bin/$_pkgname"

	# Install the desktop file
	install -Dm644 "$srcdir/arquivos-auxiliares/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	# Install the icons
	install -Dm644 "$srcdir/portugol-studio/aplicacao/icones/linux/arquivo-por.png" "$pkgdir/usr/share/icons/hicolor/256x256/mimetypes/application-x-portugol.png"
	install -Dm644 "$srcdir/portugol-studio/aplicacao/icones/linux/portugol-studio.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/portugol-studio.png"

	# Install the mime type association xml
	install -Dm644 "$srcdir/arquivos-auxiliares/application-x-portugol.xml" "$pkgdir/usr/share/mime/packages/application-x-portugol.xml"

	# Copy the necessary files
	cp -R "$srcdir/$_pkgname" "$pkgdir/usr/share/"
}
