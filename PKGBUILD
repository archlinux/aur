# Maintainer: mosh5382 <arch@moshermail.com>
pkgname=linapple
_name=_src-
pkgver=2b
pkgrel=2
pkgdesc="An Apple 2, 2e cross-platform emulator "
arch=('x86_64')
url="http://http://linapple.sourceforge.net/index.html"
license=('GPL')
depends=('sdl' 'curl' 'zlib' 'libzip')
makedepends=('imagemagick')
conflicts=('linapple-git')
install=${pkgname}.install
source=("http://beotiger.com/download/$pkgname$_name$pkgver"
        "conf.patch"
        "makefile.patch"
        "linapple.install")
        
md5sums=('4f60543ff6e02eb3663182d215203f7c'
         '18287e71ccad023b60868268e2c9001f'
         'ec6d79f611dfc0803aeb94579c65d5fe'
         'b5b9a932d6ef7de5e48e9bfb7528ab34')

prepare() {
        cd $srcdir/$pkgname$_name$pkgver
        patch -Np1 -i "${srcdir}/conf.patch"
        patch -Np1 -i "${srcdir}/makefile.patch"
}

build() {

  msg2 "Generate desktop application entry for linapple..."
  cat > "$srcdir"/${pkgname}.desktop << EOF
[Desktop Entry]
Version=2b
Type=Application
Name=LinApple
Comment=An Apple 2, 2e cross-platform emulator
Exec=linapple %f
Icon=linapple
Terminal=false
Categories=System;
MimeType=application/x-linapple;
Keywords=apple,simulator;
EOF

	cd "$srcdir/$pkgname$_name$pkgver/src"
  	make PREFIX="/usr"
}
package() {
        # Creating directories for pkgbuild
        mkdir -p "$pkgdir"/usr/share
        mkdir -p "$pkgdir"/usr/bin
        mkdir -pm 755 "$pkgdir"/etc/$pkgname
        
        # Run Make and Install
	cd "$srcdir/$pkgname$_name$pkgver/src"
        make INSTDIR="$pkgdir/usr/share/$pkgname" STARTUP="$pkgdir/usr/bin/$pkgname" install
        
        # Install config file in /etc/linapple
        install -m 777 "$pkgdir"/usr/share/linapple/linapple.installed.conf "$pkgdir"/etc/$pkgname/linapple.conf
        # Link to config file in /usr/share program needs this to start
        ln -s /etc/$pkgname/linapple.conf "$pkgdir"/usr/share/$pkgname/linapple.conf
        rm "$pkgdir"/usr/share/linapple/linapple.installed.conf

        # Create icon and .desktop file to create menu entry
        cd "$srcdir/$pkgname$_name$pkgver"
	msg2 "Convert icon to png format..."
	convert "$pkgdir"/usr/share/$pkgname/icon.bmp "$pkgdir"/usr/share/$pkgname/$pkgname.png	
	msg2 "Install desktop application entry in /usr/share/applications..."
	install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
	install -Dm644 "$pkgdir"/usr/share/$pkgname/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}
