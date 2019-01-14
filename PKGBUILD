# Maintainer: Kevin Klement <klement@philos.umass.edu>
pkgname=vise-git
pkgver='r444.0e34dd4'
pkgrel=1
pkgdesc="A keyboard driven web browser with tabs in a tree"
arch=('x86_64')
url="https://github.com/kovidgoyal/vise"
license=('GPL')
depends=('python-apsw' 'qt5-base>=5.7.1' 'qt5-webengine' 'python-pyqt5' 'libsodium' 'python-yaml')
makedepends=('git' 'rapydscript-ng-git')
source=('git+https://github.com/kovidgoyal/vise.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	rapydscript --js-version 6 --cache-dir $srcdir/${pkgname%-git}/.build-cache $srcdir/${pkgname%-git}/client/main.pyj > $srcdir/${pkgname%-git}/resources/vise-client.js
	cd "$srcdir"
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    rm -rf "$srcdir/${pkgname%-git}/.git"
	cp -r "$srcdir/${pkgname%-git}" "$pkgdir/usr/share/${pkgname%-git}"
	cat > "$pkgdir/usr/bin/vise" << 'EOF'
#!/bin/sh
python3 /usr/share/vise "$@"
EOF

    chmod a+x $pkgdir/usr/bin/vise
    cat > "$pkgdir/usr/share/applications/vise.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Name=Vise
GenericName=Web Browser
Comment=A keyboard driven web browser with tabs in a tree 
StartupNotify=true
StartupWMClass=vise
TryExec=python3 /usr/share/vise
Exec=python3 /usr/share/vise %U
Terminal=false
Icon=web-browser
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml_xml;image/webp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
EOF

}