# Maintainer: Evgeniy Filimonov <evgfilim1@gmail.com>
pkgname=('python-telegram-bot-git')
epoch=1
pkgver=12.2.0.r0.98147fce
pkgrel=1
pkgdesc="A Python wrapper around the Telegram Bot API"
arch=('any')
url="https://github.com/${pkgname%-git}/${pkgname%-git}"
license=('LGPL3')
depends=('python-future>=0.16.0' 'python-certifi' 'python-tornado>=5.1' 'python-cryptography')
makedepends=('git' 'python-setuptools')
optdepends=('python-pysocks: SOCKS or HTTP proxy'
            'python-ujson: Ultra fast JSON parsing')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
changelog='CHANGES.rst'
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    msg2 "Updating dependencies..."
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
    msg2 "Updating changelog..."
    cp ./CHANGES.rst ../../
}

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s.r%s.%s" "$(python -c 'import telegram; print(telegram.__version__)')" \
        "$(git rev-list --count $(git log --oneline | grep Bump | head -n1 | awk '{print $1}')..HEAD)" "$(git rev-parse --short HEAD)"
    # printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim: ft=sh ts=4 sw=4 et

