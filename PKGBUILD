# Maintainer: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.10.0_rc1
pkgrel=2
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/tulir/mautrix-telegram"
depends=('python' 'python-telethon-session-sqlalchemy<0.3' 'python-telethon>=1.20' 'python-telethon<1.22' 'python-ruamel-yaml' 'python-commonmark' 'python-alembic' 'python-mautrix>=0.9' 'python-mautrix<0.10' 'python-aiohttp' 'python-magic-ahupp')
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
source=("https://github.com/tulir/mautrix-telegram/archive/v${pkgver/_rc/-rc}.tar.gz"
        'Update_mautrix-python.patch'::"https://github.com/tulir/mautrix-telegram/commit/7e9dd8b895c59b17d040315a3be8bd3ba1cd0d34.patch"
        'mautrix-telegram.service'
        'mautrix-telegram.sysusers'
        'mautrix-telegram.tmpfiles')
sha256sums=('8b1bd2d66d8c5d1f12d34a14f39f4831a0c9fb8e7e82a1de686d88257cda90a6'
            'af26aea1c056544b01715aa80249a78a29e5e26e444c113551d3be1b2939bb7a'
            'd77c91154204ba5a5297c87c8b8a25209e125024aeee7c49f37416ccb7bd556a'
            'e069958db276309d00864ee3dded5700b78806c82663346aa2ef6878e2c0566b'
            'edbde9814355756b624fdc58326a5830f82156802166a9f6001b67cf21d5f6f8')

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
