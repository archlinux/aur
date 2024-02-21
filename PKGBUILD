# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=showmidi-git
_pkgname=ShowMIDI
pkgver=0.9.0.r1.g48b7c3f
pkgrel=1
pkgdesc="Multi-platform GUI application to effortlessly visualize MIDI activity"
arch=("i686" "x86_64")
license=('GPLv3')
url="https://github.com/gbevin/ShowMIDI"
depends=('alsa-lib' 'freetype2' 'libxrandr' 'libxinerama' 'libxcursor')
makedepends=('pkg-config' 'cmake' 'git')
conflicts=('showmidi')
replaces=('showmidi')
source=("$_pkgname::git+https://github.com/gbevin/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    git submodule update --init --recursive
}

build() {
    export PATH_TO_JUCE=$srcdir/$_pkgname/JUCE
    cd $srcdir/$_pkgname/Builds/LinuxMakefile
    # Default on Linux is to build the VST2, VST3, and LV2 plugins. The
    # following flag disables building the VST2 plugin to avoid license
    # issues. If you have the VST2 SDK sources installed then you might want
    # to remove this and check the ShowMIDI build instructions.
    make CONFIG=Release JUCE_CPPFLAGS_VST="-DJucePlugin_Build_VST=0"
    # Build the CLAP module. This needs cmake.
    cd $srcdir/$_pkgname
    cmake -BBuilds/LinuxMakefile/build/clap -DCMAKE_BUILD_TYPE=Release
    cd $srcdir/$_pkgname/Builds/LinuxMakefile
    cmake --build build/clap --config Release
}

package() {
    # There's no install target, so we just install the standalone and the
    # plugins in the usual places. We also add an icon and desktop file in the
    # standard locations. Factory themes are installed under
    # /usr/share/ShowMIDI/Themes, so that's where you should go looking if you
    # want to load a theme in the setup dialog.

    # Desktop entry & pixmaps
    install -Dm644 "$srcdir/../showmidi.desktop" "${pkgdir}/usr/share/applications/showmidi.desktop"
    install -Dm644 "$srcdir/$_pkgname/Assets/appicon.png" "${pkgdir}/usr/share/pixmaps/showmidi.png"

    # Themes
    mkdir -p "${pkgdir}/usr/share/ShowMIDI"
    cp -r "$srcdir/$_pkgname/Themes" "${pkgdir}/usr/share/ShowMIDI"

    # Standalone
    install -Dm755 -T "$srcdir/$_pkgname/Builds/LinuxMakefile/build/ShowMIDI" "${pkgdir}/usr/bin/ShowMIDI"

    # Plugins
    mkdir -p "${pkgdir}/usr/lib/lv2"
    cp -r "$srcdir/$_pkgname/Builds/LinuxMakefile/build/ShowMIDI.lv2" "${pkgdir}/usr/lib/lv2"
    mkdir -p "${pkgdir}/usr/lib/vst3"
    cp -r "$srcdir/$_pkgname/Builds/LinuxMakefile/build/ShowMIDI.vst3" "${pkgdir}/usr/lib/vst3"
    mkdir -p "${pkgdir}/usr/lib/clap"
    cp  "$srcdir/$_pkgname/Builds/LinuxMakefile/build/clap/ShowMIDI_artefacts/Release/ShowMIDI.clap" "${pkgdir}/usr/lib/clap"
}
