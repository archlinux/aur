# Maintainer: ResRipper <resripper@connective.link>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname=sakura-launcher-gui
pkgver=v1.2.0_beta
pkgrel=1
pkgdesc="A simple SakuraLLM launcher"
arch=(x86_64)
url='https://github.com/PiDanShouRouZhouXD/Sakura_Launcher_GUI'
license=('GPL-3.0-or-later')
options=(!debug)

makedepends=(
    'git'
    'python-pip'
)

source=(
    "$pkgname::git+https://github.com/PiDanShouRouZhouXD/Sakura_Launcher_GUI#tag=${pkgver/_/-}"
    main.spec
    sakura-launcher-gui.desktop
    sakura-launcher-gui.png
)

sha256sums=(
    fef9109ecf0a0b9effd98a816d805dd20dde5763beea03cf11fb434ee55542cf
    bf1bbb947272facbfcd85988d333fee754b166b4b79579b77ab1b4c448f7907b
    7ab67138f78271b1e35454dcbd542f0db6b3908cc0f1607ee67e259994bbe021
    307a4a88fcc2c62b11e7ca8cf9310ed0f755d8a5f8f4820d76c5874a980ba3d9
)

build() {
    cd "$pkgname" || exit
    
    # Install dependencies
    python -m venv .venv
    source .venv/bin/activate
    pip install -r requirements.txt

    # Build
    mv -f "$srcdir/main.spec" ./
    pyinstaller main.spec

    # Clean-up
    rm -rf .venv
}

package() {
    cd $pkgdir || exit

    # Icon
    install -dm0755 "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
    cp "$srcdir/sakura-launcher-gui.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
    chmod 644 "$pkgdir/usr/share/icons/hicolor/256x256/apps/sakura-launcher-gui.png"

    # Desktop file
    install -dm0755 "$pkgdir/usr/share/applications"
    cp "$srcdir/sakura-launcher-gui.desktop" "$pkgdir/usr/share/applications/"
    chmod 644 "$pkgdir/usr/share/applications/sakura-launcher-gui.desktop"

    # Install app
    # TODO: switch to 755 once customized data path is supported
    install -dm777 "$pkgdir/opt/sakura-launcher-gui"
    cp "$srcdir/$pkgname/dist/sakura_launcher" "$pkgdir/opt/sakura-launcher-gui/"
}
