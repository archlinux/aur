# Maintainer : Austin Cross <austincross@gmail.com>
# Contributor: Joost Molenaar <jjm@j0057.nl>
# Contributor: Tim Meusel <tim@bastelfreak.de>
# Contributor: Brian Maloney

pkgname=fluent-bit
pkgver=5.0.7
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
md5sums=('f8b8795e505c46e3aaeae90132677647')
sha256sums=('a760cdce272d6025100346d27315cc03a9b3466e5a8a24aaae6f2ad6a9cda29f')

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
        -DCMAKE_AR=/usr/bin/ar \
        -DCMAKE_RANLIB=/usr/bin/ranlib \
        ;

    cmake --build "$srcdir/$pkgname-$pkgver-build" || true
    # ranlib to index libbacktrace
    find "$srcdir/$pkgname-$pkgver-build" -name "*.a" -exec ranlib {} \;
    cmake --build "$srcdir/$pkgname-$pkgver-build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname-$pkgver-build"
}

# vim:set ts=2 sw=2 et:
