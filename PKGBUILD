# Maintainer: mosh5382 <arch@moshermail.com>
pkgname=gsplus-git
_name=gsplus
pkgver=r79.74815bf
pkgrel=1
pkgdesc="Modern cross-platform Apple IIgs emulator"
arch=('x86_64')
url="http://apple2.gs/plus/"
license=('GPL')
provides=('gsplus')
conflicts=('gsplus')
depends=('git' 'libpcap' 'libx11' 'libxext' 'alsa-oss')
install=$_name.install
source=("git+https://github.com/digarok/gsplus"
        "gsplus.png"
        "README.txt"
        "gsplus.install"
        "gsplusmanual.txt")
sha256sums=("SKIP"
            "d332c858a9517a9adc6f581718e9c5288ee83a0a93a872414cfda8776a2a38ae"
            "143c61dc91a0cd9cf79e4548d0eee97d04f5396967c660fc843f3c7cf543ba0e"
            "15ad6049dfdc539c3fd6f1069ca7fb0f638a2c7c6158c17d2c590cd7d9290fb2"
            "5edb3a7b2083fabcf0c301f9761774b0aaf3ee03ef2e7a03f25c8f8226a1717b")

pkgver() {

	cd "$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
	
build() {

  msg2 "Generate desktop application entry for gsplus..."
  cat > "$srcdir"/$_name.desktop << EOF
[Desktop Entry]
Version=0.13
Type=Application
Name=gsplus
Comment=Modern cross-platform Apple IIgs emulator
Exec=gsplus %f
Icon=gsplus
Terminal=false
Categories=System;
MimeType=application/x-gsplus;
Keywords=apple,simulator;
EOF

	cd "$srcdir/$_name/src"
  	ln -s vars_x86linux_x11 vars
	make clean ; make
}

package() {
        # Creating directories for pkgbuild
        mkdir -pm 755 "$pkgdir"/usr/share/$_name
        mkdir -pm 755 "$pkgdir"/usr/bin
        mkdir -pm 755 "$pkgdir"/etc/$_name
        
        # Install config file in /etc/gsplus
        install -m 777 "$srcdir"/$_name/config.template "$pkgdir"/etc/$_name/config.txt
        # Link to config file in /usr/share program needs this to start
        ln -s /etc/gsplus/config.txt "$pkgdir"/usr/share/$_name/config.txt

	install -m 755 "$srcdir"/$_name/gsplusx "$pkgdir"/usr/share/$_name/gsplusx 
	ln -s /usr/share/gsplus/gsplusx $pkgdir/usr/bin/gsplus
	install -m 755 "$srcdir"/README.txt "$pkgdir"/usr/share/$_name/README.txt
	install -m 755 "$srcdir"/gsplusmanual.txt "$pkgdir"/usr/share/$_name/gsplusmanual.txt

	#msg2 "Install desktop application entry in /usr/share/applications..."
	install -Dm644 "$srcdir"/$_name.desktop "$pkgdir"/usr/share/applications/$_name.desktop
	install -Dm644 "$srcdir"/$_name.png "$pkgdir"/usr/share/pixmaps/$_name.png
}
