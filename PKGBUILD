# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=socklog
pkgver=2.1.0
pkgrel=2
pkgdesc="Small and secure syslogd replacement for use with Runit"
arch=('i686' 'x86_64')
depends=('glibc' 'runit')
makedepends=('make')
url="http://smarden.org/socklog/"
license=('BSD')
source=(http://smarden.org/socklog/$pkgname-$pkgver.tar.gz
        headers.patch
        klog.sv.run
        socklog.sv.check
        socklog.sv.log
        socklog.sv.run)
sha256sums=('aa869a787ee004da4e5509b5a0031bcc17a4ab4ac650c2ce8d4e488123acb455'
            '6687d9d7c93c993b99f47948999c03b6b1402cda78d5f854d093ac881171ddf3'
            'ae9864e8dc86fb9d0de74bc988bb0f896c4811d12d52a649374903bd3257246a'
            'f84241c1dff3b67499ecec7be9385c6c190b3b43c839956df8458fb2c0b58f2b'
            '72a094547454b44dfda5cd50a5992ac2f0829450b99033900e68eb301130637f'
            'f62fd60c54e735f95153d1f0018cadb556c56833235f24653855445dc91e152f')
provides=('socklog')

prepare() {
  cd "$srcdir/admin/$pkgname-$pkgver/src"

  msg 'Patching headers...'
  patch -p1 < "$srcdir/headers.patch"

  msg 'Setting default kernel message path to /proc/kmsg...'
  sed -i -e 's:^#define _PATH_KLOG "\/dev\/klog"$:#define _PATH_KLOG "\/proc\/kmsg":' socklog-conf.c
}

build() {
  cd "$srcdir/admin/$pkgname-$pkgver/src"

  msg 'Building...'
  echo "${CC:-gcc} ${CFLAGS:-O2 -Wall}" > conf-cc
  echo "${LD:-gcc -s}" > conf-ld
  make
}

check() {
  cd "$srcdir/admin/$pkgname-$pkgver/src"

  msg 'Testing...'
  make check
}

package() {
  cd "$srcdir/admin/$pkgname-$pkgver/src"
  
  msg 'Installing license...'
  install -D -m644 "$srcdir/admin/$pkgname-$pkgver/package/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  msg 'Installing documentation...'
  install -d "$pkgdir/usr/share/doc/socklog"
  install -D -m644 "$srcdir/admin/$pkgname-$pkgver/doc"/*.html "$pkgdir/usr/share/doc/socklog"

  msg 'Installing man pages...'
  install -d "$pkgdir/usr/share/man/man8"
  install -D -m644 "$srcdir/admin/$pkgname-$pkgver/man"/* "$pkgdir/usr/share/man/man8"

  msg 'Installing executables...'
  install -d "$pkgdir/usr/bin"
  for i in `cat $srcdir/admin/$pkgname-$pkgver/package/commands`; do
    install -s -D -m755 "$srcdir/admin/$pkgname-$pkgver/src/$i" "$pkgdir/usr/bin"
  done

  msg 'Installing Runit service files...'
  mkdir -p "$pkgdir/etc/sv"/{klog,socklog/log}
  install -D -m755 "$srcdir/klog.sv.run" "$pkgdir/etc/sv/klog/run"
  install -D -m755 "$srcdir/socklog.sv.check" "$pkgdir/etc/sv/socklog/check"
  install -D -m755 "$srcdir/socklog.sv.log" "$pkgdir/etc/sv/socklog/log/run"
  install -D -m755 "$srcdir/socklog.sv.run" "$pkgdir/etc/sv/socklog/run"
}
