# Maintainer: Nathan Chere <aur at nathanchere dot com dot au>
pkgname=forge-gui-desktop
pkgver=2.0.06
pkgrel=2
pkgdesc="Implementation of Magic the Gathering that lets you play against a computer AI"
arch=('any')
url="https://github.com/Card-Forge/forge"
license=('GPL3')
depends=('jre17-openjdk')
source=("https://github.com/Card-Forge/forge/releases/download/forge-$pkgver/forge-installer-$pkgver.tar.bz2"
	"https://github.com/Card-Forge/forge/raw/e16a80e822dd040cc6c768152f3493eb4f2ce09a/AppIcon.png")
sha1sums=('aa07a73870fbfdc8a6d8b4c6249e85bc978a8d47'
          '9a957969da65cf281ceb31a3737bb3b8b799f14b')

package() {
	cd "$srcdir"
	install -d -m0755 "$pkgdir"/usr/share/$pkgname/res
	tar xf forge-installer-$pkgver.tar.bz2
	cp -r res/* "$pkgdir"/usr/share/$pkgname/res
	install -Dm0664 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm0644 "$srcdir"/AppIcon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
	
	# Install all JAR files
	install -Dm0644 "forge-gui-desktop-$pkgver-jar-with-dependencies.jar" "$pkgdir"/usr/share/java/$pkgname.jar
	install -Dm0644 "forge-gui-mobile-dev-$pkgver-jar-with-dependencies.jar" "$pkgdir"/usr/share/java/forge-adventure.jar
	install -Dm0644 "adventure-editor-jar-with-dependencies.jar" "$pkgdir"/usr/share/java/forge-adventure-editor.jar
	
	# Desktop GUI launcher
  	_deskfile="$pkgdir/usr/share/applications/$pkgname.desktop"
	_startfile="$pkgdir/usr/bin/$pkgname.sh"
  	install -Dm0644 /dev/stdin "$_deskfile"<<END
[Desktop Entry]
Name=Forge Desktop
Comment=$pkgdesc
Exec=/usr/bin/$pkgname.sh
Terminal=false
Type=Application
Categories=Game;
Keywords=mtg magic gathering
Icon=$pkgname
END

  	install -Dm0755 /dev/stdin "$_startfile"<<END
#!/bin/sh
cd "/usr/share/$pkgname"
exec /usr/bin/java -Xmx4096m -Dio.netty.tryReflectionSetAccessible=true -Dfile.encoding=UTF-8 -jar '/usr/share/java/$pkgname.jar' "\$@"
END

	# Adventure Mode launcher
	_adv_deskfile="$pkgdir/usr/share/applications/forge-adventure.desktop"
	_adv_startfile="$pkgdir/usr/bin/forge-adventure.sh"
  	install -Dm0644 /dev/stdin "$_adv_deskfile"<<END
[Desktop Entry]
Name=Forge Adventure Mode
Comment=Forge Adventure Mode - Shandalar reimplementation
Exec=/usr/bin/forge-adventure.sh
Terminal=false
Type=Application
Categories=Game;
Keywords=mtg magic gathering adventure shandalar
Icon=$pkgname
END

  	install -Dm0755 /dev/stdin "$_adv_startfile"<<END
#!/bin/sh
cd "/usr/share/$pkgname"
exec /usr/bin/java -Xmx4096m --add-opens java.desktop/java.beans=ALL-UNNAMED --add-opens java.desktop/javax.swing.border=ALL-UNNAMED --add-opens java.desktop/javax.swing.event=ALL-UNNAMED --add-opens java.desktop/sun.swing=ALL-UNNAMED --add-opens java.desktop/java.awt.image=ALL-UNNAMED --add-opens java.desktop/java.awt.color=ALL-UNNAMED --add-opens java.desktop/sun.awt.image=ALL-UNNAMED --add-opens java.desktop/javax.swing=ALL-UNNAMED --add-opens java.desktop/java.awt=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-opens java.desktop/java.awt.font=ALL-UNNAMED --add-opens java.base/jdk.internal.misc=ALL-UNNAMED --add-opens java.base/sun.nio.ch=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.math=ALL-UNNAMED --add-opens java.base/java.util.concurrent=ALL-UNNAMED --add-opens java.base/java.net=ALL-UNNAMED -Dio.netty.tryReflectionSetAccessible=true -Dfile.encoding=UTF-8 -jar '/usr/share/java/forge-adventure.jar'
END

	# Adventure Editor launcher
	_editor_startfile="$pkgdir/usr/bin/forge-adventure-editor.sh"
  	install -Dm0755 /dev/stdin "$_editor_startfile"<<END
#!/bin/sh
cd "/usr/share/$pkgname"
exec /usr/bin/java -Xmx4096m -jar '/usr/share/java/forge-adventure-editor.jar'
END
}
