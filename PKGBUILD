# Maintainer: Sergi122 <sergiopoma42@gmail.com>
pkgname=animalinux
# el repo de GitHub se llama distinto al paquete: el tarball de un tag se
# extrae como "AnimalinuxApp-$pkgver", no "$pkgname-$pkgver" — sin esto
# build()/package() fallan con "No such file or directory" (bug real,
# presente desde v0.2.0, nunca se había probado con una build de verdad).
_gitname=AnimalinuxApp
pkgver=0.8.4.5
pkgrel=1
pkgdesc="Mascotas animadas para tu escritorio (Hyprland, KDE, GNOME…): reaccionan a tu PC, juegan y hasta te juegan un partido; con editor de píxeles y de animación"
arch=('x86_64' 'aarch64')
url="https://github.com/Sergi122/AnimalinuxApp"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'python-pillow'
    'python-numpy'
    'python-xlib'
    'gtk4-layer-shell'
    'libayatana-appindicator'
)
optdepends=(
    'mpv: reproducción de audio en el editor de animación'
    'ffmpeg: exportar animaciones como MP4 y stickers de Telegram'
    'python-rembg: recorte de fondo con IA (requiere onnxruntime)'
    'python-onnxruntime: motor IA para rembg'
    'libwnck3: andar por bordes de ventana y pausa en pantalla completa (backend X11: GNOME/KDE/Xfce/MATE/Cinnamon)'
    'ollama: hablar con la mascota usando IA local'
    'ollama-cuda: la IA de la mascota en la tarjeta NVIDIA (mucho más rápida)'
    'python-vosk: hablar con la mascota por voz («ey <nombre>» y micrófono)'
    'python-faster-whisper: entender bien tu voz (si falta, la app lo instala sola con pip)'
    'pipewire: leer el micrófono con pw-record (o pulseaudio/alsa-utils)'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('628fd3e3ed0ed1c53b1986d2d19dc8d621f94763905754fa6023643b50e58f66')

build() {
    cd "$_gitname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_gitname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 animalinux.desktop "$pkgdir/usr/share/applications/animalinux.desktop"
    install -Dm644 animalinux.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/animalinux.png"
}
