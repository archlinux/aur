# Maintainer: Dāvis Mosāns <davispuh at gmail dot com>

_pkgname=qt5-tools
pkgname=$_pkgname-git
pkgver=v5.15.0.r76.g33693a92
pkgrel=1
pkgdesc='A cross-platform application and UI framework (Development Tools, QtHelp)'
arch=('i686' 'x86_64')
url='https://code.qt.io/cgit/qt/qttools.git'
license=('GPL3' 'LGPL')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('git')
install='qt5-tools.install'
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('staticlibs') # libQt5UiTools builds as static only
source=("$_pkgname::git+https://code.qt.io/qt/qttools.git#branch=5.15"
        'assistant.desktop' 'designer.desktop' 'linguist.desktop' 'qdbusviewer.desktop')
sha256sums=('SKIP'
            'a34645c26ccedfd95a1285c316564828dc1a4da00072490d8be419b874286b55'
            '6a0666df1954e3a522b269e8c5278a346c37df6a33b0501a3c11e200e7e8c72e'
            '01378a279f7894b5a86bef08929835366f6c82b10410b41fe87053ba61e074e2'
            '309917aee2c0b0649f4043eb93c5dc1739640e741379214d2c684978e8eab6e9'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir"
    mkdir -p build
}

build() {
    cd "$srcdir/build"

    qmake "../$_pkgname"
    make
}

package() {
    cd "$srcdir/build"

    make INSTALL_ROOT="$pkgdir" install

    # install missing icons and desktop files
    for icon in $srcdir/$_pkgname/src/linguist/linguist/images/icons/linguist-*-32.png ; do
        size=$(echo $(basename ${icon}) | cut -d- -f2)
        install -p -D -m644 ${icon} "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/linguist.png"
    done
    
    install -D -m644 $srcdir/$_pkgname/src/assistant/assistant/images/assistant.png \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/assistant.png"
    install -D -m644 $srcdir/$_pkgname/src/assistant/assistant/images/assistant-128.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/assistant.png"
    install -D -m644 $srcdir/$_pkgname/src/designer/src/designer/images/designer.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/QtProject-designer.png"
    install -D -m644 $srcdir/$_pkgname/src/qdbus/qdbusviewer/images/qdbusviewer.png \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/qdbusviewer.png"
    install -D -m644 $srcdir/$_pkgname/src/qdbus/qdbusviewer/images/qdbusviewer-128.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qdbusviewer.png"

    install -d "${pkgdir}/usr/share/applications"
    install -m644 "${srcdir}"/{linguist,designer,assistant,qdbusviewer}.desktop \
        "${pkgdir}/usr/share/applications/"

    # Useful symlinks
    install -d "${pkgdir}"/usr/bin
    for b in "${pkgdir}"/usr/bin/*; do
        ln -s /usr/bin/$(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-qt5
    done

    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -D -m644 $srcdir/$_pkgname/LICENSE.* "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
