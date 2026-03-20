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
options=("!debug")
install='lokstt.install'

source=(
    "git+https://github.com/lokteam/lokstt.git"
    "ggml-tiny.bin::https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-tiny.bin"
    "ggml-base.bin::https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.bin"
    "ggml-small.bin::https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-small.bin"
    "ggml-medium-q5_0.bin::https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-medium-q5_0.bin"
    "ggml-large-v3-turbo-q5_0.bin::https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large-v3-turbo-q5_0.bin"
)
sha256sums=('SKIP'
            'be07e048e1e599ad46341c8d2a135645097a538221678b7acdd1b1919c6e1b21'
            '60ed5bc3dd14eea856493d334349b405782ddcaf0028d4b5df4088345fba2efe'
            '1be3a9b2063867b937e64e2ec7483364a79917e157fa98c5d94b5c1fffea987b'
            '19fea4b380c3a618ec4723c3eef2eb785ffba0d0538cf43f8f235e7b3b34220f'
            '394221709cd5ad1f40c46e6031ca61bce88931e6e088c188294c6d5a55ffa7e2')

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