# vim: et ts=4 sw=4:

# Maintainer: Joost Molenaar <jjm@j0057.nl>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=fluent-bit

pkgver=1.9.9
pkgrel=1
epoch=

_pkgmaj=${pkgver:0:3}

pkgdesc='Collect data/logs from different sources, unify and send them to multiple destinations.'
arch=(x86_64 aarch64 armv7h)
url='https://fluentbit.io/'
license=('Apache')
groups=()

depends=('gcc-libs' 'openssl' 'libyaml')
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
source=("$pkgname-$pkgver.tar.gz::https://releases.fluentbit.io/$_pkgmaj/source-$pkgver.tar.gz")
noextract=()
validpgpkeys=()

build() {
    cd "$srcdir/build"
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
    cd "$srcdir/build"
    make test || true
}

package() {
    cd "$srcdir/build"

    # install binaries and libraries
    make DESTDIR="$pkgdir/" install

    # put systemd unit files in the right spot (make install puts them in /lib/systemd/system)
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    mv "$pkgdir/lib/systemd/system/fluent-bit.service" "$pkgdir/usr/lib/systemd/system"
    rm -rf "$pkgdir/lib"

    # install license file and documentation
    cd "$srcdir"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# curl https://releases.fluentbit.io/1.x/source-1.x.y.tar.gz.{md5,sha256}
md5sums=('fb18978bc76aa5c968de5b588aa54062')
sha256sums=('3f6cd4bd1894cda16b465aef6ffec7e920d54c4209b3e2320fcffe7ae345700e')
