# Maintainer: Nathan Chere <aur at nathanchere dot com dot au>
pkgname=forge-gui-desktop
pkgver=2.0.05
pkgrel=1
pkgdesc="Implementation of Magic the Gathering that lets you play against a computer AI"
arch=('any')
url="https://github.com/Card-Forge/forge"
license=('GPL3')
depends=('jre17-openjdk')
source=("https://github.com/Card-Forge/forge/releases/download/forge-$pkgver/forge-installer-$pkgver.tar.bz2"
	"https://github.com/Card-Forge/forge/raw/e16a80e822dd040cc6c768152f3493eb4f2ce09a/AppIcon.png")
sha1sums=('0d37e67558cdb19b47fc8f2fdc34fcddf78a5d40'
          '9a957969da65cf281ceb31a3737bb3b8b799f14b')

package() {
	cd "$srcdir"
	install -d -m0755 "$pkgdir"/usr/share/$pkgname/res
	tar xf forge-installer-$pkgver.tar.bz2
	cp -r res/* "$pkgdir"/usr/share/$pkgname/res
	install -Dm0664 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm0644 "$srcdir"/AppIcon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
	install -Dm0644 "forge-gui-desktop-$pkgver-jar-with-dependencies.jar" "$pkgdir"/usr/share/java/$pkgname.jar
  	_deskfile="$pkgdir/usr/share/applications/$pkgname.desktop"
	_startfile="$pkgdir/usr/bin/$pkgname.sh"
  	install -Dm0644 /dev/stdin "$_deskfile"<<END
[Desktop Entry]
Name=$pkgname
Comment=$pkgdesc
Exec=/usr/bin/$pkgname.sh
Terminal=false
Type=Application
Categories=Game;
Keywords=mtg magic gathering
Icon=$pkgname
END

  	install -Dm0644 /dev/stdin "$_startfile"<<END
#!/bin/sh
cd "/usr/share/$pkgname"
exec /usr/bin/java -Xmx1024m -jar '/usr/share/java/$pkgname.jar'
END
	chmod +x "$_startfile"
}
