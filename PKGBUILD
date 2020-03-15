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
source=('skype'
        "$pkgname-$pkgver-Release::https://repo.skype.com/deb/dists/stable/Release"
        "$pkgname-$pkgver-Release.sig::https://repo.skype.com/deb/dists/stable/Release.gpg")
source_x86_64=("https://repo.skype.com/deb/pool/main/s/$_pkgname/${_pkgname}_${pkgver}_amd64.deb"
               "$pkgname-$pkgver-x86_64-Packages::https://repo.skype.com/deb/dists/stable/main/binary-amd64/Packages")
validpgpkeys=('D4040146BE3972509FD57FC71F3045A5DF7587C3')
sha512sums=('b0ac170b31c442006d2b3860cc4b5b43265369aa52de925c5e2ca30ea57767b8496c23626556922e8391cca1bf8e6b47b5759fd2e1f45a9dc41c13e30856a0ae'
            'SKIP'
            'SKIP')
sha512sums_x86_64=('672f818a52e6876c1460eb9f9fde3ada945934f98d912cad958ce18c2b45ea04ffb359d11223ace10c2ff81f8914eb8c1595cee501901de8cad9eb1e6ec6f4d8'
                   'SKIP')


prepare() {
	## Skype uses different names for the arch
	if [ "${CARCH}" = "x86_64" ]; then
		_SKYPE_ARCH=amd64
	else
		exit 1
	fi

	## Validate hashes from the PGP signed "Release" file
	echo "$(grep SHA512 -A9 $pkgname-$pkgver-Release | grep -Pe main/binary-${_SKYPE_ARCH}/Packages | tail -n1 | awk '{print $1}') $pkgname-$pkgver-${CARCH}-Packages" \
		> "$pkgname-$pkgver-${CARCH}-Packages.sha512"
	sha512sum -c "$pkgname-$pkgver-${CARCH}-Packages.sha512"

	echo "$(grep "Version: $pkgver" -A10 $pkgname-$pkgver-${CARCH}-Packages | grep SHA512 | awk '{print $2}') ${_pkgname}_${pkgver}_${_SKYPE_ARCH}.deb" \
		> "$pkgname-$pkgver-${CARCH}.deb.sha512"
	sha512sum -c "$pkgname-$pkgver-${CARCH}.deb.sha512"

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
