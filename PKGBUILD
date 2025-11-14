pkgname=jivexdv-bin
pkgver=5.7_RC07
pkgrel=1
pkgdesc="JiveX DICOM Viewer"
arch=(any)
url="https://www.visus.com/en/downloads/jivex-dicom-viewer.html"
depends=(java-runtime bash)
makedepends=(7zip unzip)
options=(!strip)
source=(https://www.visus.com/fileadmin/content/pictures/Downloads/JiveX_DICOME_Viewer/SETUP_JiveXdv.exe)
sha256sums=('f2fe71052d25bb5a9bda8c2cc92b471e6ccebe5571aee0097c837e6a81637569')

package() {
	cd "$srcdir"
	rm -f install.jar tempJex.tar.gz
	7z e SETUP_JiveXdv.exe '*/*/install.jar'
	unzip install.jar tempJex.tar.gz
	mkdir -p "$pkgdir"/usr/share/jivexdv
	tar -C "$pkgdir"/usr/share/jivexdv -xf tempJex.tar.gz
	mkdir -p "$pkgdir"/usr/bin
	echo '#!/bin/bash' > "$pkgdir"/usr/bin/jivexdv
	chmod 755 "$pkgdir"/usr/bin/jivexdv
	echo 'cd /usr/share/jivexdv' >> "$pkgdir"/usr/bin/jivexdv
	echo 'exec java \' >> "$pkgdir"/usr/bin/jivexdv
	sed -ne "s,;,:,g;s,^ClassPath=\(.*\)\r\$,  -classpath '\\1' \\\\,p" "$pkgdir"/usr/share/jivexdv/DVStart.ini >> "$pkgdir"/usr/bin/jivexdv
	sed -ne 's/^JVMOptions=\(.*\)\r$/\1 \\/p' "$pkgdir"/usr/share/jivexdv/DVStart.ini >> "$pkgdir"/usr/bin/jivexdv
	sed -ne 's/^\([^#].*\..*=.*\)\r$/  -D\1 \\/p' "$pkgdir"/usr/share/jivexdv/DVStart.ini >> "$pkgdir"/usr/bin/jivexdv
	cat << 'EOT' >> "$pkgdir"/usr/bin/jivexdv
		--add-exports java.base/sun.reflect.misc=ALL-UNNAMED \
		--add-exports java.desktop/com.sun.java.swing.plaf.windows=ALL-UNNAMED \
		--add-exports java.desktop/sun.java2d=ALL-UNNAMED \
		--add-exports java.desktop/sun.awt=ALL-UNNAMED \
		--add-exports java.desktop/sun.swing=ALL-UNNAMED \
		--add-exports java.desktop/sun.awt.image=ALL-UNNAMED \
		--add-exports java.desktop/sun.awt.windows=ALL-UNNAMED \
		--add-exports java.desktop/sun.awt.shell=ALL-UNNAMED \
		--add-opens java.base/java.lang=ALL-UNNAMED \
		--add-opens java.desktop/javax.swing=ALL-UNNAMED \
		--add-opens java.desktop/javax.swing.plaf.basic=ALL-UNNAMED \
		--add-opens java.desktop/java.awt=ALL-UNNAMED \
		--add-opens java.desktop/java.awt.image=ALL-UNNAMED \
		--add-opens java.prefs/java.util.prefs=ALL-UNNAMED \
		--add-opens java.base/java.io=ALL-UNNAMED \
		--add-opens java.management/javax.management.openmbean=ALL-UNNAMED \
		--add-opens java.management/javax.management=ALL-UNNAMED \
		--add-exports java.base/sun.security.action=ALL-UNNAMED \
		--add-opens=java.base/java.util=ALL-UNNAMED \
		--add-opens=java.base/java.util.concurrent=ALL-UNNAMED \
		--add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED \
EOT
	sed -ne 's/^MainClass=\(.*\)\r$/  \1 \\/p' "$pkgdir"/usr/share/jivexdv/DVStart.ini >> "$pkgdir"/usr/bin/jivexdv
	echo '  "$@"' >> "$pkgdir"/usr/bin/jivexdv
	rm "$pkgdir"/usr/share/jivexdv/*.{bat,exe,ini}
}
