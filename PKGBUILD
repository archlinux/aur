# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: marlock <marlock87 at hotmail dot com>

_name="mapcatcher"
_python="python2"
pkgname="gmapcatcher"
pkgver=0.8.0.4
pkgrel=1
pkgdesc="GMapCatcher is an offline maps viewer"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gmapcatcher"
license=('GPL2')
depends=('python2' 'pygtk' 'gtk2' 'python2-cairo' 'python2-gobject2')
conflicts=('gmapcatcher-svn')
provides=('gmapcatcher')
install="${pkgname}.install"
source=("http://${pkgname}.googlecode.com/files/${_name}_${pkgver}.tar.gz" "${pkgname}.png")
md5sums=('2485bac859e6d7f0135b47329117d301'
         'bc0ce84192f1a60087662310c24cab8f')

_gmapcatcher_desktop="[Desktop Entry]
Name=GMapCatcher
Version=0.8.0.4
GenericName=Offline Map Viewer
Comment=Download maps, view whenever you need to, view gps
Comment[es]=Bajar y ver mapas sin conexion
Exec=mapcatcher
Icon=/usr/share/pixmaps/gmapcatcher.png
Terminal=false
Type=Application
Categories=GNOME;Application;Network;Viewer;
StartupNotify=true"

build() {
    cd "${srcdir}"
    echo -e "$_gmapcatcher_desktop" | tee "${pkgname}.desktop"

    cd "${_name}-${pkgver}"
    export PYTHON="/usr/bin/${_python}"
    ${_python} setup.py build
}

package() {
    cd "${_name}-${pkgver}"
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
