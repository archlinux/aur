# Maintainer: Darian Alberto Camacho Salas <xonidu@gmail.com>

pkgname=xonimet
pkgver=2.1.0
pkgrel=5
pkgdesc="Extractor universal de metadatos para fotos, audio, video y documentos. Genera reportes PDF."
arch=('any')
url="https://github.com/XONIDU/xonimet"
license=('MIT')
depends=(
    'python'
    'python-pillow'
    'python-mutagen'
    'python-lxml'
    'python-openpyxl'
    'ffmpeg'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('ffmpeg: necesario para extraer metadatos de videos')
source=("$pkgname-$pkgver.tar.gz::https://github.com/XONIDU/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # Crear setup.py para instalar con pip
    cat > setup.py << EOF
from setuptools import setup, find_packages

setup(
    name="$pkgname",
    version="$pkgver",
    py_modules=["xonimet"],
    scripts=["start.py"],
    data_files=[
        ("share/$pkgname", ["xonimet.py"]),
    ],
)
EOF
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Usar pip install sin --target para instalar en el directorio correcto
    pip install --no-deps --prefix="$pkgdir/usr" .
    
    # Renombrar start.py a xonimet en /usr/bin
    mv "$pkgdir/usr/bin/start.py" "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"
    
    # Crear directorio de documentación
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
