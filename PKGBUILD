# Maintainer: Jacek Szafarkiewicz <szafar@linux.pl>

pkgname=paperspace
pkgver=11.4.1.4096
pkgrel=1
pkgdesc='Paperspace Receiver'
arch=('x86_64')
license=('custom')
url='https://www.paperspace.com/app'
makedepends=('patchelf')
depends=('gcc-libs' 'libglvnd' 'libxext' 'libxcb')
optdepends=('libva: For hardware accelerated decoding')
source=("https://assets.paperspace.com/native-app/prod/linux/PaperspaceInstaller-${pkgver}"
        paperspace-installer-noninteractive.qs.in
        paperspace.sh)
sha256sums=('a69daf2ae559334481673bddabc9ad2e60977f4aad1b51945b0f416a70df1f07'
            '4dddf0c7212de5db2c51a8b212b95632bfc92d635e46a136e299308f9de8db0c'
            '32231f483b9ad1369936b7157d5160597014fb418b453f7216b51b9e2b074772')

prepare() {
    cd "$srcdir"

    sed "s;@INSTALL_DIR@;$srcdir/paperspace;" paperspace-installer-noninteractive.qs.in > paperspace-installer-noninteractive.qs

    chmod +x ./PaperspaceInstaller-${pkgver}
    ./PaperspaceInstaller-${pkgver} -platform minimal --verbose --script paperspace-installer-noninteractive.qs

    mv "$HOME/.local/share/applications/Paperspace.desktop" .
    rm paperspace/InstallationLog.txt
    rm paperspace/maintenancetool*
}

build() {
    cd "$srcdir"

    sed -i Paperspace.desktop \
        -e "/^Exec=/ s;=.*;=/usr/bin/paperspace;" \
        -e "/^Icon=/ s;=.*;=paperspace;"

    patchelf --set-rpath '$ORIGIN/lib' paperspace/Paperspace
    find paperspace/lib -type f -exec patchelf --set-rpath '$ORIGIN' {} +
}

package() {
    cd "$srcdir"
    mkdir -pv "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    
    cp -av "$srcdir/paperspace" "$pkgdir/usr/lib/paperspace"

    install -Dvm755 "$srcdir/paperspace.sh" "$pkgdir/usr/bin/paperspace"
    install -Dvm644 "$srcdir/Paperspace.desktop" "$pkgdir/usr/share/applications/paperspace.desktop"
    install -Dvm644 "$srcdir/paperspace/linux-icon-310x310.png" "$pkgdir/usr/share/pixmaps/paperspace.png"
}
