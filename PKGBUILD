# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=varnish
pkgver=9.0.3
pkgrel=3
pkgdesc="High-performance HTTP accelerator"
arch=('x86_64')
url="https://www.varnish-cache.org/"
license=('BSD-2-Clause')
# Yes, it really does need gcc during runtime to compile its rules.
depends=('gcc' 'gcc-libs' 'libnsl' 'pcre2' 'openssl')
makedepends=('python-docutils' 'python-sphinx' 'openssl')
optdepends=('python: needed for vmod development')
backup=('etc/varnish/default.vcl')
install=$pkgname.install
source=("https://github.com/varnish/varnish/releases/download/varnish-$pkgver/varnish-$pkgver.tar.gz"
	"varnish.service"
	"varnishncsa.service"
	"varnishreload"
	"varnish.logrotate"
	"varnish.sysusers")
sha512sums=('2789cff88632c2279062a109513cc00cab7690785f8f77e90b9968098c71ddcdc6403d6a9edc755b8f4055f0d32d9e330b0bc20fbab92ba80232955942dc912a'
            '815a8c20f68c0cb107243b7bff6b149eca23acbdf9271d74b067158beaa18e6417e4645ad4c6a1d48dbd2e18fcaa7b31467e72e3c3c71da319c627785e27cac6'
            'd364ff29b4d1594356a5bf231f7789924a502e7db9eaa83d7e25bd04d1f44e2471f8dbb72a00b4677780f508f5f5aab21c1dbe6659ab631b9b22ab7ad057b995'
            '9fbb26400ec2e7efee73f59ece9554e6883ea0097d6be21343b678f602d9d228b8b9efe2544e4ac9087038e76f88ac959f2bb27a6b2d97be78c0e7cd7628bb45'
            '4299ba8823c274d479cd5841b9df909771b8a57cde7f8b3f27e49e419419ca084602825a0c446efedb64263fab8cd614d555a5dfad559508ad849c237303a6a5'
            '3cd22ad7f615f93777b85c5cc662c74b6fca5c098ecf5ae4add53103651f81c91214e1043eb9ac8e5c2abbab980edcefcd5cf464dc6f902e60eb819c9ab86fd6')

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

  install -Dm644 "$srcdir/varnish.service" "$pkgdir/usr/lib/systemd/system/varnish.service"
  install -Dm644 "$srcdir/varnishncsa.service" "$pkgdir/usr/lib/systemd/system/varnishncsa.service"
  install -Dm755 "$srcdir/varnishreload" "$pkgdir/usr/bin/varnishreload"
  install -Dm644 "$srcdir/varnish.logrotate" "$pkgdir/etc/logrotate.d/varnish"
  install -Dm644 "$srcdir/varnish.sysusers" "$pkgdir/usr/lib/sysusers.d/varnish.conf"

  # config
  install -Dm644 "etc/example.vcl" "$pkgdir/etc/varnish/default.vcl"

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 -d "$pkgdir/var/lib/varnish"
}
