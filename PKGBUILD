# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=imibrowser
pkgver=14.0.4722
pkgrel=1
pkgdesc="iReasoning MIB browser tool for SNMP API."
url="https://www.ireasoning.com/mibbrowser.shtml"
arch=(x86_64)
license=(
	custom
	GPL
)
depends=(jre-openjdk)
makedepends=(imagemagick)
provides=(imibrowser)
conflicts=(imibrowser)
replaces=(imibrowser)
source=(
	$pkgname-$pkgver.zip::https://www.ireasoning.com/download/mibfree/mibbrowser.zip
	iMIBrowser.desktop
)
sha256sums=('181a4cede12d70d49114ded1a3f21d08f5791b7f4d41a56ef5790329e5074a22'
            '5d2ca5f1199f429a09f700476753bfdabd111acbf4fdaf7ea43ae8ed3879aa29')

prepare() {
	# information about license agreement for free Personal Edition version
	printf "Please read carefully through MIB Browser License Agreement (Personal Edition) at\nhttps://www.ireasoning.com/downloadmibbrowserlicense.shtml\n"

    cd "$srcdir"

# create executable /usr/bin file
cat > imibrowser.sh <<EOF
#!/bin/sh
nohup /opt/imibrowser/browser.sh &
EOF
}

package() {
    # install /usr/bin executable file
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

	# install application files
	install -d ${pkgdir}/opt/$pkgname/{config,docs,images,lib,mibs}
	install -Dm755 "$srcdir/ireasoning/mibbrowser/browser.sh" "$pkgdir/opt/$pkgname/browser.sh"
	install -Dm644 "$srcdir/ireasoning/mibbrowser/audio/alarm.wav" "$pkgdir/opt/$pkgname/audio/alarm.wav"
	install -Dm644 "$srcdir/ireasoning/mibbrowser/scripts/sample.txt" "$pkgdir/opt/$pkgname/scripts/sample.txt"

	cd "$srcdir/ireasoning/mibbrowser"
	cp -dr --no-preserve='ownership' config docs images lib mibs "$pkgdir/opt/$pkgname"

	# install license files
	install -Dm644 "$srcdir/ireasoning/mibbrowser/license.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/ireasoning/mibbrowser/THIRDPARTYLICENSEREADME.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/THIRDPARTY_LICENSE"

	# install icons
	for d in 16 24 32 48 128 256; do
		mkdir -p "$pkgdir/usr/share/icons/hicolor/${d}x${d}/apps"
	done

	for i in 16 24 32 48 128 256; do
		if 	[ $i = '16' ];	then layer=5;
		elif 	[ $i = '24' ];	then layer=4;
		elif 	[ $i = '32' ];	then layer=3;
		elif 	[ $i = '48' ];	then layer=2;
		elif 	[ $i = '128' ];	then layer=1;
		elif 	[ $i = '256' ];	then layer=0; fi

	convert "$srcdir/ireasoning/mibbrowser/images/browser.ico[${layer}]" -define icon:auto-resize=${icons} \
		"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
	done

	# install /usr/share/pixmaps png file
	install -Dm644 "$srcdir/ireasoning/mibbrowser/images/browser.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

	# install desktop file
	install -Dm644 "$srcdir/iMIBrowser.desktop" "$pkgdir/usr/share/applications/iMIBrowser.desktop"
}
