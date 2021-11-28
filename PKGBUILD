# Maintainer: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.10.2
pkgrel=1
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/mautrix/telegram"
depends=('python' 'python-telethon-session-sqlalchemy<0.3' 'python-telethon-tulir-git' 'python-ruamel-yaml' 'python-commonmark' 'python-alembic' 'python-mautrix>=0.12' 'python-mautrix<0.13' 'python-aiohttp' 'python-magic-ahupp')
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
        'mautrix-telegram.service'
        'mautrix-telegram.sysusers'
        'mautrix-telegram.tmpfiles'
        'Update_tgs_converter_to_match_updated_lottieconverter.patch'::'https://github.com/mautrix/telegram/commit/b4d4f841616d138893989ba64bd53b94cd67208f.patch'
        'Move_filter_matrix_event_logic_to_mautrix-python.patch'::'https://github.com/mautrix/telegram/commit/25761215c376f5e5720f0c0213709f67b7944eff.patch'
        'Update_comments_in_example_config.patch'::'https://github.com/mautrix/telegram/commit/631ed49ec70a4f1eedb13382470c39f7888362a6.patch'
        'Use_message_send_checkpoints.patch'::'https://github.com/mautrix/telegram/commit/8276692ebf8e2fd45300fa1b262bfba5e767f304.patch'
        'Update dependencies.patch'::'https://github.com/mautrix/telegram/commit/c095498247ccfb1267f90cdd7afb1fd35e3ff465.patch'
        )
sha256sums=('6c55dd22d71dc8c78a3069acabcd66d8c181c795688f37bfc88fc461e99f5e25'
            'd77c91154204ba5a5297c87c8b8a25209e125024aeee7c49f37416ccb7bd556a'
            'e069958db276309d00864ee3dded5700b78806c82663346aa2ef6878e2c0566b'
            'edbde9814355756b624fdc58326a5830f82156802166a9f6001b67cf21d5f6f8'
            '3067e7f8fdf729c0c13f566dddaf3a33b47638fd87fc7a27173d3c7e330acc91'
            '366a0e85be55623070c0c8d637840f14a65d48929eef07e93e522dc492296e60'
            '0fb812596b118d01c6caa9ffe5e24131b6ad935c537ceb58bf3ab405a0baf95d'
            '51d2332461ff7fee9de759a0a9c9d644cf9d493b9eef28771c38cd893ff86edf'
            'bbc91b6ffbf3b41634c44fe8d4f37049f54043822c6361378066367abddb5bf8')

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
