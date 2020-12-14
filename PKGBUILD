# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: mnabid

_basename=zoom
pkgname=$_basename-system-qt
pkgver=5.4.53391.1108
pkgrel=3
pkgdesc='Video Conferencing and Web Conferencing Service - system Qt libraries'
arch=('x86_64')
license=('custom')
url='https://zoom.us'
provides=("$_basename")
conflicts=("$_basename")
makedepends=('patchelf')
depends=('ttf-font'
         'libjpeg-turbo'
         'qt5-base'
         'qt5-graphicaleffects'
         'qt5-imageformats'
         'qt5-quickcontrols'
         'qt5-quickcontrols2'
         'qt5-svg'
         'qt5-script'
         'qt5-declarative')
optdepends=('qt5-webengine: SSO login support'
            'picom: extra compositor needed by some window managers for screen sharing'
            'xcompmgr: extra compositor needed by some window managers for screen sharing'
            'pulseaudio-alsa: output sound via pulseaudio' )
options=(!strip)
source=("$pkgname-$pkgver-orig-$arch.pkg.tar.xz::$url/client/$pkgver/${_basename}_$arch.pkg.tar.xz")
sha512sums=('c543a805130255bec1ad7fc7ccc6dd9a37711d73bd9f2fac62a57913210e1ea54a679ea4627c7166b2c6168e42d1b41f457fc2f6989f57296df4933b0e49f2a1')

_syslib() {
    rm -f $1{,.*}
    case $1 in
        *Qt5*) return ;;
        *) ln -sfv /usr/lib/${2:-$1} $1 ;;
    esac
}

_sysqtplugin() {
    rm -rf $(basename $1)
    # ln -sfv /usr/lib/qt/plugins/$1
}

package() {
    cp -dpr --no-preserve=ownership opt usr "$pkgdir"
    cd "$pkgdir/opt/zoom"

    # Fix spurious RPATH in binaries
    patchelf --shrink-rpath zoom
    patchelf --shrink-rpath zopen

    _sysqtplugin audio
    _sysqtplugin egldeviceintegrations
    _sysqtplugin generic
    _sysqtplugin iconengines
    _sysqtplugin imageformats
    _sysqtplugin platforminputcontexts
    _sysqtplugin platforms
    _sysqtplugin platformthemes
    _sysqtplugin xcbglintegrations

    # rm -f qtdiag
    rm -rf Qt{,GraphicalEffects,Qml,Quick,Quick.2,Wayland}
    rm -rf wayland-*
    rm qt.conf

    _syslib libQt5Core.so
    _syslib libQt5DBus.so
    _syslib libQt5Gui.so
    _syslib libQt5Network.so
    _syslib libQt5OpenGL.so
    _syslib libQt5OpenGL.so
    _syslib libQt5Qml.so
    _syslib libQt5Qml.so
    _syslib libQt5Quick.so
    _syslib libQt5QuickControls2.so
    _syslib libQt5QuickTemplates2.so
    _syslib libQt5QuickWidgets.so
    _syslib libQt5Script.so
    _syslib libQt5Svg.so
    _syslib libQt5WaylandClient.so
    _syslib libQt5WaylandCompositor.so
    _syslib libQt5Widgets.so
    _syslib libQt5X11Extras.so
    _syslib libQt5XcbQpa.so

    _syslib libfaac1.so libfaac.so
    _syslib libfdkaac2.so libfdk-aac.so
    _syslib libicudata.so
    _syslib libicui18n.so
    _syslib libicuuc.so
    _syslib libmpg123.so
    _syslib libquazip.so libquazip1-qt5.so
    # _syslib libturbojpeg.so

    ldconfig -N -n ./

    # Remove unnecessary executable flag
    chmod -x *.pcm sip/*.{wav,WAV}
}
