# Maintainer: Toria <ninetailedtori@uwu.gal>

### Set this variable to yes to enable the generalised via udev rule.
# See https://get.vial.today/manual/linux-udev.html for more details.
: "${_via_udev:=no}"

_pkgname="vial"
_Pkgname="Vial"
pkgname="$_pkgname-git"
pkgdesc="Vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QMK fork for configuring your keyboard in real time."
pkgver=0.5
pkgrel=2
url="https://get.vial.today/"
license=("GPL-2.0-only")
arch=("any")
depends=('python>=3.6'
         'python-pipx'
         'python-altgraph>=0.17'
         'python-fbs>=0.9.0'
         'python-future>=0.18.2'
         'python-hidapi'
         'python-keyboard>=0.13.5'
         'python-macholib>=1.14'
         'python-pefile>=2019.4.18'
         'pyinstaller>=3.4'
         'python-pyqt5>=5.9.2'
         'python-simpleeval'
         'python-sip4>=4.19.8'
         'python-certifi')
makedepends=('git'
             'libusb'
             'ruby'
             'rubygems'
             'ruby-dotenv'
             'fpm'
             'imagemagick'
)
checkdepends=('python-pyqt5>=5.11.2'
              'python-pyqt5-sip>=4.19.19'
              'python-pytest>=7.0.1'
              'python-pytest-qt>=4.0.2'
              'python-pytest-xvfb>=2.0.0'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname-appimage")
pkg2appimage_url=$(wget -q https://api.github.com/repos/AppImageCommunity/pkg2appimage/releases -O - | grep 'pkg2appimage-.*-x86_64.AppImage' | grep browser_download_url | head -n 1 | cut -d '"' -f 4)
source=("$_Pkgname::git+https://github.com/vial-kb/vial-gui"
        "pkg2appimage.AppImage::$pkg2appimage_url"
        '59-vial.rules'
        '92-viia.rules'
)
noextract=('pkg2appimage.AppImage')
sha256sums=('SKIP'
            '6f74ec26ba14d2d8f1857d150704f9d585dae30b1ca30ce46f375c157b71d07d'
            'a6af0820ee6960dccab9ce0df0a898ccd0a50fecd992e341656dd1af78680502'
            'f91d36792b315caf9faa380860ae093fb1ef0ee966dad46023f033ab2ba7f22e')
sha384sums=('SKIP'
            'dc352cec7db6848126f7bebced61ee72a3f1b855ecff89b68a30613aafab3542027e173028a6a08dc8938cc0a5dce2f1'
            'decab0867ff4d986694af51a3d63365099a60d33c42507f4552923e212d6febacb63f3b9af51442e3d3f044a22be796c'
            'd9610feda8565d9acc748bdd4333b0a6e39525a505ee0331c865d4485d6786d85fca016beee7227a00b742cc08933d5d')
sha512sums=('SKIP'
            '7e7954963b0d679cf550757cbb639be5f33dcc951b9894a5bec494e9cc49ad67a93c1b00350d04d191916860b442e6b307eb848a303fde20fb34254d164f092a'
            'f3f9ef5998685766419503a8eb9b7d5e87211d6e3cc00d580bcc4bb6eca774b5ef158e4d0b30c387c958b9bf66bc3d8be4b6479905d296dde6ba179575797c00'
            '0178e610e722a2b69a0de3eaadceb6955649f7ffecfd9f2c85ebe3673965fb99352a422db77051c95e8364a386b42461393ac2493dfec618932be965e19536dc')
b2sums=('SKIP'
        '891699f8362e463008f25c9b2211acffd301487bad62657cdc9dca9c26521a188682736f23f596391f6d29e40150cfa0cfdd6112d39b2775e00848cbcd240d41'
        'da06e9b911ca5ae59054311ae477061dfd50bb9c43158f89c0041f0b0a4e67a4358ebc169d8fe533b298b165f323f011c432eb24e5be5f55242e7946c32674d9'
        'c8e395bfbc72c35cd5194b1db7bd130baaadfb8bbe404cd19b08fa50a2fff4c783d83e30ad1ff954d3d829f52a8e303cfad5b6820425da59a40cc7b48dd4b020')

pkgver() {
    cd $srcdir/$_Pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $srcdir
    chmod +x  $srcdir/pkg2appimage.AppImage
    fpm --version
}

check() {
    cd $srcdir/$_Pkgname
    fbs
}

build() {
    export LD_LIBRARY_PATH=$srcdir/$_pkgname/util/python36/prefix/lib/
    cd $srcdir/$_Pkgname
    fbs freeze
    fbs installer
    deactivate
    $srcdir/pkg2appimage.AppImage misc/$_Pkgname.yml

    chmod +x out/$_Pkgname-*.AppImage
    out/$_Pkgname-*.AppImage --appimage-extract
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=$_Pkgname|Exec=env DESKTOPINTEGRATION=false /usr/bin/$_Pkgname|"\
        "$srcdir/squashfs-root/$_Pkgname.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX $srcdir/squashfs-root/usr
}

package() {
    cd $srcdir/$_Pkgname

    # AppImage
    install -Dm755 out/$_Pkgname-*.AppImage "$pkgdir/opt/$pkgname/$_pkgname.AppImage"

    # Desktop file
    install -Dm644 "$srcdir/squashfs-root/$_Pkgname.desktop" "$pkgdir/usr/share/applications/$_Pkgname.desktop"

    # Icon images
    install -dm755 "$pkgdir/usr/share/"
    cp -a "$srcdir/squashfs-root/usr/share/icons" "$pkgdir/usr/share/"

    # Symlink executable
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_Pkgname/$_Pkgname.AppImage" "$pkgdir/usr/bin/$_pkgname"

    # Create Vial-specific udev rule: https://get.vial.today/manual/linux-udev.html#universal-vial-udev-rule
    install -Dm644 "$srcdir/59-vial.rules" "$pkgdir/usr/lib/udev/rules.d/59-vial.rules"

    if [ "$_via_udev" = "yes" ]; then
        # Create generalised Via udev rule: https://get.vial.today/manual/linux-udev.html#generalized-via-udev-rule
        install -Dm644 "$srcdir/92-vial.rules" "$pkgdir/usr/lib/udev/rules.d/92-vial.rules"
    fi
}
