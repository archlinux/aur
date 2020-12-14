# Maintainer: netcrusher < tobias AT miglix DOT eu >
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: mnabid

_basename=zoom
pkgname=$_basename-system-qt
pkgver=5.4.56259.1207
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
sha512sums=('4605fd402d39380fd168f5069d4373fdd715baf612d7fe1ea6e4c34705e1ce16501e06584d9ce357fb47e7a44993d759cfb89b376138f0cccddfd2d4011f18d9')

package() {
	cp -dpr --no-preserve=ownership opt usr "$pkgdir"
    cd "$pkgdir/opt/zoom"

    # Fix spurious RPATH in binaries
    patchelf --shrink-rpath zoom
    patchelf --shrink-rpath zopen

    rm -f qtdiag

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
    rm -rf Qt{,GraphicalEffects,Qml,Quick,Quick.2,Wayland}
    rm -rf wayland-*
    rm -f libmpg123.so
    rm -f libfaac1.so
    rm -f libturbojpeg.so{,.*}
    rm -f libquazip.so{,.*}
    rm qt.conf

    # Fix webcam showing black screen
    ln -sfv /usr/lib/libturbojpeg.so libturbojpeg.so

    # Remove unnecessary executable flag
    chmod -x *.pcm
    chmod -x sip/*.{wav,WAV}
}
