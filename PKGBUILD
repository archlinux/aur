# Maintainer: Jacek Szafarkiewicz <szafar@linux.pl>

pkgname=paperspace
pkgver=11.3.0.3469
pkgrel=1
pkgdesc='Paperspace Receiver'
arch=('x86_64')
license=('custom')
url='https://www.paperspace.com'
makedepends=('patchelf')
depends=('gcc-libs' 'libglvnd' 'libxext' 'libxcb')
optdepends=('libva: For hardware accelerated decoding')
source=("https://assets.paperspace.com/native-app/prod/linux/PaperspaceInstaller-${pkgver}"
        paperspace-installer-noninteractive.qs.in
        paperspace.sh
        paperspace.desktop)
sha256sums=('6bfffccb2de60380711ab383744082c8df219255c29f37c39a8691be287c60bc'
            '4dddf0c7212de5db2c51a8b212b95632bfc92d635e46a136e299308f9de8db0c'
            '32231f483b9ad1369936b7157d5160597014fb418b453f7216b51b9e2b074772'
            '67f33222e7dc5b39277d85d1997d2a489e4964c87cb4841745e5e85cdda0c459')

prepare() {
    cd "$srcdir"

    sed "s;@INSTALL_DIR@;$srcdir/paperspace;" paperspace-installer-noninteractive.qs.in > paperspace-installer-noninteractive.qs

    chmod +x ./PaperspaceInstaller-${pkgver}
    ./PaperspaceInstaller-${pkgver} -platform minimal --verbose --script paperspace-installer-noninteractive.qs
}

build() {
    cd "$srcdir"

    patchelf --set-rpath '$ORIGIN/lib' paperspace/Paperspace
    find paperspace/lib -type f -exec patchelf --set-rpath '$ORIGIN' {} +
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    
    cp -av "$srcdir/paperspace" "$pkgdir/usr/lib/paperspace"

    install -Dvm755 "$srcdir/paperspace.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dvm644 "$srcdir/paperspace.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dvm644 "$srcdir/paperspace/linux-icon-310x310.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
