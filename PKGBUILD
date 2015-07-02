# Maintainer: Spider.007 <aur@spider007.net>
# Submitter:  Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=unscd
pkgver=0.52
pkgrel=1
pkgdesc='Drop-in replacement for glibc nscd which is designed for simplicity and stability'
arch=('i686' 'x86_64')
url='http://busybox.net/~vda/unscd/'
license=('GPL2')
source=("http://busybox.net/~vda/unscd/nscd-$pkgver.c"
        'unscd.service' 'unscd.conf' 'unscd.8')
md5sums=('846d108ed997a3cbd94fe953bea40a48'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
  sed -i 's,/etc/nscd.conf,/etc/unscd.conf,g' "nscd-$pkgver.c"
  sed -i 's,/var/run/,/run/,g' "nscd-$pkgver.c"
}

build() {
  gcc -fomit-frame-pointer -Wl,--sort-section -Wl,alignment -Wl,--sort-common \
    -Os $CFLAGS $LDFLAGS -o $pkgname "nscd-$pkgver.c"
}

package() {
  install -D -m 755 unscd "$pkgdir/usr/bin/unscd"
  install -D -m 644 unscd.conf "$pkgdir/etc/unscd.conf"
  install -D -m 644 unscd.8 "$pkgdir/usr/share/man/man8/unscd.8"
  install -D -m 644 unscd.service "$pkgdir/usr/lib/systemd/system/unscd.service"
}

# vim:set ts=2 sw=2 ft=sh et:
