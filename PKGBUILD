# Maintainer: fsyy <fossy2001 at web.de>
pkgname=streamdeck-ui-git
_pkgname=streamdeck-ui
pkgver=r243.c8dffc7
pkgrel=1
pkgdesc="A Linux compatible UI for the Elgato Stream Deck"
arch=('any')
url="https://timothycrosley.github.io/streamdeck-ui/"
license=('MIT')
depends=('python-pillow' 'python-hidapi' 'pyside2' 'python-pynput' 'python-elgato-streamdeck')
makedepends=('git' 'python-dephell' 'python-setuptools')
provides=('streamdeck-ui')
source=("git+https://github.com/timothycrosley/streamdeck-ui.git"
        "60-streamdeck.rules")
sha512sums=('SKIP'
            '8095ffc56e7d5700bd48e61724a1db709d2f07145508e5f3b3ada2d77848453a5a50c810fa60077d84917458f9139058d36067ba3603d49e0c57507e9b243da4')

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
