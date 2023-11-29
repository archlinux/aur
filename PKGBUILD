# Maintainer: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.15.0
pkgrel=1
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/mautrix/telegram"
depends=('python-ruamel-yaml' 'python-magic' 'python-commonmark' 'python-aiohttp' 'python-yarl' 'python-mautrix>=0.20.3' 'python-mautrix<0.21' 'python-telethon-tulir-git>=v1.33.0a1' 'python-asyncpg' 'python-mako')
makedepends=('python-pip' 'python-setuptools')
optdepends=('python-cryptg: Uses native code for Telegram crypto stuff instead of pure Python'
            'python-aiodns: For asyncronous DNS requests'
            'brotli: speedups'
            'python-pillow: Login with QR code'
            'python-qrcode: Login with QR code'
            'python-phonenumbers: formatted numbers'
            'python-prometheus_client: metrics upload'
            'python-olm: End-to-bridge encryption support'
            'python-pycryptodome: End-to-bridge encryption support'
            'python-unpaddedbase64: End-to-bridge encryption support'
            'python-aiosqlite: SQLite support'
            'python-python-socks: Proxy support (asyncio)'
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
sha256sums=('93060a58be005f441402e569d9ba3ad84bdc51e551a2e2d40b5e7e2b01f2413e'
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
