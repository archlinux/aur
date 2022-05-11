# Maintainer: Evgeniy Filimonov <evgfilim1@gmail.com>
# Co-Maintainer: Ke Liu <specter119@gmail.com>

pkgname=('python-telegram-bot-git')
epoch=1
pkgver=20.0a0.r5.23ed0880
pkgrel=1
pkgdesc="A Python wrapper around the Telegram Bot API"
arch=('any')
_provide=${pkgname%-git}
url=https://github.com/$_provide/$_provide
license=('LGPL3')
depends=(
    'python-httpx>=0.22.0'
    'python-tornado>=6.1'
    'python-apscheduler'  # FIXME: requirements.txt: apscheduler~=3.9.1
    'python-pytz>=2018.6'
    'python-cachetools>=5.0.0'
)
makedepends=(
    'git'
    'python-setuptools'
)
checkdepends=(
    'python-cryptography'
    'python-pytest>=7.1.2'
    'python-pytest-asyncio'  # FIXME: requirements-dev.txt: pytest-asyncio==0.18.3
    'python-flaky'
)
optdepends=(
    'python-socksio: SOCKS proxy support'
    'python-ujson: Ultra fast JSON parsing'
    'python-cryptography: Telegram Passport support'
)
provides=($_provide)
conflicts=($_provide)
changelog='CHANGES.rst'
source=(
    $_provide::git+${url}.git
)
sha256sums=('SKIP')

prepare() {
    cd $srcdir/$_provide
    msg2 "Updating changelog..."
    cp ./CHANGES.rst ../../
}

pkgver() {
    cd $srcdir/$_provide
    #printf "%s.r%s.%s" "$(python -c 'import telegram; print(telegram.__version__)')" \
    #    "$(git rev-list --count $(git log --oneline | grep Bump | head -n1 | awk '{print $1}')..HEAD)" "$(git rev-parse --short HEAD)"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$_provide
    python setup.py build
}

check() {
    cd $srcdir/$_provide
    # https://github.com/python-telegram-bot/python-telegram-bot/blob/23ed0880d211999e0fb28e8703372129646896b7/.github/workflows/test.yml#L35-L60
    export TEST_NO_PYTZ='true'
    export TEST_NO_PASSPORT='true'
    export TEST_BUILD='true'
    pytest -k test_no_passport.py
    export TEST_NO_PASSPORT='false'
    pytest -k test_helpers.py
    export TEST_NO_PYTZ='false'
    pytest
}

package() {
    cd $srcdir/$_provide
    python setup.py install --root=$pkgdir --optimize=1
    install -Dm644 README.rst $pkgdir/usr/share/doc/$_provide/README.rst
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_provide/LICENSE
}

# vim: ft=sh ts=4 sw=4 et

