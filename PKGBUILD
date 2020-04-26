# Maintainer: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.7.2
pkgrel=3
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/tulir/mautrix-telegram"
depends=('python' 'python-telethon-session-sqlalchemy' 'python-telethon' 'python-ruamel-yaml' 'python-commonmark' 'python-alembic' 'python-mautrix' 'python-aiohttp' 'python-magic-ahupp')
makedepends=('python')
optdepends=('python-cryptg: Uses native code for Telegram crypto stuff instead of pure Python'
            'python-pillow: WebP <-> PNG conversion for stickers'
            'python-moviepy: High quality thumbnails for Telegram->Matrix gifs and videos'
            'python-numpy: High quality thumbnails for Telegram->Matrix gifs and videos'
            'python-psycopg2: PostgreSQL support'
            'lottieconverter-git: convert WebP to GIF or WEBM')
install=mautrix-telegram.install
license=('AGPLv3')
arch=('any')
backup=('etc/mautrix-telegram/alembic.ini'
        'etc/mautrix-telegram/config.yaml'
        'etc/mautrix-telegram/registration.yaml')
source=("https://github.com/tulir/mautrix-telegram/archive/v${pkgver/_rc/-rc}.tar.gz"
        'mautrix-telegram.service'
        'fix_telethon_version.patch')
sha256sums=('5c0a627487d85a03331df6956ee5411fee2b08e7147434c57e2c937ed268da33'
            '24daf5ff2dd16bea5b8a8a27f40c3a99e2c586e48fee10aacdc966f88daf7623'
            '3b49cffb2a698ec78140405c7f9841e82ff72e5fc9e5c214325a99ceb2f9d4ac')

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
