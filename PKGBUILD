# Maintainer: Jeena <hello@jeena.net>
pkgname=recoder
pkgver=1.0.0
pkgrel=1
pkgdesc="A GTK4 video transcoding GUI application"
arch=('x86_64' 'aarch64')
url="https://github.com/jeena/recoder"
license=('GPL3')
depends=(
    'gtk4' 
    'libadwaita' 
    'gobject-introspection-runtime' 
    'python' 
    'python-gobject' 
    'ffmpeg'
    'glib2'
)
optdepends=(
  'libcanberra: play system notification sounds'
  'sound-theme-freedesktop: standard system sounds like "complete.oga"'
)
makedepends=(
    'python-setuptools'
    'python-build'
    'python-installer'
    'glib2'
)
source=("https://github.com/jeena/recoder/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2f3a56621e1e4e2faf295b460b45eeb2e7bbe21e74141ef6ebe0fd49c7160b41')

build() {
    cd "$srcdir/recoder-${pkgver}"

    glib-compile-resources src/resources/resources.xml \
        --target=src/recoder/resources.gresource \
        --sourcedir=src/resources
    
    python -m build --wheel --outdir dist
}

package() {
    cd "$srcdir/recoder-${pkgver}"
    
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 src/resources/net.jeena.Recoder.desktop \
        "$pkgdir/usr/share/applications/net.jeena.Recoder.desktop"
    install -Dm644 src/resources/net.jeena.Recoder.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/net.jeena.Recoder.svg"
    install -Dm644 src/resources/net.jeena.recoder.gschema.xml \
        "$pkgdir/usr/share/glib-2.0/schemas/net.jeena.recoder.gschema.xml"
}

install=recoder.install
