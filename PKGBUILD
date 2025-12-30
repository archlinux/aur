pkgname=vitamin-browser
pkgver=0.5.0
pkgrel=1
pkgdesc="A privacy-first browser that poisons tracking data by feeding trackers garbage information instead of just blocking them."
arch=('x86_64')
url="https://github.com/realvitali/vitamin-releases/"
license=('GPL3')
depends=('nodejs' 'npm')
makedepends=('git')
options=('!strip')
source=("$pkgname::git+https://github.com/realvitali/vitamin-releases.git#branch=main")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    npm install  --prefer-offline --no-fund
}

package() {
    cd "$srcdir/$pkgname"

    # Install app files 
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r * "$pkgdir/usr/lib/$pkgname"

	# Install icon to pixmaps
    install -Dm644 "assets/icon.png" "$pkgdir/usr/share/pixmaps/vitamin-browser.png"
    
  	# Launcher script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
cd /usr/lib/$pkgname && npm start
END
    
	# Desktop entries for KDE and "most DEs"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<END
[Desktop Entry]
Type=Application
Name=Vitamin Browser
Exec=$pkgname
Icon=vitamin-browser
Categories=Netork;WebBrowser;
END
}
