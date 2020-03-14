# Maintainer: thegio.f <thegio.f [at] gmail [dot] com>

_pkgname=skypeforlinux
pkgname=skype
pkgver=8.57.0.116
pkgrel=1
pkgdesc='P2P software for high-quality voice communication'
arch=('x86_64')
url='https://www.skype.com'
license=('custom')
depends=('gtk3' 'libxss' 'alsa-lib' 'libxtst' 'libsecret' 'nss')
optdepends=('org.freedesktop.secrets')
source=("https://repo.skype.com/deb/pool/main/s/$_pkgname/${_pkgname}_${pkgver}_amd64.deb"
        'skype')
validpgpkeys=('D4040146BE3972509FD57FC71F3045A5DF7587C3')
sha512sums=('672f818a52e6876c1460eb9f9fde3ada945934f98d912cad958ce18c2b45ea04ffb359d11223ace10c2ff81f8914eb8c1595cee501901de8cad9eb1e6ec6f4d8'
            'b0ac170b31c442006d2b3860cc4b5b43265369aa52de925c5e2ca30ea57767b8496c23626556922e8391cca1bf8e6b47b5759fd2e1f45a9dc41c13e30856a0ae')

prepare() {
	## Check the signature
	gpg --verify _gpgbuilder &> gpg-results || (cat gpg-results && echo "Make sure to download" \
		"the key with: 'gpg --receive-keys ${validpgpkeys[*]}'" && exit 1)

	sigkey=$(grep "Primary key fingerprint:" gpg-results | cut -c25- | sed 's| ||g')
	validsig=false
	for key in ${validpgpkeys[*]} ; do
		if [ "$sigkey" = "$key" ] ; then
			validsig=true
			break
		fi
	done
	if ! $validsig ; then echo "Not a trusted key"; exit 1 ; fi

	## Check the hashes
	dataSHA1=$(grep "data.tar.xz" _gpgbuilder | cut -d ' ' -f2)
	dataSHA1curr=$(sha1sum data.tar.xz | cut -d ' ' -f1)
	if [ "$dataSHA1" != "$dataSHA1curr" ] ; then echo "Wrong hash"; exit 1 ; fi

	## Extract archive
	install -dm755 $pkgname-$pkgver
	tar -xJC $pkgname-$pkgver -f data.tar.xz

	cd "$srcdir"/$pkgname-$pkgver
	sed -e 's|skypeforlinux|skype|g' \
		usr/share/applications/$_pkgname.desktop > usr/share/applications/$pkgname.desktop
}

package() {
	cd "$srcdir"/$pkgname-$pkgver

	## Create dirs
	install -dm755 "$pkgdir"/opt
	install -dm755 "$pkgdir"/usr/bin
	install -dm755 "$pkgdir"/usr/share/{applications,icons,pixmaps}
	install -dm755 "$pkgdir"/usr/share/doc/$pkgname

	## Install executable
	install -Dm755 ../$pkgname "$pkgdir"/usr/bin/$pkgname

	## Install LICENSE
	install -D -m644 usr/share/$_pkgname/LICENSES.chromium.html \
					"$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	## Install main binary
	cp -a usr/share/$_pkgname/ "$pkgdir"/opt/$pkgname
	mv "$pkgdir"/opt/$pkgname/$_pkgname "$pkgdir"/opt/$pkgname/$pkgname
	rm -f "$pkgdir"/opt/$pkgname/LICENSES.chromium.html

	## Install additional stuff
	install -D -m644 usr/share/applications/$pkgname.desktop \
					"$pkgdir"/usr/share/applications/$pkgname.desktop
	cp -a usr/share/doc/$_pkgname/* "$pkgdir"/usr/share/doc/$pkgname/
	install -D -m644 usr/share/pixmaps/$_pkgname.png \
					"$pkgdir"/usr/share/pixmaps/$pkgname.png

	## Install icons
	for size in 16 32 256 512 1024 ; do
		install -D -m644 usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png \
						"$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png
	done
}
