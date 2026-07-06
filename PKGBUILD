# Maintainer: Maxsspeaker <voidfox@maxsspeaker.space>

pkgname=msmp-foxwave
pkgver=6.0.1pre
pkgrel=4
pkgdesc="MSMP FoxWave - streaming audio player for PC"
arch=('x86_64')
url="https://github.com/maxsspeaker/MSMP-6"
license=('GPL3')

depends=(
    'yt-dlp' 
    'pyside6' 
    'ffmpeg' 
    'deno'
    'python' 
    'glibc' 
    'qt6-base' 
    'qt6-declarative' 
    'python-dbus-next'
)
makedepends=(
    'git'
    'python-pip'
    'gcc' 
    'patchelf'
)

source=(
    "git+https://github.com/maxsspeaker/MSMP-6.git#commit=e2de6ece3ad095b48594"
)
sha256sums=(
    'SKIP'
)

prepare() {
    cd "$srcdir/MSMP-6"

    python3.14 -m venv .venv --system-site-packages

    source .venv/bin/activate
    pip install --upgrade pip
    pip install discord-rpc
}

build() {
    cd "$srcdir/MSMP-6"

    source .venv/bin/activate
}

package() {
    cd "$srcdir/MSMP-6"

    install -d "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/share/applications/"

    cp -r $srcdir/MSMP-6/* "$pkgdir/opt/$pkgname/"
    cp -r $srcdir/MSMP-6/.venv* "$pkgdir/opt/$pkgname/"

    echo """#!/usr/bin/sh
        cd /opt/$pkgname
        QT_AUDIO_BACKEND="PulseAudio" /opt/$pkgname/.venv/bin/python main.py""" > $pkgdir/opt/$pkgname/msmp-foxwave

    echo """[Desktop Entry]
Categories=AudioVideo;Audio;Player;
Comment[ru_RU]=Стриминговый медиа плеер для YouTube
Comment=streaming audio player for YouTube
Exec=msmp-foxwave
Icon=/opt/$pkgname/resources/MSMPicon.png
MimeType=application/x-plmsmpsbox;
Name=MSMP FoxWave
Path=/opt/$pkgname
Terminal=false
Type=Application""" > $pkgdir/usr/share/applications/msmp-foxwave.desktop

    chmod +x $pkgdir/opt/$pkgname/msmp-foxwave

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/msmp-foxwave" "$pkgdir/usr/bin/$pkgname"
}