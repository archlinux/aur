# Maintainer: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.8.0
pkgrel=1
pkgdesc="A Matrix-Telegram hybrid puppeting/relaybot bridge."
url="https://github.com/tulir/mautrix-telegram"
depends=('python' 'python-telethon-session-sqlalchemy' 'python-telethon>=1.14.0' 'python-ruamel-yaml' 'python-commonmark' 'python-alembic' 'python-mautrix>=0.5.0' 'python-aiohttp' 'python-magic-ahupp')
makedepends=('python')
optdepends=('python-cryptg: Uses native code for Telegram crypto stuff instead of pure Python'
            'python-pillow: WebP <-> PNG conversion for stickers'
            'python-moviepy: High quality thumbnails for Telegram->Matrix gifs and videos'
            'python-numpy: High quality thumbnails for Telegram->Matrix gifs and videos'
            'python-psycopg2: PostgreSQL support'
            'lottieconverter-git: convert WebP to GIF or WEBM'
            'python-matrix-nio>=0.12.0: End-to-bridge encryption support')
install=mautrix-telegram.install
license=('AGPLv3')
arch=('any')
backup=('etc/mautrix-telegram/alembic.ini'
        'etc/mautrix-telegram/config.yaml'
        'etc/mautrix-telegram/registration.yaml')
source=("https://github.com/tulir/mautrix-telegram/archive/v${pkgver/_rc/-rc}.tar.gz"
        'mautrix-telegram.service')
sha256sums=('7a81e80ac82d1dc60d9f2695e5285f999f57213ccb15e4c6cb7089c5511b912a'
            '24daf5ff2dd16bea5b8a8a27f40c3a99e2c586e48fee10aacdc966f88daf7623')

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
    mv ${pkgdir}/usr/lib/python3.8/site-packages/mautrix_telegram/example-config.yaml ${pkgdir}/etc/mautrix-telegram/
    mv ${pkgdir}/usr/{alembic,alembic.ini} ${pkgdir}/etc/mautrix-telegram/
    rm -rf ${pkgdir}/usr/lib/python3.8/site-packages/tests
    cp ../mautrix-telegram.service ${pkgdir}/usr/lib/systemd/system/
}
