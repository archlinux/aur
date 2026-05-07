# Maintainer: Plan-B-Development <https://github.com/Plan-B-Development>
pkgname=control-ofc-gui
pkgver=1.10.2
pkgrel=1
pkgdesc="PySide6 desktop GUI for the Control-OFC fan control daemon"
arch=('any')
url="https://github.com/Plan-B-Development/control-ofc-gui"
license=('MIT')
depends=('control-ofc-daemon>=1.6.2' 'python' 'pyside6' 'python-httpx'
         'python-pyqtgraph' 'python-numpy'
         'hicolor-icon-theme')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'scdoc')
install=control-ofc-gui.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('497df7fd080b55a747f16c8290068b3ede3e9b60b8c54543d9701664b66dbba5')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation

    # Render man page from scdoc source.
    scdoc < man/control-ofc-gui.1.scd > control-ofc-gui.1
}

package() {
    cd "$pkgname-$pkgver"

    # Install Python package (creates /usr/bin/control-ofc-gui from entry point)
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Desktop entry
    install -Dm644 packaging/control-ofc-gui.desktop "$pkgdir/usr/share/applications/control-ofc-gui.desktop"

    # Application icon
    install -Dm644 assets/branding/app_icon/app_icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/control-ofc.svg"

    # Branding assets — runtime-loaded by the in-app About dialog and sidebar
    install -Dm644 assets/branding/app_icon/app_icon.svg "$pkgdir/usr/share/control-ofc-gui/assets/branding/app_icon/app_icon.svg"

    # Man page (rendered in build()).
    install -Dm644 control-ofc-gui.1 \
        "$pkgdir/usr/share/man/man1/control-ofc-gui.1"

    # Shell completions — installed unconditionally; missing shells ignore them.
    install -Dm644 completions/control-ofc-gui.bash \
        "$pkgdir/usr/share/bash-completion/completions/control-ofc-gui"
    install -Dm644 completions/_control-ofc-gui \
        "$pkgdir/usr/share/zsh/site-functions/_control-ofc-gui"
    install -Dm644 completions/control-ofc-gui.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/control-ofc-gui.fish"

    # User-facing documentation — README, CHANGELOG, and the full user manual.
    # The post_install message points users at /usr/share/doc/control-ofc-gui/,
    # so the directory needs to actually contain something useful.
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    for guide in manual/*.md; do
        install -Dm644 "$guide" \
            "$pkgdir/usr/share/doc/$pkgname/manual/$(basename "$guide")"
    done

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
