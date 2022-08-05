# Maintainer: fsyy <fossy2001 at web.de>
pkgname=streamdeck-ui-git
_pkgname=streamdeck-ui
pkgver=r453.e8cc045
pkgrel=1
pkgdesc="A Linux compatible UI for the Elgato Stream Deck"
arch=('any')
url="https://timothycrosley.github.io/streamdeck-ui/"
license=('MIT')
depends=('python-pillow' 'python-hidapi' 'pyside2' 'python-pynput' 'python-elgato-streamdeck' 'python-cairosvg' 'python-filetype')
makedepends=('git' 'python-dephell' 'python-setuptools')
optdepends=('gnome-shell-extension-appindicator: tray icon support gnome-shell')
provides=('streamdeck-ui')
source=("git+https://github.com/timothycrosley/streamdeck-ui.git"
        "60-streamdeck.rules")
sha512sums=('SKIP'
            '2c08c9c89fbfb9af832cb131655d79c93b892f4a21875b98bd8293c421bfde5367b21c77b0a4119d999a1e83f46b96ef3210edafc2c163a93b206a0a4b493e87')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 644 "$srcdir/60-streamdeck.rules" "${pkgdir}/usr/lib/udev/rules.d/60-streamdeck.rules"
}
