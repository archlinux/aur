# Maintainer : Austin Cross <austincross@gmail.com>
# Contributor: Joost Molenaar <jjm@j0057.nl>
# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Brian Maloney

pkgname=fluent-bit
pkgver=4.2.2
pkgrel=1
pkgdesc='Collect data/logs from different sources, unify and send them to multiple destinations'
arch=(x86_64 aarch64 armv7h)
url='https://fluentbit.io/'
license=('Apache-2.0')
depends=(glibc gcc-libs openssl libyaml systemd-libs)
makedepends=(cmake postgresql-libs python)
conflicts=('fluent-bit-git')
backup=('etc/fluent-bit/fluent-bit.conf'
        'etc/fluent-bit/parsers.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fluent/fluent-bit/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('48bf6be61ef9c3958a77b95adfad9cb5')
sha256sums=('5d8e642be576985ad8123609c32d5ac44a9d3dad9eafcdc14208622444b5a4f0')

build() {
    cmake \
        -S "$srcdir/$pkgname-$pkgver" \
        -B "$srcdir/$pkgname-$pkgver-build" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DSYSTEMD_UNITDIR=/usr/lib/systemd/system \
        -DFLB_ALL=1 \
        -DFLB_OUT_PGSQL=1 \
        -DMBEDTLS_FATAL_WARNINGS=0 \
        ;

    cmake --build "$srcdir/$pkgname-$pkgver-build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname-$pkgver-build"
}

# vim:set ts=2 sw=2 et:
