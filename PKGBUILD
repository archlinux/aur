# Maintainer: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.7.1
pkgrel=2
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/tulir/mautrix-telegram"
depends=('python' 'python-telethon-session-sqlalchemy' 'python-telethon' 'python-ruamel-yaml' 'python-commonmark' 'python-alembic' 'python-mautrix' 'python-aiohttp' 'python-magic-ahupp')
makedepends=('python3')
install=mautrix-telegram.install
license=('AGPLv3')
arch=('any')
backup=('etc/mautrix-telegram/alembic.ini'
        'etc/mautrix-telegram/config.yaml'
        'etc/mautrix-telegram/registration.yaml')
source=("https://github.com/tulir/mautrix-telegram/archive/v${pkgver/_rc/-rc}.tar.gz"
        'mautrix-telegram.service'
        'Fix_ignore_incoming_bot_events_check_in_channels.patch'::'https://github.com/tulir/mautrix-telegram/commit/62efc39eedf900dcce6590416ab869218c245df7.patch'
        'Only_leave_group_chat_portals_with_default_puppet.patch'::'https://github.com/tulir/mautrix-telegram/commit/da72c51644e178a6c59375a11152e45fa31ac2af.patch')
sha256sums=('14ed98a1bc87673562b806b8b3b8dfe2293c616281a1965ceabb55c8768594fd'
            '5aade6c1041f8fe741e239d191e52b4617dae0092e6aed068e2dc713789fbc37'
            '75491d24ab8ae7543464cc963415004b8ce7b5b8acd3701e895b4f27750da68a'
            '745f765f3ce8548258077ba5280d11a61d5817e103cf973f8d1b9151e72a8874')

prepare() {
    cd $srcdir/mautrix-telegram-${pkgver/_rc/-rc}
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        msg2 "Applying patch $src..."
        patch -Np1 < "../$src"
    done
}

build() {
    cd $srcdir/mautrix-telegram-${pkgver/_rc/-rc}
    python setup.py build
}

package() {
    cd $srcdir/mautrix-telegram-${pkgver/_rc/-rc}
    python setup.py install --root="${pkgdir}" --optimize=1
    mkdir -pm0755 ${pkgdir}/etc/mautrix-telegram ${pkgdir}/usr/lib/systemd/system/
    mv ${pkgdir}/usr/{alembic,alembic.ini,example-config.yaml} ${pkgdir}/etc/mautrix-telegram/
    rm -rf ${pkgdir}/usr/lib/python3.8/site-packages/tests
    cp ../mautrix-telegram.service ${pkgdir}/usr/lib/systemd/system/
}
