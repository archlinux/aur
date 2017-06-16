# Maintainer: Evgeniy Filimonov <evgfilim1@gmail.com>
pkgname=('python-telegram-bot-git')
pkgver=6.0.3.r84.845312d
pkgrel=1
pkgdesc="A Python wrapper around the Telegram Bot API"
arch=('any')
url="https://github.com/${pkgname%-git}/${pkgname%-git}"
license=('LGPL3')
depends=('python-future>=0.15.2' 'python-certifi')
makedepends=('git' 'python-setuptools')
optdepends=('python-pysocks: SOCKS or HTTP proxy'
            'python-ujson: Ultra fast JSON parsing')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
changelog='CHANGES.rst'
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init --recursive
}

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s.r%s.%s" "$(cat telegram/version.py | tail -n1 | awk '{print $3}' | sed "s/'//g")" \
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
}
