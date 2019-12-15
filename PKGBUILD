# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: marlock <marlock87 at hotmail dot com>
#
_name="mapcatcher"
_python="python2"
pkgname="gmapcatcher"
pkgver="0.8.0.9"
pkgrel="1"
pkgdesc="Offline maps viewer"
arch=('any')
url="https://github.com/heldersepu/GMapCatcher"
license=('GPL2')
depends=('python2' 'pygtk' 'gtk2' 'python2-cairo' 'python2-gobject2')
conflicts=('gmapcatcher-svn')
source=("${pkgname}.png"
        "${_name}_${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)
sha256sums=('d3421d3a2ad41f0d9de1e1aa76366a8c6a1811da80f29d1dba2b853662ee29d1'
            'aaedf4701ae686c301316ee947c6066c260938deb94891e0f83e758e62767e46')

_gmapcatcher_desktop="[Desktop Entry]
Name=GMapCatcher
Version=${pkgver}
GenericName=Offline Maps Viewer
Comment=Download maps, view whenever you need to, view gps
Exec=mapcatcher
Icon=gmapcatcher
Terminal=false
Type=Application
Categories=GNOME;Application;Network;Viewer;
StartupNotify=true"

prepare() {
    cd *-${pkgver}
    mv ./installer/setup.py ./
    cp maps.py mapcatcher
    cp download.py mapdownloader
    cp README.md README
    cp changelog.md changelog
    cp man/mapcatcher.1 man/mapcatcher.1.gz
    cp man/mapdownloader.1 man/mapdownloader.1.gz
    cp images/map.png images/mapcatcher.png
}

build() {
    cd "${srcdir}"
    echo -e "$_gmapcatcher_desktop" | tee "${pkgname}.desktop"

    cd *-${pkgver}
    export PYTHON="/usr/bin/${_python}"
    ${_python} setup.py build
}

package() {
    cd *-"${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1

    cd "${pkgdir}"
    rm -rf ./usr/share/doc

    # Install GMapCatcher Icon
    rm -r ./usr/share/pixmaps/mapcatcher.png
    install -m644 ${srcdir}/gmapcatcher.png ${pkgdir}/usr/share/pixmaps

    # Install desktop shortcut
    rm -r ./usr/share/applications/gmapcatcher.desktop
    install -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
