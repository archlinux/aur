# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.7.0
pkgrel=1
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/tulir/mautrix-telegram"
depends=('python' 'python-telethon-session-sqlalchemy' 'python-telethon' 'python-ruamel-yaml' 'python-commonmark' 'python-alembic' 'python-mautrix' 'python-aiohttp' 'python-magic-ahupp')
makedepends=('python3')
install=mautrix-telegram.install
license=('AGPLv3')
arch=('any')
source=("https://github.com/tulir/mautrix-telegram/archive/v${pkgver}.tar.gz"
        'mautrix-telegram.service'
        'fix_broken_tests.patch'::'https://github.com/tulir/mautrix-telegram/commit/c4b9a76931c6b2093a9265d6cceae4716823cdc9.patch')
sha256sums=('1f745a89d8a06c7945a15f70bbf66a0f80305f0c27e6b23e9b79bfe37bc41a62'
            '5aade6c1041f8fe741e239d191e52b4617dae0092e6aed068e2dc713789fbc37'
            'bac92eadfcad38742d40f156571d4d70fb09a70089931a5186db7b8b6d9d581b')

prepare() {
    cd $srcdir/mautrix-telegram-${pkgver}
    patch -Np1 < '../fix_broken_tests.patch'
}

build() {
    cd $srcdir/mautrix-telegram-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/mautrix-telegram-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
    mkdir -pm0755 ${pkgdir}/etc/mautrix-telegram ${pkgdir}/usr/lib/systemd/system/
    mv ${pkgdir}/usr/{alembic,alembic.ini,example-config.yaml} ${pkgdir}/etc/mautrix-telegram/
    rm -rf ${pkgdir}/usr/lib/python3.8/site-packages/tests
    cp ../mautrix-telegram.service ${pkgdir}/usr/lib/systemd/system/
}
