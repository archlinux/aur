# Maintainer: Max Berggren <maxberggren@gmail.com>
pkgname=jotite
pkgver=2.2.3
pkgrel=1
pkgdesc="A lightweight, fun, distraction-free markdown note-taking app with live markdown rendering"
arch=('any')
url="https://github.com/maxberggren/omarchy-jotite"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita' 'fontconfig')
install=jotite.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c45b54252f13b4c5c4e20461568157ca31617cf21800407f16f1d285f9211722')

package() {
    cd "$srcdir/omarchy-jotite-$pkgver"

    # Install all application files to /usr/share/jotite
    install -Dm755 jotite.js "$pkgdir/usr/share/jotite/jotite.js"
    install -Dm644 constants.js "$pkgdir/usr/share/jotite/constants.js"
    install -Dm644 settings.json "$pkgdir/usr/share/jotite/settings.json"
    
    # Install module directories
    cp -r app "$pkgdir/usr/share/jotite/"
    cp -r file "$pkgdir/usr/share/jotite/"
    cp -r markdown "$pkgdir/usr/share/jotite/"
    cp -r settings "$pkgdir/usr/share/jotite/"
    cp -r theme "$pkgdir/usr/share/jotite/"
    cp -r ui "$pkgdir/usr/share/jotite/"
    
    # Create wrapper script in /usr/bin
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/jotite" <<'EOF'
#!/bin/bash
exec gjs /usr/share/jotite/jotite.js "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/jotite"

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