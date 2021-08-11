# Maintainer: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.10.0
pkgrel=4
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/mautrix/telegram"
depends=('python' 'python-telethon-session-sqlalchemy<0.3' 'python-telethon>=1.22' 'python-telethon<1.24' 'python-ruamel-yaml' 'python-commonmark' 'python-alembic' 'python-mautrix>=0.10' 'python-mautrix<0.11' 'python-aiohttp' 'python-magic-ahupp')
makedepends=('python' 'python-pip')
optdepends=('python-cryptg: Uses native code for Telegram crypto stuff instead of pure Python'
            'python-cchardet: For faster encoding detection'
            'python-aiodns: For asyncronous DNS requests'
            'python-pillow: WebP <-> PNG conversion for stickers'
            'python-qrcode: Login with QR code'
            'python-moviepy: High quality thumbnails for Telegram->Matrix gifs and videos'
            'python-numpy: High quality thumbnails for Telegram->Matrix gifs and videos'
            'python-psycopg2: PostgreSQL support'
            'python-asyncpg: End-to-bridge encryption support'
            'python-olm: End-to-bridge encryption support'
            'python-unpaddedbase64: End-to-bridge encryption support'
            'python-pycryptodome: End-to-bridge encryption support'
            'lottieconverter-git: convert WebP to GIF or WEBM'
            'python-prometheus_client: metrics upload'
            )
install=mautrix-telegram.install
license=('AGPLv3')
arch=('any')
backup=('etc/mautrix-telegram/alembic.ini'
        'etc/mautrix-telegram/config.yaml'
        'etc/mautrix-telegram/registration.yaml')
source=("${pkgname}-${pkgver/_rc/-rc}.tar.gz"::"https://github.com/mautrix/telegram/archive/v${pkgver/_rc/-rc}.tar.gz"
        'Ignore_typing_notifications_from_double_puppeted_users.patch'::'https://github.com/mautrix/telegram/commit/eca1032d1660099216e71a7e0b24d35bb4833d74.patch'
        'Update_mautrix-python.patch'::'https://github.com/mautrix/telegram/commit/f923552f86af2e6311ce01a27c52fb294ac7d694.patch'
        'Update_to_Telethon_1.22.patch'::'https://github.com/mautrix/telegram/commit/730f6bab6fc0ca4077f3b09d866ad50767df9086.patch'
        'mautrix-1-22.patch'::'https://github.com/mautrix/telegram/commit/ec64c83cb01791525a39f937f3b847368021dce8.patch'
        'mautrix-telegram.service'
        'mautrix-telegram.sysusers'
        'mautrix-telegram.tmpfiles')
sha256sums=('07693116b2676c77f44e8f17ac963e87da05aebd3d5829db77c619f1e0d9c45a'
            'e9bd820f1a0f56a5684a73bc9f06412daeba3621afc3706efa3f33c486c6efa9'
            '4ab7843f6282381e0360a05d6cb4ea0480cf4db55ae6e10260b62c8bc0c4ba50'
            '769b8dde12d95c1afb1d813307f88b8bc812e32a83daa1bf7171c6f8bf5ee7f5'
            '9cc126aac7b15b7b1b9a51e3797f59f3cf4554eba62c69562f41fbaebb1d607a'
            'd77c91154204ba5a5297c87c8b8a25209e125024aeee7c49f37416ccb7bd556a'
            'e069958db276309d00864ee3dded5700b78806c82663346aa2ef6878e2c0566b'
            'edbde9814355756b624fdc58326a5830f82156802166a9f6001b67cf21d5f6f8')

prepare() {
    cd $srcdir/telegram-${pkgver/_rc/-rc}
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
    cd $srcdir/telegram-${pkgver/_rc/-rc}
    python setup.py build
}

package() {
    cd $srcdir/telegram-${pkgver/_rc/-rc}
    python setup.py install --root="${pkgdir}" --optimize=1

    install -dm 750 "${pkgdir}/usr/share/mautrix-telegram/"
    install -Dm 644 ../mautrix-telegram.service "${pkgdir}/usr/lib/systemd/system/mautrix-telegram.service"
    install -Dm 644 ../mautrix-telegram.sysusers "${pkgdir}/usr/lib/sysusers.d/mautrix-telegram.conf"
    install -Dm 644 ../mautrix-telegram.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/mautrix-telegram.conf"

    # cleanup
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests

    # Fix alembic position
    mv ${pkgdir}/usr/{alembic,alembic.ini} "${pkgdir}/usr/share/mautrix-telegram/"
    sed -i -e "s|script_location = alembic|script_location = /usr/share/mautrix-telegram/alembic/|" "${pkgdir}/usr/share/mautrix-telegram/alembic.ini"
}
