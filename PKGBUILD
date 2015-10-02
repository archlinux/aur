# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=feeluown-git
_pkgname=FeelUOwn
pkgver=20151002
pkgrel=1
pkgdesc="个性化音乐服务 For Mac And Linux"
arch=("any")
url="https://github.com/cosven/FeelUOwn"
license=('MIT')
depends=('python-pyqt5' 'qt5-webkit' 'python-xlib' 'qt5-multimedia' 'python-requests' 'python-quamash-qt5' 'xdg-utils')
optdepends=('vlc')
makedepends=('git')
provides=("feeluown")
conflicts=("feeluown")
source=('git://github.com/cosven/FeelUOwn.git')
md5sums=('SKIP')
_desktop="${_pkgname}.desktop"

pkgver() {
    cd "$srcdir/$_pkgname"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "$srcdir"
    cat > ${_desktop} << EOF
[Desktop Entry]
Type=Application
Name=FeelUOwn
Comment=FeelUOwn Launcher
Exec=${_pkgname}
Icon=/usr/share/${pkgname}/icons/FeelUOwn.png
Categories=AudioVideo;Audio;Player;Qt;
Terminal=false
StartupNotify=true
EOF

    cat > "${_pkgname}.sh" << EOF
#!/usr/bin/env sh
DATA_PATH="\${HOME}/.${_pkgname}"
if [ ! -d \${DATA_PATH} ]; then
    mkdir -p \${DATA_PATH}
fi
python /usr/share/${pkgname}/src/main.py
EOF

    # save login data to ~/.FeelUOwn
    cd "$srcdir/$_pkgname/src"
    sed -i '2 i import os' constants.py
    sed -i 's!^DATA_PATH.*$!DATA_PATH = os.path.join(os.path.expanduser("~"), ".FeelUOwn/")!g' constants.py
}

package() {
    cd "$srcdir/$_pkgname"
    find ./src -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/share/${pkgname}/{}" \;

    find ./icons -type f -exec install -Dm644 {} \
        "${pkgdir}/usr/share/${pkgname}/{}" \;
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
