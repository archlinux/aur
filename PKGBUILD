# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>

_basename=zoom
pkgname="$_basename-system-qt"
pkgver=5.2.458699.0906
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
sha512sums=('43723db43b28cd48b31e2e3111e36ee5c7e131e158ca0c4a92c14b4df42fb206beb792f94ffb1e93dfa9462131d11bd08152b48bf33023e8595462a32e8c477d')

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
