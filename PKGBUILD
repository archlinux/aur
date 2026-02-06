# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164
# Maintainer: Toria <ninetailedtori@uwu.gal>

### Set this variable to yes to enable the generalised via udev rule.
# See https://get.vial.today/manual/linux-udev.html for more details.
: "${_via_udev:=no}"

_pkgname="vial"
_Pkgname="Vial"
pkgname="$_pkgname-git"
pkgdesc="Vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QMK fork for configuring your keyboard in real time."
pkgver=0.5
pkgrel=3
url="https://get.vial.today/"
license=("GPL-2.0-only")
arch=("any")
depends=(
    'python>=3.6'
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
    'python-certifi'
)
makedepends=(
    'git'
    'libusb'
    'ruby'
    'rubygems'
    'ruby-dotenv'
    'fpm'
    'imagemagick'
    'pkg2appimage'
)
checkdepends=('python-pyqt5>=5.11.2'
              'python-pyqt5-sip>=4.19.19'
              'python-pytest>=7.0.1'
              'python-pytest-qt>=4.0.2'
              'python-pytest-xvfb>=2.0.0'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname-appimage")
source=("$_Pkgname::git+https://github.com/vial-kb/vial-gui"
        '59-vial.rules'
        '92-viia.rules'
)

pkgver() {
    cd "$srcdir/$_Pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
    cd "$srcdir/$_Pkgname"
    fbs
}

build() {
    export LD_LIBRARY_PATH=$srcdir/$_pkgname/util/python36/prefix/lib/
    cd "$srcdir/$_Pkgname"
    fbs freeze
    fbs installer
    deactivate
    pkg2appimage misc/$_Pkgname.yml

    chmod +x out/$_Pkgname-*.AppImage
    eval out/$_Pkgname-*.AppImage --appimage-extract
    # Adjust .desktop so it will work outside of AppImage container
    sed -i -E "s|Exec=$_Pkgname|Exec=env DESKTOPINTEGRATION=false /usr/bin/$_Pkgname|"\
        "$srcdir/squashfs-root/$_Pkgname.desktop"
    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX "$srcdir/squashfs-root/usr"
}

package() {
    cd "$srcdir/$_Pkgname"

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
b2sums=('SKIP'
        'da06e9b911ca5ae59054311ae477061dfd50bb9c43158f89c0041f0b0a4e67a4358ebc169d8fe533b298b165f323f011c432eb24e5be5f55242e7946c32674d9'
        'c8e395bfbc72c35cd5194b1db7bd130baaadfb8bbe404cd19b08fa50a2fff4c783d83e30ad1ff954d3d829f52a8e303cfad5b6820425da59a40cc7b48dd4b020')
sha512sums=('SKIP'
            'f3f9ef5998685766419503a8eb9b7d5e87211d6e3cc00d580bcc4bb6eca774b5ef158e4d0b30c387c958b9bf66bc3d8be4b6479905d296dde6ba179575797c00'
            '0178e610e722a2b69a0de3eaadceb6955649f7ffecfd9f2c85ebe3673965fb99352a422db77051c95e8364a386b42461393ac2493dfec618932be965e19536dc')
sha384sums=('SKIP'
            'decab0867ff4d986694af51a3d63365099a60d33c42507f4552923e212d6febacb63f3b9af51442e3d3f044a22be796c'
            'd9610feda8565d9acc748bdd4333b0a6e39525a505ee0331c865d4485d6786d85fca016beee7227a00b742cc08933d5d')
sha256sums=('SKIP'
            'a6af0820ee6960dccab9ce0df0a898ccd0a50fecd992e341656dd1af78680502'
            'f91d36792b315caf9faa380860ae093fb1ef0ee966dad46023f033ab2ba7f22e')
