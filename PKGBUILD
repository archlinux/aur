# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>

_basename=zoom
pkgname="$_basename-system-qt"
pkgver=5.1.412382.0614
pkgrel=1
pkgdesc="Video Conferencing and Web Conferencing Service - system Qt libraries"
arch=('x86_64')
license=('custom')
url='https://zoom.us/'
provides=('zoom')
conflicts=('zoom')
makedepends=('patchelf')
depends=('ttf-font' 'pulseaudio-alsa'
    'qt5-base' 'qt5-graphicaleffects' 'qt5-imageformats' 'qt5-quickcontrols' 'qt5-quickcontrols2'
    'qt5-svg' 'qt5-script' 'qt5-declarative')
optdepends=('qt5-webengine: SSO login support'
			'picom: extra compositor needed by some window managers for screen sharing'
			'xcompmgr: extra compositor needed by some window managers for screen sharing')
options=(!strip)
source=("${pkgname}-${pkgver}_orig_x86_64.pkg.tar.xz"::"https://zoom.us/client/${pkgver}/zoom_x86_64.pkg.tar.xz")
sha512sums=('c83a5eae76933d2280e3e054654b09743ad138094322562a5198f3f1dd9d8a85bc758fe574a13adc62d162d3268dc5231416f6752ce25792757b8e60b7ae7da0')

package() {
	cp -dpr --no-preserve=ownership opt usr "${pkgdir}"

    cd "${pkgdir}/opt/zoom"
    # Fix spurious RPATH in binaries
    patchelf --shrink-rpath zoom
    patchelf --shrink-rpath zopen

    rm -f qtdiag

    # Remove Qt libraries
    rm -f libQt5*.so{,.*}
    rm -f libicu*.so{,.*}

    rm -rf {egldevice,xcbgl}integrations
    rm -rf audio
    rm -rf generic
    rm -rf iconengines
    rm -rf imageformats
    rm -rf platforms
    rm -rf platforminputcontexts
    rm -rf platformthemes
    rm -rf Qt{,GraphicalEffects,Qml,Quick,Quick.2}
    rm -f libmpg123.so
    rm -f libfaac1.so
    rm -f libturbojpeg.so{,.*}
    rm -f libquazip.so{,.*}

    rm qt.conf

    # Remove unnecessary executable flag
    chmod -x *.pcm
    chmod -x *.pem
    chmod -x sip/*.{wav,WAV}
}
