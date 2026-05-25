# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=varnish
pkgver=9.0.3
_pkg_varnish_cache_commit=4cde786
pkgrel=1
pkgdesc="High-performance HTTP accelerator"
arch=('x86_64')
url="https://www.varnish-cache.org/"
license=('BSD-2-Clause')
# Yes, it really does need gcc during runtime to compile its rules.
depends=('gcc' 'gcc-libs' 'libnsl' 'pcre2' 'openssl')
makedepends=('python-docutils' 'python-sphinx' 'git' 'openssl')
optdepends=('python: needed for vmod development')
backup=('etc/varnish/default.vcl')
install=$pkgname.install
source=("https://github.com/varnish/varnish/releases/download/varnish-$pkgver/varnish-$pkgver.tar.gz"
        "git+https://github.com/varnish/pkg-varnish-cache.git#commit=$_pkg_varnish_cache_commit")
sha512sums=('2789cff88632c2279062a109513cc00cab7690785f8f77e90b9968098c71ddcdc6403d6a9edc755b8f4055f0d32d9e330b0bc20fbab92ba80232955942dc912a'
            '2011efa62703f2f05743665c2a913559b0cfe64b02d35698f6033b697ecd4273eac722fd26f628c64398516d767a0a487f6628f92afd678897737c263935464f')

MAKEFLAGS="--jobs=$(nproc)"

build() {
  cd "varnish-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var/lib \
    --sbindir=/usr/bin

  make
}

check() {
  cd "varnish-$pkgver"

  make check
}

package() {
  cd "varnish-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/pkg-varnish-cache/varnish/systemd/varnish.service" "$pkgdir/usr/lib/systemd/system/varnish.service"
  install -Dm644 "$srcdir/pkg-varnish-cache/varnish/systemd/varnishncsa.service" "$pkgdir/usr/lib/systemd/system/varnishncsa.service"
  install -Dm755 "$srcdir/pkg-varnish-cache/varnish/systemd/varnishreload" "$pkgdir/usr/bin/varnishreload"
  install -Dm755 "$srcdir/pkg-varnish-cache/varnish/systemd/varnish.logrotate" "$pkgdir/etc/logrotate.d/varnish"
  install -Dm755 "$srcdir/pkg-varnish-cache/varnish/systemd/varnish.sysusers" "$pkgdir/usr/lib/sysusers.d/varnish.conf"

  # config
  install -Dm644 "etc/example.vcl" "$pkgdir/etc/varnish/default.vcl"

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
