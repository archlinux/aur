# Maintainer: Sergi122 <sergiopoma42@gmail.com>
pkgname=animalinux
# el repo de GitHub se llama distinto al paquete: el tarball de un tag se
# extrae como "AnimalinuxApp-$pkgver", no "$pkgname-$pkgver" — sin esto
# build()/package() fallan con "No such file or directory" (bug real,
# presente desde v0.2.0, nunca se había probado con una build de verdad).
_gitname=AnimalinuxApp
pkgver=0.8.5.1
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
    # todo lo de las funciones viene instalado (antes eran opcionales):
    'python-onnxruntime'   # recorte de fondo con IA (el modelo se baja solo)
    'ffmpeg'               # importar vídeos, exportar MP4 y stickers
    'mpv'                  # sonido en el editor de animación
    'python-vosk'          # hablarle a la mascota con la voz
    'ollama'               # IA local para que te responda
    'libwnck3'             # bordes de ventana y pantalla completa en X11
    'python-pip'           # Whisper se instala solo con un clic desde la app
)
optdepends=(
    'ollama-cuda: la IA de la mascota en la tarjeta NVIDIA (mucho más rápida; la app lo instala con un clic)'
    'pipewire: leer el micrófono con pw-record (o pulseaudio/alsa-utils)'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9c7c2628e90207432ada88efe89af453d49a4d848d7c37ea1f9cb80b91c07b10')

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
