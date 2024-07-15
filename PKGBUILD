# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Arian <arian.sameni+bacula-client AT gmail DOT com>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Matthew <pyther@pyther.net>
pkgname=bacula-client
pkgver=15.0.2
pkgrel=1
pkgdesc="Enterprise ready, network based backup program"
url=https://www.bacula.org
arch=(x86_64)
license=(AGPL3)
depends=(openssl)
optdepends=('lzo: LZO support')
conflicts=(bacula)
provides=(bacula-fd=$pkgver)
backup=(
    etc/bacula/bconsole.conf
    etc/bacula/bacula-fd.conf
)
# Bacula 4096 Distribution Verification Key (www.bacula.org) <kern@bacula.org>
validpgpkeys=('5235F5B668D81DB61704A82DC0BE2A5FE9DF3643')
source=(
    https://downloads.sourceforge.net/project/bacula/bacula/$pkgver/bacula-$pkgver.tar.gz{,.sig}
    bacula-fd.service
    fix-build.patch::https://gitlab.bacula.org/bacula-community-edition/bacula-community/-/commit/c18d2ee1b1743facc057ee9e3ee9bfbd63299a64.patch
)
b2sums=('1dd0722ce2bb6363936ed9cc9df1b6d842945f17277c77f40884bafc4b0a254c5fdd2c21bd200c6ca8b77c8eb718a319552e50135c9925d2b4ad81a64ab819d2'
        'SKIP'
        '40e2965c025f76c93d8e5c248b49177cbffc65b1afef620437f486132696730211df0b06b0c9bb5377acb4b57d897e4d0e4dc806fa0301c85f7cf9f771ee479a'
        '35e382d80cef97c192022f713b8b336c4771eae9c7c5ab6e6696128c13d6e82256c49d306c7b5157222444348ed73290e9c0846a522e21ee604a734e9b6e6e3d')

prepare() {
    patch -d bacula-$pkgver -Np2 -i ../fix-build.patch
}

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
}
