# vim: et ts=4 sw=4:

# Maintainer: Joost Molenaar <jjm@j0057.nl>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=fluent-bit

pkgver=1.8.12
pkgrel=1
epoch=

pkgdesc='Collect data/logs from different sources, unify and send them to multiple destinations.'
arch=(x86_64 aarch64 armv7h)
url='https://fluentbit.io/'
license=('Apache')
groups=()

depends=('gcc-libs' 'openssl')
# PostgreSQL_TYPE_INCLUDE_DIR is provided by postgresql, this is currently a bug
makedepends=('cmake' 'postgresql-libs' 'postgresql' 'python' 'valgrind' 'systemd-libs')
checkdepends=('gtest' 'doxygen' 'graphviz')
optdepends=()

provides=()
conflicts=()
replaces=()

backup=('etc/fluent-bit/fluent-bit.conf'
        'etc/fluent-bit/parsers.conf')
options=()
install=
changelog=
source=("https://fluentbit.io/releases/${pkgver:0:3}/$pkgname-$pkgver.tar.gz")
noextract=()
validpgpkeys=()

build() {
    cd $pkgname-$pkgver/build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DFLB_TESTS_INTERNAL=Yes \
        -DFLB_IN_MQTT=Yes \
        -DFLB_TLS=Yes \
        -DFLB_ALL=Yes \
        -DFLB_OUT_NATS=Yes \
        -DFLB_HTTP_SERVER=Yes \
        -DMBEDTLS_FATAL_WARNINGS=Off \
        ..
    make
}

check() {
    cd $pkgname-$pkgver/build
    make test || true
}

package() {
    cd $pkgname-$pkgver/build

    # install binaries and libraries
    make DESTDIR="$pkgdir/" install

    # put systemd unit files in the right spot (make install puts them in /lib/systemd/system)
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    mv "$pkgdir/lib/systemd/system/fluent-bit.service" "$pkgdir/usr/lib/systemd/system"
    rm -rf "$pkgdir/lib"

    # install license file and documentation
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

sha512sums=('a2262915b7101fc5edfaa2622a76748653b3a45126862ed69a8e87a0ca49d91c1f6f708659f01684d4a07b8fd3413d1acb76222288395ff8e91b28ef67966aaf')
b2sums=('674fe64242bce6170307ed7d6a47f854c59dc69e4bbea25e456f10dac69146a63aa7810384f004b7c0d25a04c1face2efceb5207452f34a4057f0492bde4e753')
