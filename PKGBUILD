# vim: et ts=4 sw=4:

# Maintainer: -
# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Brian Maloney

pkgname=fluent-bit

pkgver=3.0.6
pkgrel=2
epoch=

pkgdesc='Collect data/logs from different sources, unify and send them to multiple destinations'
arch=(x86_64 aarch64 armv7h)
url='https://fluentbit.io/'
license=('Apache-2.0')
groups=()

depends=('glibc' 'gcc-libs' 'openssl' 'libyaml' 'systemd-libs')
makedepends=('cmake' 'postgresql-libs' 'python')
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
source=("$pkgname-$pkgver.tar.gz::https://releases.fluentbit.io/${pkgver%.*}/source-$pkgver.tar.gz"
        pr-8901.patch)
noextract=("$pkgname-$pkgver.tar.gz")
validpgpkeys=()
install=fluent-bit.install

prepare() {
    tar xf "$pkgname-$pkgver.tar.gz" --one-top-level

    patch -p1 -d "$pkgname-$pkgver" < pr-8901.patch
}

build() {
    cmake \
        -S "$srcdir/$pkgname-$pkgver" \
        -B "$srcdir/$pkgname-$pkgver-build" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DSYSTEMD_UNITDIR=/usr/lib/systemd/system \
        -DFLB_TESTS_INTERNAL=1 \
        -DFLB_ALL=1 \
        -DFLB_OUT_PGSQL=1 \
        -DMBEDTLS_FATAL_WARNINGS=0 \
        -DLUAJIT_BUILD_EXE=0 \
        ;

    cmake --build "$srcdir/$pkgname-$pkgver-build"
}

check() {
    make -C "$srcdir/$pkgname-$pkgver-build" test || true
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname-$pkgver-build"

    install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE"

    install -m 644 -D -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/$pkgname-$pkgver/README.md"
}

# r!. %; curl -s https://releases.fluentbit.io/${pkgver\%.*}/source-$pkgver.tar.gz.{md5,sha256} | awk '{print $1}'
md5sums=('5bd6b07aea13172e1776f6a3e2abd216'
         'SKIP')
sha256sums=('b373b52b85d6b608895bb5ae3508e85565e4261aeb8a9cc99ca5e81de6200e04'
            'SKIP')
