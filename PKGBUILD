# Maintainer: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=matrix-appservice-telegram
pkgver=0.8.2
pkgrel=2
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
        'mautrix-telegram.service'
        'fix_telethon_version.patch')
sha256sums=('1f227f50e84f643fc7633f1a8f336aa1e51db6c12628e983783c2995a41d497f'
            '52b9e24a238bb34daa4966f033593516089ae1e7a72b373e5fa0a08a25082123'
            'f68fccabe067e409f8bb8ca7c03bebdce425ea5ed903b103691e31c26f3bcaa6')

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
    sed -i -e "s|script_location = alembic|script_location = /etc/mautrix-telegram/alembic/|" ${pkgdir}/etc/mautrix-telegram/alembic.ini
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests
    cp ../mautrix-telegram.service ${pkgdir}/usr/lib/systemd/system/
}
