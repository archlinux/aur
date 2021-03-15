# Maintainer: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.9.0
pkgrel=4
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/tulir/mautrix-telegram"
depends=('python' 'python-telethon-session-sqlalchemy' 'python-telethon>=1.20' 'python-telethon<1.22' 'python-ruamel-yaml' 'python-commonmark' 'python-alembic' 'python-mautrix>=0.8.4' 'python-aiohttp' 'python-magic-ahupp')
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
        'Fix_Matrix_Telegram_location_message_bridging.patch'::'https://github.com/tulir/mautrix-telegram/commit/140fcae403789dd6172754f19ab8d226efdb3df0.patch'
        'Update_mautrix-python.patch'::'https://github.com/tulir/mautrix-telegram/commit/0b8fa5ea0674477276a48e71895ec5fc4cdd7dae.patch'
        'telethon-1.18.patch'
        'Update_telethon.patch'::'https://github.com/tulir/mautrix-telegram/commit/dd7eed834c0d9180bef589945f68d3e5d28379b1.patch'
        'Fix_bugs.patch'::'https://github.com/tulir/mautrix-telegram/commit/f658f2c5b7b2ba9a8d62020a4f0794e5a5212dc3.patch'
        'Strip_spaces_around_messages_when_hashing_for_deduplication.patch'::'https://github.com/tulir/mautrix-telegram/commit/3fe26ae4dd7281f426883aae74d4f94ef997eb2d.patch'
        'Fix_deduplicating_forwarded_messages.patch'::'https://github.com/tulir/mautrix-telegram/commit/7d20c5b732ea54ffa2219eca3d7bd85c45b9615a.patch'
        'Stringify_base_url_before_inserting_to_db.patch'::'https://github.com/tulir/mautrix-telegram/commit/2ce2337674f7649f7932f2f1951815f011f43010.patch'
        'Bump_maximum_Telethon_version.patch'
        'Update_Telethon_and_add_support_for_invite_link_customization.patch'::'https://github.com/tulir/mautrix-telegram/commit/de3a37f40c3af4a9ac61cfc413b758cbdec7e81c.patch'
        'Fix_finding_largest_photo_size.patch'::'https://github.com/tulir/mautrix-telegram/commit/72cfbf71f8bc0102c28ac04c41f1ebe78f25fcf5.patch'
        'mautrix-telegram.service'
        'mautrix-telegram.sysusers'
        'mautrix-telegram.tmpfiles')
sha256sums=('e0fb30bf448f1bec6f27f73662c1dcddd36986367dcbe4f34509b23af67142a9'
            '61f40a499a5c4fb0912233e196917ad70f0105d3e605c2a1c783ec2edec34ab4'
            '19051e742d2f5a5b6dcf058b3492e3e2156081f4260a1fb5bf945277f2d6410b'
            'fdd5fba2c0566813059e4c7d0ee38219f12a2210e853a2bd3d5e04d5f1480adb'
            'bcbde9920e73d38a235621f390234537e6dea403bb4136044572a8b7417f339a'
            'eefd6572079935f15f5fa358c18c3be8fbde22c0940a8bd328fdf5ea9e84051a'
            '02c5d23b7a8d1ac9eb3f989a85f69f3668d85372019d494eecab2aa22b2e699f'
            'fd64256a1c694549a2b1563bc9a7fd0ded7b6d05d96eb70d71e8d2032f1f9fb1'
            '68e5ce5672fd829ab31a1c0764435c55827ed7eefb3032997cc04679c12edd96'
            '32c61fef0e0d096d1586191aaba57680dbfef00584c80cdbc6e65803cbf498ba'
            'ee2783f894c2e757ca964170474b4bf977fc90dcb1988c3c65a4bebe9978b8ba'
            '692a4908918e15f49b99425bb8ee7d2ea6585416479a9b33f50258cac2b46ed7'
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
