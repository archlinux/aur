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
source=("$_Pkgname::git+https://github.com/vial-kb/vial-gui"
        '59-vial.rules'
        '92-viia.rules'
)

pkgver() {
    cd $srcdir/$_Pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
