# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Arian <arian.sameni+bacula-client AT gmail DOT com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Matthew <pyther@pyther.net>
pkgname=bacula-client
pkgver=15.0.3
pkgrel=2
pkgdesc="Enterprise ready, network based backup program"
url=https://www.bacula.org
arch=(x86_64)
license=(AGPL-3.0-only)
depends=(
    acl
    gcc-libs
    libcap
    ncurses
    openssl
    zlib
    zstd
)
optdepends=(
    "bash: support for some util scripts"
    "lzo: LZO support"
    "perl: support for some provided scripts"
    "python: to use key-manager.py and other provided scripts"
)
conflicts=(bacula)
provides=(bacula-fd=$pkgver)
backup=(
    etc/bacula/bconsole.conf
    etc/bacula/bacula-fd.conf
)
# Bacula 4096 Distribution Verification Key (www.bacula.org) <kern@bacula.org>
# https://www.bacula.org/bacula-distribution-verification-public-keys/
validpgpkeys=('5235F5B668D81DB61704A82DC0BE2A5FE9DF3643')
source=(
    https://downloads.sourceforge.net/project/bacula/bacula/$pkgver/bacula-$pkgver.tar.gz{,.sig}
    bacula-fd.service
)
b2sums=('16af09af709406fce5e05b101c3ab1337e24816b353cc1a00c0efe05ba798fdf21f3a36ca1c3f867ff4bd768822494ba5f45d6555d0978754d30e08cfaa638dc'
        'SKIP'
        '40e2965c025f76c93d8e5c248b49177cbffc65b1afef620437f486132696730211df0b06b0c9bb5377acb4b57d897e4d0e4dc806fa0301c85f7cf9f771ee479a')

build() {
    cd bacula-$pkgver/
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --enable-client-only \
        --with-systemd=/usr/lib/systemd/system/ \
        --sysconfdir=/etc/bacula \
        --with-scriptdir=/etc/bacula/scripts
    make
}

package() {
    cd bacula-$pkgver/
    make DESTDIR="$pkgdir" install
    # we do not take the service file provided by bacula package
    # as it needs too much customization
    install -D -m0644 ../bacula-fd.service "$pkgdir"/usr/lib/systemd/system/bacula-fd.service
    # Remove man page provided by extra/bat
    rm "$pkgdir"/usr/share/man/man1/bat.1.gz
    # Remove empty dir
    rmdir "$pkgdir"/tmp
}
