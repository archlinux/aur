# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=ctrlrx-dev
pkgver=5.6.35.juce8.x11scaling
pkgrel=1
pkgdesc="MIDI controller software - alternative fork of Ctrlr with extra features"
arch=('x86_64')
url="https://github.com/randrej/CtrlrX"
license=('BSD-3-Clause' 'GPL-2.0-or-later')
depends=('alsa-lib' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'freetype2' 'mesa' 'curl' 'libtiff')
makedepends=('git' 'boost' 'libxi' 'binutils' 'systemd' 'mesa' 'xorgproto' 'pkgconf' 'juce' 'cmake' 'ninja')
optdepends=('jack: for JACK audio support'
            'pulseaudio: for PulseAudio support')
source=("$pkgname::git+https://github.com/randrej/CtrlrX.git#branch=aradovic_juce8_upgrade")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"

    cmake -B build -S . \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCTRLRX_COPY_PLUGIN_AFTER_BUILD=OFF \
        -Wno-dev

    cmake --build build --target CtrlrX_Standalone CtrlrX_VST3
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "build/CtrlrX_artefacts/None/Standalone/CtrlrX" "$pkgdir/usr/bin/ctrlrx"
    install -d "$pkgdir/usr/lib/vst3"
    cp -a "build/CtrlrX_artefacts/None/VST3/CtrlrX.vst3" "$pkgdir/usr/lib/vst3/"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE-BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE-BSD"
    install -Dm644 LICENSE-GPL "$pkgdir/usr/share/licenses/$pkgname/LICENSE-GPL"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ctrlrx.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=CtrlrX
Comment=MIDI controller software
Exec=ctrlrx
Icon=ctrlrx
Categories=AudioVideo;Audio;Midi;
DESKTOP

    install -Dm644 Source/Resources/Icons/CtrlrX-Logo-vector-DEF.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/ctrlrx.svg"
}
