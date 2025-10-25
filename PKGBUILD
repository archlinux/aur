# Maintainer: Max Berggren <maxberggren@gmail.com>
pkgname=jotite
pkgver=2.3.1
pkgrel=2
pkgdesc="A lightweight, fun, distraction-free markdown note-taking app with live markdown rendering"
arch=('any')
url="https://github.com/maxberggren/omarchy-jotite"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita' 'fontconfig')
install=jotite.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('71339e56217fd6961049c6cf4c7cfceb8490049c0e6716f1f2c886b114d031e7')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install application files to /usr/share/jotite
    install -Dm755 jotite.js "$pkgdir/usr/share/jotite/jotite.js"
    install -Dm644 constants.js "$pkgdir/usr/share/jotite/constants.js"
    install -Dm644 settings.json "$pkgdir/usr/share/jotite/settings.json"
    
    # Install directories
    cp -r app "$pkgdir/usr/share/jotite/"
    cp -r file "$pkgdir/usr/share/jotite/"
    cp -r markdown "$pkgdir/usr/share/jotite/"
    cp -r settings "$pkgdir/usr/share/jotite/"
    cp -r theme "$pkgdir/usr/share/jotite/"
    cp -r ui "$pkgdir/usr/share/jotite/"
    
    # Create wrapper script in /usr/bin
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/jotite" <<'EOF'
#!/bin/bash
exec gjs /usr/share/jotite/jotite.js "$@"
EOF

    # Install desktop file
    install -Dm644 jotite.desktop "$pkgdir/usr/share/applications/jotite.desktop"

    # Install icon
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/jotite.png"

    # Install custom font (pxlxxl)
    install -Dm644 pxlxxl.ttf "$pkgdir/usr/share/fonts/jotite/pxlxxl.ttf"
    
    # Install font license
    install -Dm644 pxlxxl-eula.txt "$pkgdir/usr/share/licenses/$pkgname/pxlxxl-eula.txt"
    
    # Install fontconfig configuration
    install -Dm644 /dev/stdin "$pkgdir/etc/fonts/conf.avail/69-jotite.conf" <<'EOF'
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <dir>/usr/share/fonts/jotite</dir>
</fontconfig>
EOF
}