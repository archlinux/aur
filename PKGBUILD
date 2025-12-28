# Maintainer: MyApps Contributors <noreply@github.com>

pkgname=myapps
pkgver=0.2.3
pkgrel=1
pkgdesc="Linux package manager overview with GTK4 + Libadwaita"
arch=('any')
url="https://github.com/nicolettas-muggelbude/myapps"
license=('GPL-3.0-or-later')
depends=(
    'python>=3.8'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'python-pillow'
    'hicolor-icon-theme'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nicolettas-muggelbude/myapps/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')  # TODO: Update with actual checksum after release

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Generate setup.py from pyproject.toml for compatibility
    cat > setup.py << 'EOF'
#!/usr/bin/env python3
from setuptools import setup
setup()
EOF

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install desktop file (v0.2.0 tarball has old filename)
    if [ -f io.github.nicolettas-muggelbude.myapps.desktop ]; then
        # New filename (for future releases)
        install -Dm644 io.github.nicolettas-muggelbude.myapps.desktop \
            "${pkgdir}/usr/share/applications/io.github.nicolettas-muggelbude.myapps.desktop"
    else
        # Old filename (v0.2.0 tarball)
        install -Dm644 de.pc-wittfoot.myapps.desktop \
            "${pkgdir}/usr/share/applications/io.github.nicolettas-muggelbude.myapps.desktop"
    fi

    # Install metainfo (v0.2.0 tarball has old filename)
    if [ -f io.github.nicolettas-muggelbude.myapps.metainfo.xml ]; then
        # New filename (for future releases)
        install -Dm644 io.github.nicolettas-muggelbude.myapps.metainfo.xml \
            "${pkgdir}/usr/share/metainfo/io.github.nicolettas-muggelbude.myapps.metainfo.xml"
    else
        # Old filename (v0.2.0 tarball)
        install -Dm644 de.pc-wittfoot.myapps.metainfo.xml \
            "${pkgdir}/usr/share/metainfo/io.github.nicolettas-muggelbude.myapps.metainfo.xml"
    fi

    # Install icon
    install -Dm644 assets/icons/io.github.nicolettas-muggelbude.myapps.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.nicolettas-muggelbude.myapps.svg"

    # Install filters
    install -dm755 "${pkgdir}/usr/share/myapps/filters"
    install -Dm644 filters/*.json "${pkgdir}/usr/share/myapps/filters/"

    # Install locales (if they exist)
    if [ -d locales ] && [ "$(ls -A locales)" ]; then
        cp -r locales "${pkgdir}/usr/share/myapps/"
    fi

    # Install assets
    install -dm755 "${pkgdir}/usr/share/myapps/assets"
    cp -r assets/* "${pkgdir}/usr/share/myapps/assets/"

    # Install version and changelog info
    install -Dm644 pyproject.toml "${pkgdir}/usr/share/myapps/pyproject.toml"
    install -Dm644 WHATS_NEW.md "${pkgdir}/usr/share/myapps/WHATS_NEW.md"
}
