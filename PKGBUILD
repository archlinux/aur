# Maintainer: Lars Toenning <dev (at) l <Last Name> (dot) (TLD Germany)
pkgname=qutescoop-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="Status indicator for the online flight simulation community VATSIM"
arch=('x86_64')
url="https://github.com/qutescoop/qutescoop"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tgz::https://github.com/qutescoop/qutescoop/releases/download/v2.10.0/QuteScoop-v$pkgver-linux.tgz")
sha256sums=("dc8c07455cc5c7eb7639f578c7823eaa4f2e7b5fe7d3992c393bdde13a23aef4")
makedepends=('patchelf')
depends=(
    'qt5-base'
    'libglvnd'
    'glibc'
    'gcc-libs'
    'glu'
)
prepare() {
    # Remove CI RUNPATH
    patchelf --remove-rpath ./QuteScoop
    
    # Remove build-in (Qt) dependencies. Will use system dependencies instead
    rm $srcdir/lib -rf
    rm $srcdir/xcbglintegrations -rf
    rm $srcdir/platforms -rf
    
    # Unused launcher script
    rm $srcdir/QuteScoop.sh -rf
    
    # Adjust desktop file
    sed -i "s|^Exec=.*|Exec=/opt/$pkgname/QuteScoop|" $srcdir/QuteScoop.desktop
    sed -i "s|^Icon=.*|Icon=/opt/$pkgname/qutescoop.png|" $srcdir/QuteScoop.desktop
    sed -i "/^Path.*/d" $srcdir/QuteScoop.desktop

    # Remove source artifact
    rm $srcdir/$pkgname-$pkgver.tgz
}

package() {
    # Install files to /opt
    install -d "$pkgdir"/opt/"$pkgname"
    cp -r "$srcdir/"* "$pkgdir/opt/$pkgname/"

    chmod 755 "$pkgdir"/opt/"$pkgname"

    # TODO Workaround: Data and log needs to be writable for user.
    # Application should be adjusted to read from XDG_ directories.
    # /opt should not contain world-writable files!
    chmod -R 777 "$pkgdir"/opt/"$pkgname/data"
    touch "$pkgdir"/opt/"$pkgname/log.txt"
    chmod 777 "$pkgdir"/opt/"$pkgname/log.txt"
    
    # Install symlinks in /usr for convenience
    install -d "$pkgdir"/usr/share/applications
    ln -s /opt/"$pkgname"/QuteScoop.desktop "${pkgdir}/usr/share/applications/QuteScoop.desktop"
    install -d "$pkgdir"/usr/bin
    ln -s /opt/"$pkgname"/QuteScoop "${pkgdir}/usr/bin/QuteScoop"
}
