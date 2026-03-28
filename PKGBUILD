# Maintainer : Austin Cross <austincross@gmail.com>
# Contributor: Joost Molenaar <jjm@j0057.nl>
# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Brian Maloney

pkgname=fluent-bit
pkgver=4.2.3
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
md5sums=('f5317be2dd636b84271a92dda1c466b2')
sha256sums=('b2dae50fb7a00bbab5eb6d47f3bfc4d56c698d72d485d748cb326bfeaa7249fa')

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
