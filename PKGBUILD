# Maintainer: Alex Szczuczko <alex at szc dot ca>
# Contributor: Niluge_KiWi <kiwiiii@gmail.com>

pkgname=monaco
_pkgver='2014-05-07'
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="Assemble a crack team of thieves and execute the perfect crime"
arch=('i686' 'x86_64')
url="http://www.monacoismine.com/"
license=('custom:commercial')
depends=()
source=("$pkgname.desktop"
        "${pkgname/m/M}-Linux-${_pkgver}.sh::hib://${pkgname/m/M}-Linux-${_pkgver}.sh")
sha256sums=('fe1a128a845747b230c55be6a15b5c2c77459f74a120668fe1b1c6f593c932cd'
            'f1f5aeb6b6792cf0f2d75f2cb1fdadbf998ceb4b7cc0df30813bff576cc9d6c3')

# hib scheme catch-all
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

# Modify depends for the arch type
if [ "$CARCH" = "x86_64" ]; then
    depends+=('lib32-glibc' 'lib32-sdl2' 'lib32-libgl' 'lib32-zlib' 'lib32-gcc-libs' 'lib32-libx11' 'lib32-libxext' 'lib32-libxcb' 'lib32-libxau' 'lib32-libxdmcp')
else
    depends+=('glibc' 'sdl2' 'libgl' 'zlib' 'gcc-libs' 'libx11' 'libxext' 'libxcb' 'libxau' 'libxdmcp')
fi

package() {
    # Binaries
    install -Dm755 "${srcdir}/data/x86/${pkgname^}.bin.x86" "${pkgdir}/opt/${pkgname}/${pkgname^}.bin.x86"

    install -m755 -d "$pkgdir/opt/$pkgname/lib/"
    install -m644 -t "$pkgdir/opt/$pkgname/lib/" "${srcdir}/data/x86/lib/libsteam_api.so" "${srcdir}/data/x86/lib/libfmodex-4.44.20.so"

    # Non-executable gameroot files
    install -m644 -t "$pkgdir/opt/$pkgname/" "${srcdir}/data/noarch/${pkgname^}.png" "${srcdir}/data/noarch/project.ini" "${srcdir}/data/noarch/README.linux"

    # Fonts
    install -m755 -d "$pkgdir/opt/$pkgname/Fonts/"
    find "${srcdir}/data/noarch/Fonts/" -maxdepth 1 -type f -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/Fonts/"

    cd "${srcdir}/data/noarch"

    # Lang
    install -m755 -d "$pkgdir/opt/$pkgname/Lang/"
    find "Lang/" -maxdepth 1 -mindepth 1 -type d -print0 | \
        while read -r -d $'\0' dir; do
            install -m755 -d "$pkgdir/opt/$pkgname/$dir/Strings/"
            find "$dir/Strings/" -maxdepth 1 -type f -print0 | \
                xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/$dir/Strings/"
        done

    # Images
    install -m755 -d "$pkgdir/opt/$pkgname/Images/"
    find "${srcdir}/data/noarch/Images/" -type f -name '*.bmp' -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/Images/"

    # Mag
    install -m755 -d "$pkgdir/opt/$pkgname/Mag/"
    find "${srcdir}/data/noarch/Mag/" -type f -not -name '.DS_Store' -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/Mag/"

    # Scripts
    install -m755 -d "$pkgdir/opt/$pkgname/Scripts/"
    find "${srcdir}/data/noarch/Scripts/" -maxdepth 1 -type f -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/Scripts/"

    # Shaders
    install -m755 -d "$pkgdir/opt/$pkgname/Shaders/"
    find "${srcdir}/data/noarch/Shaders/" -maxdepth 1 -type f -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/Shaders/"

    # Textures
    install -m755 -d "$pkgdir/opt/$pkgname/Textures/"
    find "${srcdir}/data/noarch/Textures/" -maxdepth 1 -mindepth 1 -not -name '.DS_Store' -print0 | \
        xargs -0 cp -R -t "$pkgdir/opt/$pkgname/Textures/"

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/${pkgname^}.bin.x86" "$pkgdir/usr/bin/$pkgname"

    # License
    #install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    #ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Icon
    install -m755 -d "$pkgdir/usr/share/pixmaps/"
    ln -s "/opt/$pkgname/${pkgname^}.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # .desktop File
    install -m755 -d "$pkgdir/usr/share/applications/"
    install -m644 -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname.desktop"
}
