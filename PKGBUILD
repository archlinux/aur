# Maintainer: Marek Samec
pkgname=qt-msg-reader
pkgver=0.1.0
pkgrel=1
pkgdesc="A Qt-based application for reading Microsoft Outlook MSG files"
arch=('x86_64')
url="https://github.com/mareksamec/qt-msg-reader"
license=('MIT')
depends=('qt6-base' 'python' 'python-beautifulsoup4' 'python-olefile'
         'python-lark-parser' 'python-pyparsing')
makedepends=('cmake' 'python-pip' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "https://files.pythonhosted.org/packages/source/e/extract-msg/extract_msg-0.55.0.tar.gz"
        "https://files.pythonhosted.org/packages/source/c/compressed-rtf/compressed_rtf-1.0.7.tar.gz"
        "https://files.pythonhosted.org/packages/source/e/ebcdic/ebcdic-2.0.1.tar.gz"
        "https://files.pythonhosted.org/packages/source/R/RTFDE/rtfde-0.1.2.2.tar.gz"
        "https://files.pythonhosted.org/packages/source/r/red-black-tree-mod/red-black-tree-mod-1.22.tar.gz"
        "https://files.pythonhosted.org/packages/source/o/oletools/oletools-0.60.2.zip"
        "https://files.pythonhosted.org/packages/source/p/pcodedmp/pcodedmp-1.2.6.tar.gz"
        "https://files.pythonhosted.org/packages/source/m/msoffcrypto-tool/msoffcrypto_tool-6.0.0.tar.gz")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

_private_path="usr/lib/$pkgname/python-packages"

build() {
    cd "$pkgname-$pkgver"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build

    # Install private Python packages (isolated from user environment)
    install -dm755 "$pkgdir/$_private_path"
    pip install --no-deps --no-build-isolation --ignore-installed \
        --break-system-packages \
        --target="$pkgdir/$_private_path" \
        "$srcdir/extract_msg-0.55.0" \
        "$srcdir/compressed_rtf-1.0.7" \
        "$srcdir/ebcdic-2.0.1" \
        "$srcdir/rtfde-0.1.2.2" \
        "$srcdir/red-black-tree-mod-1.22" \
        "$srcdir/oletools-0.60.2" \
        "$srcdir/pcodedmp-1.2.6" \
        "$srcdir/msoffcrypto_tool-6.0.0"

    # Clean up bytecode and dist-info
    find "$pkgdir/$_private_path" -name "*.pyc" -delete
    find "$pkgdir/$_private_path" -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
