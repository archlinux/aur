# Maintainer: wenLiangcan <boxeed at gmail dot com>

_pkgname=feeluown
pkgname="${_pkgname}-git"
pkgver=9.2a.42.gb1dd057
pkgrel=1
epoch=1
pkgdesc="个性化音乐服务 For Mac And Linux"
arch=("any")
url="https://github.com/cosven/FeelUOwn"
license=('GPL3')
depends=('python-pyqt5' 'python-requests' 'python-quamash' 'qt5-multimedia' 'python-crypto' 'xdg-utils' 'sh' 'gst-plugins-ugly' 'gst-plugins-bad' 'gst-plugins-good' 'python-beautifulsoup4')
optdepends=('vlc'
            'feeluown-mpris2-plugin-git: MPRIS support')
makedepends=('git' 'python-setuptools')
provides=("${_pkgname}==${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::'git://github.com/cosven/FeelUOwn.git')
md5sums=('SKIP')
install="${pkgname}.install"
_desktop="${_pkgname}.desktop"

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed 's/^v//;s/release./r/;s/-/./g'
}

prepare() {
    cd "${srcdir}"
    cat > ${_desktop} << EOF
[Desktop Entry]
Type=Application
Name=FeelUOwn
Comment=FeelUOwn Launcher
Exec=${_pkgname}
Icon=${_pkgname}
Categories=AudioVideo;Audio;Player;Qt;
Terminal=false
StartupNotify=true
EOF
}

package() {
    cd "${srcdir}/${_pkgname}"

    python3 setup.py install --root="${pkgdir}" --optimize=1
    echo "#!/usr/bin/env sh" > "${pkgdir}/usr/bin/feeluown"
    echo "python -c 'from feeluown import __main__ as fu;fu.main()' \"\$@\"" >> "${pkgdir}/usr/bin/feeluown"

    rm -f "${pkgdir}/usr/bin/"{'feeluown-install-dev','feeluown-genicon','feeluown-update'}

    install -Dm644 './feeluown/feeluown.png' "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    install -Dm644 "${srcdir}/${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
}

