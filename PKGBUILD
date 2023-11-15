# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=showmidi
_pkgname=ShowMIDI
pkgver=0.6.0
pkgrel=1
pkgdesc="Multi-platform GUI application to effortlessly visualize MIDI activity"
arch=("i686" "x86_64")
license=('GPLv3')
url="https://github.com/gbevin/ShowMIDI"
depends=('alsa-lib' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor')
makedepends=('pkg-config')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/gbevin/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('d8f8ce9c28d720d5c829481713ccb99b')

build() {
    cd $srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile
    # Default on Linux is to build the VST2, VST3, and LV2 plugins. The
    # following flag disables building the VST2 plugin to avoid license
    # issues. If you have the VST2 SDK sources installed then you might want
    # to remove this and check the ShowMIDI build instructions.
    make CONFIG=Release JUCE_CPPFLAGS_VST="-DJucePlugin_Build_VST=0"
}

package() {
    # There's no install target, so we just install the standalone and the
    # plugins in the usual places. We also add an icon and desktop file in the
    # standard locations. Factory themes are installed under
    # /usr/share/ShowMIDI/Themes, so that's where you should go looking if you
    # want to load a theme in the setup dialog.

    # Desktop entry & pixmaps
    install -Dm644 "$srcdir/../$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$_pkgname-$pkgver/Assets/appicon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"

    # Themes
    mkdir -p "${pkgdir}/usr/share/ShowMIDI"
    cp -r "$srcdir/$_pkgname-$pkgver/Themes" "${pkgdir}/usr/share/ShowMIDI"

    # Standalone
    install -Dm755 -T "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile/build/ShowMIDI" "${pkgdir}/usr/bin/ShowMIDI"

    # Plugins
    mkdir -p "${pkgdir}/usr/lib/lv2"
    cp -r "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile/build/ShowMIDI.lv2" "${pkgdir}/usr/lib/lv2"
    mkdir -p "${pkgdir}/usr/lib/vst3"
    cp -r "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile/build/ShowMIDI.vst3" "${pkgdir}/usr/lib/vst3"
}
