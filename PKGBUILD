# Maintainer: Moviuro <moviuro+aur at gmail dot com>

pkgname=rocketsrocketsrockets-hib
pkgver=20150915
pkgrel=1
pkgdesc="ROCKETS fire ROCKETS at ROCKETS in this action-arcade, arena-combat, gorgeous festival-of-fireworks!"
# i686 files are also available, and there are some comments to help if needed
arch=("x86_64")
url="https://rocketsrocketsrockets.com/"
license=("custom:commercial")
depends_x86_64=()
depends_i686=()
source_x86_64=("hib://Rockets.x86_64.zip"
               "$pkgname.x86_64.in")
source_i686=("hib://Rockets.x86.zip"
             "$pkgname.x86.in")
md5sums_x86_64=("af4c6b8e2b6d9fabc2b143c948010ffd"
                "2bfd3eef1dc360418824b71246e2bc4e")
md5sums_i686=("51745586ddc727c6b592a31fcc2cbb43"
              "ec366ffdfbb4396f3f68b9069c89464c")

# Disable compression of the package
PKGEXT='.pkg.tar'

package() {
    # Binaries
    install -Dm755 "$srcdir/Rockets.x86_64" "$pkgdir/opt/$pkgname/Rockets.x86_64"
    #install -Dm755 "$srcdir/Rockets.x86" "$pkgdir/opt/$pkgname/Rockets.x86"

    # Data
    # Hardlink files to save the disk space
    cp -Ral "$srcdir/Rockets_Data" "$pkgdir/opt/$pkgname/Rockets_Data"
    # Remove x86 files on x86_64
    find "$pkgdir/opt/$pkgname/Rockets_Data" -type d -name x86 -print0 | xargs -0 rm -r
    # Remove x86_64 files on i686
    #find "$pkgdir/opt/$pkgname/Rockets_Data" -type d -name x86_64 -exec rm -r {} \;

    # Fix permissions
    find "$pkgdir/opt/$pkgname/Rockets_Data" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname/Rockets_Data" -type f -print0 | xargs -0 chmod 644

    # Icon
    ln -s "/opt/$pkgname/Rockets_Data/Resources/UnityPlayer.png" "$pkgdir/opt/$pkgname/icon.png"

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    sed "s!@PKGDEST@!/opt/$pkgname/!" "$pkgname.x86_64.in" > "$pkgdir/usr/bin/$pkgname"
    #sed "s!@PKGDEST@!/opt/$pkgname/!" "$pkgname.x86.in" > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # License
    # None to be found in the archive

    # Icon
    install -m755 -d "$pkgdir/usr/share/pixmaps/"
    ln -s "/opt/$pkgname/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
