# Maintainer: Stanislav GE <ginermail@gmail.com>
# Contributor: Baptiste Jonglez <zerstorer@free.fr>

pkgname=savage-xr
pkgver=1.0rc3
pkgrel=1
pkgdesc="The Linux Client for the game Savage XR"
arch=('i686' 'x86_64')
url=http://www.newerth.com
license=('custom: "Unknown"')
install=savage-xr.install
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-sdl' 'lib32-mesa' 'lib32-pcre')
else
    depends=('sdl' 'mesa' 'pcre')
fi
source=("xr_setup-$pkgver-cl_lin_prod.bin::http://www.newerth.com/?id=downloads&op=downloadFile&file=xr_setup-$pkgver-cl_lin_prod.bin&mirrorid=3"
        "savage-xr.desktop"
        "savage-xr-editor.desktop")
md5sums=('3dbe7041cd13e2d74e55ad4367178061'
         'b03a2a0f072d8360fc2eeac9a8000462'
         '998bb912dffe9a90e98fc7efb0f42f02')

build() {
    # Create destination directory
    install -d $pkgdir/opt/savage-xr

    # Extract game from the installer
    chmod +x $srcdir/xr_setup-${pkgver}-cl_lin_prod.bin
    $srcdir/xr_setup-${pkgver}-cl_lin_prod.bin --mode silent --prefix $pkgdir/opt/savage-xr
}

# Note that we must have a 'package' function in order not to use fakeroot
# on the 'build' function (which makes the savage installer fail)

package () {
    # Create destination directory
    install -d $pkgdir/usr/bin

    # Install the game launcher
    ln -s /opt/savage-xr/savage.sh $pkgdir/usr/bin/savage-xr.sh

    # Install desktop file (Game Client)
    install -D -m 644 $srcdir/savage-xr.desktop $pkgdir/usr/share/applications/savage-xr.desktop

    # Install desktop file (Map Editor)
    install -D -m 644 $srcdir/savage-xr-editor.desktop $pkgdir/usr/share/applications/savage-xr-editor.desktop

    # Install icon
    install -D -m 644 $pkgdir/opt/savage-xr/icon.xpm $pkgdir/usr/share/pixmaps/savage-xr.xpm

    # Change group of the game folder to 'games'
    chown -R :games $pkgdir/opt/savage-xr
    chmod -R g+rwX $pkgdir/opt/savage-xr
}
