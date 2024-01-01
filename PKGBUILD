# Maintainer: h3li0p4us3 Moharami <h3li0p4us3@proton.me>
pkgname=dnschanger-desktop
pkgver=2.1.11
pkgrel=1
pkgdesc="Build DNS Changer Desktop Application from source"
arch=('any')
url="https://github.com/DnsChanger/dnsChanger-desktop"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('git')
source=("$url/archive/refs/tags/v$pkgver.zip")
sha256sums=('c259c0c1e227c73378b55689574397706cfb063e7192dc34fde004dd3aa883de')


prepare() {
 cd "$srcdir/dnsChanger-desktop-$pkgver"
 npm install .
}

build() {
 cd "$srcdir/dnsChanger-desktop-$pkgver"
 npm run build > /dev/null 2>&1
}

package() {
 cd "$srcdir/dnsChanger-desktop-$pkgver" 

# Move the AppImage to /usr/bin/
 mkdir -p "${pkgdir}"/usr/bin/dnsChanger-desktop/
 rsync -r release/2.1.11/linux-unpacked/ "${pkgdir}"/usr/bin/dnsChanger-desktop/

# Create a .desktop file
 echo "[Desktop Entry]
 Name=$pkgname
 Exec=/usr/bin/dnsChanger-desktop/dnschanger
 Icon=/usr/share/pixmaps/dnsChanger-desktop.png
 Type=Application
 Categories=Network;
 " > "dnsChanger-desktop.desktop"

# Move the .desktop file to applications folder
 mkdir -p "${pkgdir}"/usr/share/applications/

# Use rsync to copy the .desktop file
 rsync -r dnsChanger-desktop.desktop "${pkgdir}"/usr/share/applications/

 # Copy the icon to /usr/share/pixmaps/
 mkdir -p "${pkgdir}"/usr/share/pixmaps/

# Use rsync to copy the icon file
 rsync -r public/icons/icon.png "${pkgdir}"/usr/share/pixmaps/dnsChanger-desktop.png

}

clean() {
 rm -rf "$srcdir/dnsChanger-desktop-$pkgver"
}

