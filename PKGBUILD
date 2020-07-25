# Maintainer: hexptr <hexptr@protonmail.com>
pkgname=streamdeck-ui-git
_pkgname=streamdeck-ui
pkgver=r113.ce2156a
pkgrel=2
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
            '79b03a68354f4642067cea9884a839c3869186165e4ad9a61dd60c865dc61c2dc392619a13767c4e4da34b34ec2988333f2f0f704f5a5d277f45216eb872d000')

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
