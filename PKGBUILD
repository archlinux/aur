# Maintainer: Al <lokteam@protonmail.com>
pkgname=lokstt
pkgver=1.0.0
pkgrel=1
pkgdesc="A blazing-fast and stylish GTK4 dictation daemon (CPU Backend)"
arch=('x86_64')
url="https://github.com/lokteam/lokstt"
license=('MIT')
depends=(
    'gtk4'
    'portaudio'
    'alsa-lib'
    'jack'
    'whisper.cpp'
    'ydotool'
    'xdotool'
    'wl-clipboard'
)
makedepends=('go' 'git' 'pkgconf')
conflicts=('lokstt-vulkan' 'lokstt-cuda')
provides=('lokstt')
install='lokstt.install'

source=(
    "git+https://github.com/lokteam/lokstt.git"
    "ggml-tiny.bin::https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-tiny.bin"
    "ggml-base.bin::https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.bin"
    "ggml-small.bin::https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-small.bin"
    "ggml-medium-q5_0.bin::https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-medium-q5_0.bin"
    "ggml-large-v3-turbo-q5_0.bin::https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large-v3-turbo-q5_0.bin"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
    cd "lokstt"
    export CGO_CXXFLAGS="-std=c++11"
    GOSUMDB=off go build -o lokstt main.go
    cd client
    GOSUMDB=off go build -o lokstt-client main.go
}

package() {
    install -Dm755 "lokstt/lokstt" "$pkgdir/usr/bin/lokstt"
    install -Dm755 "lokstt/client/lokstt-client" "$pkgdir/usr/bin/lokstt-client"
    install -Dm644 "lokstt/lokstt-settings.desktop" "$pkgdir/usr/share/applications/lokstt-settings.desktop"
    
    # Install the systemd user service
    install -Dm644 "lokstt/lokstt.service" "$pkgdir/usr/lib/systemd/user/lokstt.service"
    install -d "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants"
    ln -s "../lokstt.service" "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants/lokstt.service"
    
    install -d "$pkgdir/usr/share/whisper-models"
    install -Dm644 "$srcdir"/ggml-*.bin -t "$pkgdir/usr/share/whisper-models/"
}