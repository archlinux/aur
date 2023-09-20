# Maintainer: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.14.2
pkgrel=1
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/mautrix/telegram"
depends=('python' 'python-telethon-session-sqlalchemy<0.3' 'python-telethon-tulir-git>=v1.30.0a2' 'python-ruamel-yaml' 'python-commonmark' 'python-mautrix>=0.20.2' 'python-mautrix<0.21' 'python-aiohttp' 'python-magic' 'python-yarl' 'python-mako')
makedepends=('python' 'python-pip' 'python-setuptools')
optdepends=('python-cryptg: Uses native code for Telegram crypto stuff instead of pure Python'
#            'python-cchardet: For faster encoding detection'
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
            'brotli'
            'python-phonenumbers'
            )
install=mautrix-telegram.install
license=('AGPLv3')
arch=('any')
backup=('etc/mautrix-telegram/config.yaml'
        'etc/mautrix-telegram/registration.yaml')
source=("${pkgname}-${pkgver/_rc/-rc}.tar.gz"::"https://github.com/mautrix/telegram/archive/v${pkgver/_rc/-rc}.tar.gz"
        'mautrix-telegram.service'
        'mautrix-telegram.sysusers'
        'mautrix-telegram.tmpfiles')
sha256sums=('8071beb09970d7a337e1a1f7700ecd3f4ef774ba51f2e7199f0216883f023786'
            '38f0f7e3b8e94cba2eef643e473e3d63025310e47a5d2e5122a8930a0cbf5346'
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
