# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>

_basename=zoom
pkgname="$_basename-system-qt"
pkgver=5.2.446620.0816
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
sha512sums=('13e57dbe061ef6c1045010c0f39dc1ae660b1495c165f17ca441d82c2ec0c5a8b8201f6a4f35c7bde0bd68a00b9ebab62ebf66424deff0d31bea16956fbcc011')

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
