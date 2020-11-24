# Maintainer: Jacek Szafarkiewicz <szafar@linux.pl>

pkgname=paperspace
pkgver=10.1.0.1684
pkgrel=1
pkgdesc='Paperspace Receiver'
arch=('x86_64')
license=('custom')
url='https://www.paperspace.com'
makedepends=('patchelf')
depends=('libwebp' 'libx11' 'pulseaudio' 'snappy' 'zlib'
         'qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-webchannel' 'qt5-webengine' 'qt5-websockets')
source=("https://assets.paperspace.com/native-app/prod/linux/PaperspaceInstaller-${pkgver}"
        paperspace-installer-noninteractive.qs.in)
sha256sums=('69fb4cafabe79718314342341d562dc8299487ab9b1be7f14fef31b6d29e6835'
            '4dddf0c7212de5db2c51a8b212b95632bfc92d635e46a136e299308f9de8db0c')

prepare() {
    cd "$srcdir"

    sed "s;@INSTALL_DIR@;$srcdir/paperspace;" paperspace-installer-noninteractive.qs.in > paperspace-installer-noninteractive.qs
}

build() {
    cd "$srcdir"

    chmod +x ./PaperspaceInstaller-${pkgver}
    ./PaperspaceInstaller-${pkgver} -platform minimal --verbose --script paperspace-installer-noninteractive.qs

    mv "$HOME/.local/share/applications/Paperspace.desktop" .

    sed -i Paperspace.desktop \
        -e "/^Exec=/ s;=.*;=/usr/lib/paperspace/Paperspace;" \
        -e "/^Icon=/ s;=.*;=$pkgname;"
}

package() {
    cd "$srcdir"

    install -Dm644 "$srcdir/paperspace/linux-icon-310x310.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/Paperspace.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    
    install -Dm755 "$srcdir/paperspace/Paperspace" "$pkgdir/usr/lib/paperspace/Paperspace"
    install -Dm755 "$srcdir/paperspace/lib/libquic_lib.so.1" "$pkgdir/usr/lib/paperspace/lib/libquic_lib.so.1"
    install -Dm755 -d "$srcdir/paperspace/crashes/" "$pkgdir/usr/lib/paperspace/crashes/"
}
