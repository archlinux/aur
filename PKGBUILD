# Maintainer: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.13.0
pkgrel=2
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/mautrix/telegram"
depends=('python' 'python-telethon-session-sqlalchemy<0.3' 'python-telethon-tulir-git>=v1.28.0a9' 'python-ruamel-yaml' 'python-commonmark' 'python-mautrix>=0.19.0' 'python-mautrix<0.20' 'python-aiohttp' 'python-magic')
makedepends=('python' 'python-pip' 'python-setuptools')
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
backup=('etc/mautrix-telegram/config.yaml'
        'etc/mautrix-telegram/registration.yaml')
source=("${pkgname}-${pkgver/_rc/-rc}.tar.gz"::"https://github.com/mautrix/telegram/archive/v${pkgver/_rc/-rc}.tar.gz"
        'Update_Telethon_to_fix_handling_logouts_and_other_update_loop_errors.patch'::'https://github.com/mautrix/telegram/commit/1fed2201db3306f58d38914dbe009b75c6adb5f8.patch'
        'Update_Telethon.patch'::'https://github.com/mautrix/telegram/commit/6eda8bd1658c88cc1a6074933631c0a99a4b7c35.patch'
        'Update_Telethon2.patch'::'https://github.com/mautrix/telegram/commit/e39d4972fb658aad9bb46a712b9b3587255246b7.patch'
        'Update_mautrix-python.patch'::'https://github.com/mautrix/telegram/commit/60981386ec0fef38f710fce3ce471161c09ce27c.patch'
        'Update_mautrix-python2.patch'::'https://github.com/mautrix/telegram/commit/f189dc8c88175cfe357a594062de80a4a195283a.patch'
        'Add_options_to_automatically_delete_ratchet_megolm_sessions.patch'::'https://github.com/mautrix/telegram/commit/40c584b121869b6e4170eb29fcef33a29e77d87c.patch'
        'mautrix-telegram.service'
        'mautrix-telegram.sysusers'
        'mautrix-telegram.tmpfiles')
sha256sums=('e0848c5042f6cdf3609c31e940503a1e9b3e6510ff327393dfca3b894c4b9caa'
            'f50578c92558d73f289a9cfdec2d86fcd994341ff219cd40001db167a0a3ab52'
            '79b8f70f0f8b9140cb4237a49fe17d8a739d3f3b6b936054cf326932d7128fd0'
            '38e0fb609a9e61a1c027795702a9c68743a92e3edd7d0536cac7f23b2e9c1712'
            'c604454484738485e6deead289bdb0559b3c34226b60af7d964fb92404ae66b2'
            '1514365ebcc43cb9c42f4a7f8acc7a2ef2ec02ececc3d6db9fe3b507fd0620ce'
            '75acad6c2ccb2c34886813a537c3c5528527290d22affb4f7ef048d6fe601a67'
            'c0777f141137117d06a2bf3d27072080fdce556ac6c45855a671236b20fdaea7'
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
}
