# Maintainer: Jacek Szafarkiewicz <szafar@linux.pl>

pkgname=paperspace
pkgver=11.9.12.5782
pkgrel=0
pkgdesc='Paperspace Receiver'
arch=('x86_64')
license=('custom')
url='https://www.paperspace.com/app'
makedepends=('patchelf')
depends=('gcc-libs' 'libglvnd' 'libxext' 'libxcb')
optdepends=('libva: For hardware accelerated decoding')
source=("https://assets.paperspace.com/native-app/prod/linux/PaperspaceInstaller-${pkgver}"
        paperspace-installer-noninteractive.qs.in
        paperspace.sh
        paperspace.desktop)
sha256sums=('6310c2da243d5da577e015ac45c5a9d45cb22b31c39edc8af9adb2c4f2ea1258'
            '4dddf0c7212de5db2c51a8b212b95632bfc92d635e46a136e299308f9de8db0c'
            '32231f483b9ad1369936b7157d5160597014fb418b453f7216b51b9e2b074772'
            'c0e86c830576155c38f37ce3fcca9e9f5bd813c77870092d80f364b2e90fc676')

prepare() {
    cd "$srcdir"

    sed "s;@INSTALL_DIR@;$srcdir/paperspace;" paperspace-installer-noninteractive.qs.in > paperspace-installer-noninteractive.qs

    chmod +x ./PaperspaceInstaller-${pkgver}
    ./PaperspaceInstaller-${pkgver} -platform minimal --verbose --script paperspace-installer-noninteractive.qs

    rm -f "$HOME/.local/share/applications/Paperspace.desktop"
    rm paperspace/InstallationLog.txt
    rm paperspace/maintenancetool*
}

build() {
    cd "$srcdir"

    patchelf --set-rpath '$ORIGIN/lib' paperspace/Paperspace
    find paperspace/lib -type f -exec patchelf --set-rpath '$ORIGIN' {} +
}

package() {
    cd "$srcdir"
    mkdir -pv "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    
    cp -av "$srcdir/paperspace" "$pkgdir/usr/lib/paperspace"

    install -Dvm755 "$srcdir/paperspace.sh" "$pkgdir/usr/bin/paperspace"
    install -Dvm644 "$srcdir/paperspace.desktop" "$pkgdir/usr/share/applications/paperspace.desktop"
    install -Dvm644 "$srcdir/paperspace/linux-icon-310x310.png" "$pkgdir/usr/share/pixmaps/paperspace.png"
}
