# vim: et ts=4 sw=4:

# Maintainer: Joost Molenaar <jjm@j0057.nl>
# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Brian Maloney

pkgname=fluent-bit

pkgver=2.2.2
pkgrel=1
epoch=

pkgdesc='Collect data/logs from different sources, unify and send them to multiple destinations.'
arch=(x86_64 aarch64 armv7h)
url='https://fluentbit.io/'
license=('Apache')
groups=()

depends=('glibc' 'gcc-libs' 'openssl' 'libyaml' 'systemd-libs')
# PostgreSQL_TYPE_INCLUDE_DIR is provided by postgresql, this is currently a bug
makedepends=('cmake' 'postgresql-libs' 'postgresql' 'python' 'valgrind')
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
source=("$pkgname-$pkgver.tar.gz::https://releases.fluentbit.io/${pkgver%.*}/source-$pkgver.tar.gz")
noextract=()
validpgpkeys=()

build() {
    cd "$srcdir/build"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DSYSTEMD_UNITDIR=/usr/lib/systemd/system \
        -DFLB_TESTS_INTERNAL=Yes \
        -DFLB_IN_MQTT=Yes \
        -DFLB_TLS=Yes \
        -DFLB_ALL=Yes \
        -DFLB_OUT_NATS=Yes \
        -DFLB_HTTP_SERVER=Yes \
        -DMBEDTLS_FATAL_WARNINGS=Off \
        -DLUAJIT_BUILD_EXE=Off \
        ..
    make
}

check() {
    cd "$srcdir/build"
    make test || true
}

package() {
    cd "$srcdir/build"

    # install binaries and libraries
    make DESTDIR="$pkgdir/" install

    # install license file and documentation
    cd "$srcdir"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# r!. %; curl -s https://releases.fluentbit.io/${pkgver\%.*}/source-$pkgver.tar.gz.{md5,sha256} | awk '{print $1}'
md5sums=('0e4af3cbc4d94f931781091b013aff28')
sha256sums=('3c51f6b4a6b2590cc5f072a0af3ccd33fe5e61eec751fda481a9e17aae9a51dc')
