# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=qmplay2-bin
pkgver=19.12.19
pkgrel=1
_appimagerel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('x86_64')
url='https://github.com/zaps166/QMPlay2'
license=('LGPL')
depends=('qt5-base' 'qt5-svg' 'qt5-declarative' 'qt5-x11extras' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'taglib' 'libpulse' 'libgme')
optdepends=('pulseaudio: PulseAudio support'
            'game_music_emu-kode54-git: Better chiptune support (less bugs in sound, AUR package)')
conflicts=('qmplay2' 'qmplay2-git')
provides=('qmplay2')
options=(!strip)
makedepends=('fakeroot' 'patchelf' 'findutils')
source=("https://github.com/zaps166/QMPlay2/releases/download/${pkgver}/QMPlay2-${pkgver}-${_appimagerel}-x86_64.AppImage")
sha1sums=(9546bdc8d57c60a033076b80ab328ebc746d38c7)

prepare()
{
    chmod +x QMPlay2-${pkgver}-${_appimagerel}-x86_64.AppImage
}

build()
{
    ./QMPlay2-${pkgver}-${_appimagerel}-x86_64.AppImage --appimage-extract
}

package()
{
    cd $srcdir/squashfs-root
    mkdir -p $pkgdir/usr/bin $pkgdir/usr/lib
    cp -r usr/lib/qmplay2 $pkgdir/usr/lib/qmplay2
    cp -r usr/share $pkgdir/usr
    cp usr/bin/QMPlay2 $pkgdir/usr/bin
    cp usr/lib/libqmplay2.so $pkgdir/usr/lib
    mkdir -p $pkgdir/usr/lib/qmplay2/libs
    cp usr/lib/libav*.so* $pkgdir/usr/lib/qmplay2/libs
    cp usr/lib/libsw*.so* $pkgdir/usr/lib/qmplay2/libs
    cp usr/lib/libcd*.so* $pkgdir/usr/lib/qmplay2/libs
    cp usr/lib/libsidplayfp*.so* $pkgdir/usr/lib/qmplay2/libs
    chmod 755 `find $pkgdir/usr -type d`
    patchelf --set-rpath /usr/lib/qmplay2/libs $pkgdir/usr/bin/QMPlay2
    patchelf --set-rpath /usr/lib/qmplay2/libs $pkgdir/usr/lib/libqmplay2.so
    find $pkgdir/usr/lib/qmplay2/modules -type f | while read lib; do
        patchelf --set-rpath /usr/lib/qmplay2/libs $lib
    done
}
