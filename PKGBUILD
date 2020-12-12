# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='google-messages'
pkgver=1.1.2
pkgrel=1
pkgdesc="A native-like OS X, Windows, & Linux desktop app for Google Messages"
arch=('x86_64' 'i686' 'pentium4' 'aarch64')
url="https://www.messagesfordesktop.com/"
license=('unknown')
makedepends=('npm' 'nodejs')
source=("google-messages.png::https://raw.githubusercontent.com/kelyvin/Google-Messages-For-Desktop/v$pkgver/android-messages-logo.png"
        "google-messages.sh"
        "google-messages.desktop")
sha256sums=('3c938c748fbef4cdd72e638b26aa35f3e2da8045a0c5490ede8b6ef5603f1b2c'
            '803d148788b75176f8333077c08e9e25081127c30f0476809c131ef93d25a6b3'
            '6909e255521af089883f18740fc91c7743897c99d4ece0784b969cea5bc480ae')

build() {
	sudo npm install --global nativefier
	nativefier --platform "linux" --icon google-messages.png --name "Google Messages" "https://messages.google.com/web" --honest --disable-dev-tools --single-instance --app-version $pkgver --build-version $pkgrel
}

package() {
	if [ `uname -m` = "x86_64" ]; then
	    _INSTARCH='x64'
	elif [ `uname -m` = "i686" ] || [ `uname -m` = "pentium4" ]; then
	    _INSTARCH='ia32'
	elif [ `uname -m` = "aarch64" ]; then
	    _INSTARCH='arm64'
	else
	    echo "Unknown architecture. Aborting"
	    exit 1
	fi

	mkdir -p "$pkgdir"/opt
	mv GoogleMessages-linux-${_INSTARCH} "$pkgdir"/opt/google-messages
	install -Dm755 google-messages.sh "$pkgdir"/usr/bin/google-messages
	install -Dm644 google-messages.png "$pkgdir"/usr/share/pixmaps/google-messages.png
	install -Dm644 google-messages.desktop "$pkgdir"/usr/share/applications/google-messages.desktop
}
