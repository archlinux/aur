# Maintainer: Aaron D. Lee <your-email@example.com>
pkgname=stegasoo-cli-git
pkgver=4.2.1
pkgrel=1
pkgdesc="Secure steganography CLI with hybrid photo + passphrase + PIN authentication"
arch=('x86_64')
url="https://github.com/adlee-was-taken/stegasoo"
license=('MIT')

# Python 3.11-3.14 supported (uses jpeglib for modern Python compatibility)
depends=(
    'python>=3.11'
)
makedepends=(
    'git'
    'python'
    'python-build'
    'python-hatchling'
)
optdepends=(
    'libjpeg-turbo: jpegtran for lossless JPEG rotation (DCT-safe)'
)
provides=('stegasoo-cli')
conflicts=('stegasoo-cli' 'stegasoo' 'stegasoo-git')
install=stegasoo-cli-git.install
source=("${pkgname}::git+https://github.com/adlee-was-taken/stegasoo.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "%s.r%s.g%s" "4.2.1" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"

    # Install to /opt/stegasoo-cli with dedicated venv
    install -dm755 "$pkgdir/opt/stegasoo-cli"

    # Create fresh venv in package
    python -m venv "$pkgdir/opt/stegasoo-cli/venv"

    # Install the wheel with CLI + DCT + compression extras (no web/api)
    local wheel=$(ls dist/*.whl | head -1)
    "$pkgdir/opt/stegasoo-cli/venv/bin/pip" install --no-cache-dir "${wheel}[cli,dct,compression]"

    # Fix shebangs - replace build-time paths with installed paths
    find "$pkgdir/opt/stegasoo-cli/venv/bin" -type f -exec \
        sed -i "s|$pkgdir/opt/stegasoo-cli/venv|/opt/stegasoo-cli/venv|g" {} \;

    # Fix pyvenv.cfg
    sed -i "s|$pkgdir||g" "$pkgdir/opt/stegasoo-cli/venv/pyvenv.cfg"

    # Create symlink to /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/stegasoo-cli/venv/bin/stegasoo "$pkgdir/usr/bin/stegasoo"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install docs
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
