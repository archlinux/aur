# Maintainer: fenuks

_pkgname=qllauncher
pkgname=$_pkgname-git
pkgver=0.6.0.2.g25c916a
pkgrel=2
pkgdesc="Native standalone application to launch Quake Live on Linux"
arch=("i686" "x86_64")
url="https://bitbucket.org/fx_/quakelivelauncher/overview"
license=("GPL3")
depends=("python" "python-opengl" "python-requests" "python-sleekxmpp"
        "python-pyqt5" "qt5-declarative" "qt5-multimedia" "qt5-graphicaleffects"
        "qt5-quickcontrols" "wine" "xorg-server-utils"
)
makedepends=("git" "python-setuptools")  
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$pkgname.install
source=("$_pkgname::git+https://bitbucket.org/fx_/quakelivelauncher.git"
        "python-qllauncher::git+https://bitbucket.org/fx_/python3-qllauncher.git"
        "fxqmlcontrols::git+https://bitbucket.org/fx_/fx-qml-controls.git"
        "fxqmlhelpers::git+https://bitbucket.org/fx_/fx-qml-helpers.git"
)

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed "s/-/./g"
}

prepare(){
    cd "$srcdir/$_pkgname/ui/views/controls"
    sed -i "s/updateCheckerBackend.installGameTo/updateCheckerBackend._download_and_install_new_game/" QLLUpdateChecker.qml
}

build() {
    cd "$srcdir/fxqmlcontrols/fxqmlcontrols"
    qmake fxqmlcontrols.pro
    make

    cd "$srcdir/fxqmlhelpers/fxqmlhelpers"
    qmake fxqmlhelpers.pro
    make
}

package() {
    cd "$srcdir/$_pkgname"
    install -dm755 "$pkgdir/opt/$_pkgname/"
    install -d "$pkgdir/usr/bin/"
    cp -r {ui,sounds,helpers} "$pkgdir/opt/$_pkgname/"
    install -Dm755 main.py "$pkgdir/opt/$_pkgname/main.py"
    ln -s "/opt/$_pkgname/main.py" "$pkgdir/usr/bin/qllauncher"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 ui/images/quakelivelogo.png "$pkgdir/usr/share/pixmaps/quakelivelogo.png"

    cd "$srcdir/python-qllauncher"
    python setup.py install --root="$pkgdir"

    cd "$srcdir/fxqmlcontrols/fxqmlcontrols"
    make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install 

    cd "$srcdir/fxqmlhelpers/fxqmlhelpers"
    make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install
}
