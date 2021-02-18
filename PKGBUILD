# Maintainer: Evgeniy Filimonov <evgfilim1@gmail.com>
# Co-Maintainer: Ke Liu <specter119@gmail.com>
pkgname=('python-telegram-bot-git')
epoch=1
pkgver=13.2.r2.a34f0b9b
pkgrel=1
pkgdesc="A Python wrapper around the Telegram Bot API"
arch=('any')
_provide=${pkgname%-git}
url=https://github.com/$_provide/$_provide
license=('LGPL3')
depends=(
    'python-certifi'
    'python-tornado>=5.1'
    'python-cryptography' # only outdated 3.3.1 in official repos, latest is 3.4.2
    'python-apscheduler'
    'python-pytz>=2018.6'
)
makedepends=(
    'git'
    'python-setuptools'
)
optdepends=(
    'python-pysocks: SOCKS or HTTP proxy'
    'python-ujson: Ultra fast JSON parsing'
)
provides=($_provide)
conflicts=($_provide)
changelog='CHANGES.rst'
source=(
    $_provide::git+${url}.git
    urllib3::git+https://github.com/python-telegram-bot/urllib3.git#branch=ptb
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    msg2 "Updating dependencies..."
    cd $srcdir/$_provide
    git submodule init
    git config submodule.telegram/vendor/urllib3.url $srcdir/urllib3
    git submodule update
    msg2 "Updating changelog..."
    cp ./CHANGES.rst ../../
    msg2 "Unpin python-apscheduler..."
    sed -i 's/APScheduler==.*$/APScheduler/' requirements.txt
}

pkgver() {
    cd $srcdir/$_provide
    printf "%s.r%s.%s" "$(python -c 'import telegram; print(telegram.__version__)')" \
        "$(git rev-list --count $(git log --oneline | grep Bump | head -n1 | awk '{print $1}')..HEAD)" "$(git rev-parse --short HEAD)"
    # printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd $srcdir/$_provide
    python setup.py build
}

package() {
    cd $srcdir/$_provide
    python setup.py install --root=$pkgdir --optimize=1
    install -Dm644 README.rst $pkgdir/usr/share/doc/$_provide/README.rst
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_provide/LICENSE
}

# vim: ft=sh ts=4 sw=4 et

