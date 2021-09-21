# Maintainer: mosh5382 <arch@moshermail.com>
# Contributor: Frederic Bezies <fred bezies at gmail dot com>
pkgname=gsplus-git
_name=gsplus
pkgver=r556.4805720
pkgrel=2
pkgdesc="Modern cross-platform Apple IIgs emulator"
arch=('x86_64')
url="http://apple2.gs/plus/"
license=('GPL2')
provides=('gsplus')
conflicts=('gsplus')
depends=('sdl2_image' 'libxext' 'freetype2')
optdepends=('alsa-oss' 'git')
makedepends=('cmake' 'pkgconfig' 're2c')
install=$_name.install
source=("git+https://github.com/digarok/gsplus"
        "gsplus.png"
        "README.txt"
        "gsplus.install")
sha256sums=("SKIP"
            "d332c858a9517a9adc6f581718e9c5288ee83a0a93a872414cfda8776a2a38ae"
            "fdd15bff85e06c8f9d948cf986d22051bd3c1201b9f4b831947bf3cf0c5adc53"
            "b49a30685334485d0d6fea480a90c36c6d5ed2821bfe90490ed5bb971fe6735a")

pkgver() {
    cd "$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

  msg2 "Generate desktop application entry for gsplus..."
  cat > "$srcdir"/$_name.desktop << EOF
[Desktop Entry]
Version=0.14
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

#   cd "$srcdir/$_name/src"
#   ln -s vars_x86linux_x11 vars
#   make clean ; make
    mkdir "$srcdir"/$_name/build ; cd "$srcdir"/$_name/build
    cmake ..
    make
}

package() {
        # Creating directories for pkgbuild
        mkdir -pm 755 "$pkgdir"/usr/share/$_name
        mkdir -pm 755 "$pkgdir"/usr/bin
    mkdir -pm 755 "$pkgdir"/usr/share/$_name/docs
    mkdir -pm 755 "$pkgdir"/usr/share/$_name/images

        # Install config file in /etc/gsplus - NOT NEEDED
    # install -m 755 "$srcdir"/$_name/config.template "$pkgdir"/usr/share/$_name/config.txt

    install -m 755 "$srcdir"/$_name/build/bin/GSplus "$pkgdir"/usr/share/$_name/GSplus 
    ln -s /usr/share/$_name/GSplus $pkgdir/usr/bin/gsplus
    install -m 755 "$srcdir"/README.txt "$pkgdir"/usr/share/$_name/docs/README.txt
#   install -m 755 "$srcdir"/gsplusmanual.pdf "$pkgdir"/usr/share/$_name/docs/gsplusmanual.pdf

    #msg2 "Install desktop application entry in /usr/share/applications..."
    install -Dm644 "$srcdir"/$_name.desktop "$pkgdir"/usr/share/applications/$_name.desktop
    install -Dm644 "$srcdir"/$_name.png "$pkgdir"/usr/share/pixmaps/$_name.png
}
