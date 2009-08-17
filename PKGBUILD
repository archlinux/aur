# Maintainer: Ali H. Caliskan <ali.h.caliskan@gmail.com>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Xavier <shiningxc[at]gmail[dot]com>

pkgname=savage2
pkgver=2.1.0
pkgrel=3
pkgdesc="Savage 2 is a fantasy themed action RPG, that combines elements of FPS and RTS."
arch=('i686' 'x86_64')
url="http://savage2.com/en/main.php"
license=('custom')
depends=('mesa' 'libjpeg' 'libjpeg6' 'libxml2')
makedepends=('unzip')
install=('savage2.install')
source=("http://savage.s2galactica.com/Savage2Install-$pkgver-$CARCH.bin"
	 's2game.desktop'
	 's2editor.desktop'
	 's2mviewer.desktop')
md5sums=('85b76a8e1ab22f147bb6eef98465c0ba'
         'e599528405e47b699cdf8ca5ea09be6e'
         '0b1bcd48feb45e5e155d2cdcedc18a2d'
         '74703e46ace651f5a668568b5f7b1ea0')
[ "$CARCH" = "x86_64" ] && md5sums[0]='134814532db8a7aadc0ec56def5e924c'

build() {

    cd $srcdir/

    # Extract the binary file
    unzip -q -o Savage2Install-$pkgver-$CARCH.bin 

    # Install Savage2
    install -d $pkgdir/opt/Savage2
    cp -r data/* $pkgdir/opt/Savage2 

    # Install Desktop Files
    install -d $pkgdir/usr/share/applications
    install -Dm644 *.desktop $pkgdir/usr/share/applications/

    # Install Icon and License
    install -Dm644 data/s2icon.png $pkgdir/usr/share/pixmaps/s2icon.png
    install -Dm644 data/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt

    # Install Launcher Script
    mkdir -p $pkgdir/usr/bin
    cat > $pkgdir/usr/bin/savage2 << "EOF"
#!/bin/bash

cd /opt/Savage2
./savage2.bin
EOF

    chmod 755 $pkgdir/usr/bin/savage2

    # Set group permission to root:games 
    chown -R root:games $pkgdir/opt/Savage2

    # Set permission to 4755
    chmod 4755 $pkgdir/opt/Savage2/savage2.bin
    chmod 4755 $pkgdir/opt/Savage2/savage2_update.bin
}
