# Maintainer: Jussi Eloranta <eloranta@aa6kj.hopto.org>
pkgname=qk4-git
pkgver=rv0.5.0.beta.6.0.g5d68e84
pkgrel=3
pkgdesc="Remote control software for Elecraft K4 radio."
arch=('any')
url="https://github.com/mikeg-dal/QK4"
license=('GPL V3')
depends=('base-devel' 'cmake' 'file' 'patchelf' 'qt6-base' 'qt6-multimedia' 'qt6-shadertools' 'qt6-serialport' 'opus' 'hidapi' 'openssl' 'alsa-lib' 'libpulse')
makedepends=('git')
sha256sums=('SKIP')
source=(git+"https://github.com/mikeg-dal/QK4.git")

pkgver() {
    cd "$srcdir/QK4"
    git describe --long --tags | sed 's/.*-g/r\0/;s/-/./g'
}

build() {
    cd "$srcdir/QK4"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    cd "$srcdir/QK4/build"
    install -Dm755 QK4 "$pkgdir/usr/bin/QK4.bin"
cat > "$pkgdir/usr/bin/QK4" << EOF
#!/bin/bash
PIPEWIRE_QUANTUM=64/48000 /usr/bin/QK4.bin
exit 0
EOF
    chmod 755 "$pkgdir/usr/bin/QK4"
    install -Dm644 ../README.md "$pkgdir/usr/share/doc/qk4/README.md"
    mkdir -p "$pkgdir/usr/share/applications"
cat > "$pkgdir/usr/share/applications/qk4.desktop" << EOF
[Desktop Entry]
Version=1.0
Name=QK4
Comment=Remote control software for Elecraft K4 radio
Exec=/usr/bin/QK4
Type=Application
Categories=AudioVideo;Audio;HamRadio;
Icon=qk4_icon
Terminal=false
EOF
    chmod 644 "$pkgdir/usr/share/applications/qk4.desktop"
    install -Dm644 "$startdir/qk4.png" "$pkgdir/usr/share/pixmaps/qk4.png"
}
