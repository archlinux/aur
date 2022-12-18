# Maintainer :  Biginoz 
# Contributor: syntheit <daniel@matv.io>
pkgname='google-messages'
pkgver=1.4.0
pkgrel=1
pkgdesc="A native-like OS X, Windows, & Linux desktop app for Google Messages"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://www.messagesfordesktop.com/"
license=('custom')
makedepends=('nodejs-nativefier')
source=("google-messages.png::https://raw.githubusercontent.com/kelyvin/Google-Messages-For-Desktop/v1.3.0/android-messages-logo.png"
        "google-messages.desktop")
sha256sums=('3c938c748fbef4cdd72e638b26aa35f3e2da8045a0c5490ede8b6ef5603f1b2c'
            '6909e255521af089883f18740fc91c7743897c99d4ece0784b969cea5bc480ae')

build() {
	if [ "$CARCH" = "x86_64" ]; then
	    _NFARCH='x64'
	elif [ "$CARCH" = "i686" ] || [ "$CARCH" = "pentium4" ]; then
	    _NFARCH='ia32'
	elif [ "$CARCH" = "aarch64" ]; then
	    _NFARCH='arm64'
	elif [ "$CARCH" = "armv7h" ]; then
	    _NFARCH='armv7l'
	else
	    echo "Unsupported architecture. Aborting"
	    exit 1
	fi
	nativefier --platform "linux" --tray --icon google-messages.png --name "Google Messages" "https://messages.google.com/web" --honest --disable-dev-tools --single-instance --app-version $pkgver --build-version $pkgrel --arch ${_NFARCH}
}

package() {
	_INSTDIR=$(ls -l "${srcdir}" | grep "GoogleMessages-linux-" | awk '{print $9}')
	mkdir -p "$pkgdir"/opt
	mv ${_INSTDIR} "$pkgdir"/opt/google-messages
	mkdir -p "$pkgdir"/usr/bin
	ln -s /opt/google-messages/GoogleMessages "$pkgdir"/usr/bin/google-messages
	install -Dm644 "$pkgdir"/opt/google-messages/LICENSE "$pkgdir"/usr/share/licenses/google-messages/LICENSE
	install -Dm644 google-messages.png "$pkgdir"/usr/share/pixmaps/google-messages.png
	install -Dm644 google-messages.desktop "$pkgdir"/usr/share/applications/google-messages.desktop
}
