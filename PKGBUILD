# Maintainer: xgdgsc <xgdgsc at gmail dot com>
pkgname=feeluown
_pkgname=FeelUOwn
pkgver=9.2a
pkgrel=1
pkgdesc="个性化音乐服务 For Mac And Linux"
arch=("any")
url="https://github.com/cosven/FeelUOwn"
license=('GPL3')
depends=('python-pyqt5' 'qt5-webkit' 'python-xlib' 'qt5-multimedia' 'python-requests' 'python-quamash' 'xdg-utils' 'python-sqlalchemy')
optdepends=('vlc')
provides=("feeluown")
conflicts=("feeluown")
source=("https://github.com/cosven/FeelUOwn/archive/v$pkgver.tar.gz")
md5sums=('975d67b1f75cab38f25418cefa300fb9')
_desktop="${_pkgname}.desktop"

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    cat > ${_desktop} << EOF
[Desktop Entry]
Type=Application
Name=FeelUOwn
Comment=FeelUOwn Launcher
Exec=${pkgname}
Icon=/usr/share/${pkgname}/icons/FeelUOwn.png
Categories=AudioVideo;Audio;Player;Qt;
Terminal=false
StartupNotify=true
EOF
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    python3 setup.py install --root="${pkgdir}" --optimize=1
    echo "#!/usr/bin/env sh" > "${pkgdir}/usr/bin/feeluown"
    echo "python -c 'from feeluown import __main__ as fu;fu.main()' \"\$@\"" >> "${pkgdir}/usr/bin/feeluown"

    rm -f "${pkgdir}/usr/bin/"{'feeluown-install-dev','feeluown-genicon','feeluown-update'}

    install -Dm644 './feeluown/feeluown.png' "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    install -Dm644 "${srcdir}/$_pkgname-$pkgver/${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
}
