# Maintainner: Kewl <kewl at alto dot eu dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Kurt Marasco <celilo _at_ lavabit _dot_ com>
# Contributor: Pascal Ernster <aur at hardfalcon dot net>
_watch=('https://hiawatha.leisink.net/changelog' '\"version\">(\d[\d.]*\d+)<')

pkgname=hiawatha
pkgver=11.8
pkgrel=1
pkgdesc="Secure and advanced webserver"
url="https://hiawatha.leisink.net/"
arch=('x86_64')
license=('GPL2')
depends=('libxslt' 'mbedtls' 'libxcrypt')
optdepends=('php-fpm: PHP fastcgi'
            'php: letsencrypt/lefh')
makedepends=('cmake')
backup=('etc/hiawatha/hiawatha.conf'
        'etc/hiawatha/cgi-wrapper.conf'
        'etc/hiawatha/mimetype.conf')
source=("https://hiawatha.leisink.net/files/$pkgname-$pkgver.tar.gz" 
        'hiawatha.conf.sample'
        'hiawatha.service'
        'lefh-renew.service'
        'lefh-renew.timer')
sha256sums=('1376763750fb9a88a780bac6aba8707bc2a78f8ee089c62d433e50216a5183bd'
            '4671d2586cbe3cd6497b16ff422c6143cdab40641ef3c9c4988c478351a8f5e7'
            'b5a2671703b52eec376cfc4697b86aafa4f7fdd9b2b9203798e2117770bafa53'
            '2598480f8b249aaf7028ea66bac0195e1c017fb17c2c169b69e0b66413728457'
            'd12c5a68c293f66d95ae4df704ea349adbad972fb25475ab1a0a24fb42bfc70b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/www-data/http/g' extra/logrotate.in

  # Update stock hiawatha.conf
  sed -e 's|#ServerId = www-data|ServerId = http|' \
      -e 's|/var/www/|/srv/http/|g' \
      -e 's|//|/|g' \
      -e 's|#CGIextension = cgi|&\n#TriggerOnCGIstatus = no|g' \
      -e 's|ConnectTo = 127.0.0.1:2005|ConnectTo = 127.0.0.1:9000|g' \
      -e 's|#	Extension = php|&\n#       SessionTimeout = 30|g' \
      -e 's|#ErrorHandler = 404:/error.cgi|&\n#UseGZfile = yes|g' \
      -i config/hiawatha.conf.in
  
  sed -e 's|/etc/init.d/hiawatha restart|systemctl restart hiawatha.service|' \
      -i extra/letsencrypt/letsencrypt.conf.in

  # Fix signal handler prototypes for GCC >= 12
  sed -i 's/void \([A-Z0-9_]*_handler\)()/void \1(int sig)/g' src/hiawatha.c
  sed -i 's/void \([A-Z0-9_]*_handler\)()/void \1(int sig)/g' src/cgi-wrapper.c

  # Add (void)sig; to silence unused warnings if handler doesn't use the signal
  sed -i '/^{/a \    (void)sig;' src/hiawatha.c
  sed -i '/^{/a \    (void)sig;' src/cgi-wrapper.c
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build

  cmake ../ -DCMAKE_INSTALL_PREFIX="/" \
            -DCMAKE_INSTALL_BINDIR="/usr/bin" \
            -DCMAKE_INSTALL_SBINDIR="/usr/bin" \
            -DCMAKE_INSTALL_SYSCONFDIR="/etc/hiawatha" \
            -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
            -DCMAKE_INSTALL_MANDIR="/usr/share/man" \
            -DCONFIG_DIR="/etc/hiawatha" \
            -DLOG_DIR="/var/log/hiawatha" \
            -DPID_DIR="/run" \
            -DENABLE_TLS=ON \
            -DUSE_SYSTEM_MBEDTLS=ON \
            -DENABLE_MONITOR=ON \
            -DWEBROOT_DIR="/srv/http/hiawatha" \
            -DWORK_DIR="/var/lib/hiawatha" \
            -DCMAKE_POLICY_VERSION_MINIMUM=3.5

  make

  # Features enabled by default
  # -DENABLE_CACHE
  # -DENABLE_IPV6
  # -DENABLE_RPROXY
  # -DENABLE_TOOLKIT
  # -DENABLE_XSLT

  # Features disabled by default
  # -DENABLE_DEBUG
  # -DENABLE_TOMAHAWK
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install
 
  rmdir "$pkgdir/run"
  rm "$pkgdir/srv/http/hiawatha/index.html"
  rmdir -p --ignore-fail-on-non-empty "$pkgdir/srv/http/hiawatha"
 
  install -Dm644 logrotate.d/hiawatha "$pkgdir/etc/logrotate.d/hiawatha"
  cd "$srcdir"
  install -Dm644 hiawatha.service   "$pkgdir/usr/lib/systemd/system/hiawatha.service"
  install -Dm644 lefh-renew.service "$pkgdir/usr/lib/systemd/system/lefh-renew.service"
  install -Dm644 lefh-renew.timer   "$pkgdir/usr/lib/systemd/system/lefh-renew.timer"
  install -Dm644 hiawatha.conf.sample "$pkgdir/etc/hiawatha/"
}

