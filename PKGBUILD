# Maintainer: Spider.007 <aur@spider007.net>
# Contributor: asukaminato
# Submitter:  Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=unscd
pkgver=0.54
pkgrel=1
pkgdesc='Drop-in replacement for glibc nscd which is designed for simplicity and stability'
arch=('i686' 'x86_64')
url='http://busybox.net/~vda/unscd/'
license=('GPL2')
source=("http://busybox.net/~vda/unscd/nscd-$pkgver.c"
        'unscd.service' 'unscd.conf' 'unscd.8')
md5sums=('ddff52893cfc48d0e61035e2596f70d2'
         'f66fcf467518d51880bdf3b85511c53a'
         'cfbab3d1c5b0fe362a218ad15ad2d6e3'
         '9069ba3a3a07673ab1a7cc70018b387e')

prepare() {
  sed -i 's,/etc/nscd.conf,/etc/unscd.conf,g' "nscd-$pkgver.c"
  sed -i 's,/var/run/,/run/,g' "nscd-$pkgver.c"
}

build() {
  gcc -fomit-frame-pointer -Wl,--sort-section -Wl,alignment -Wl,--sort-common \
    -Os $CFLAGS $LDFLAGS -o $pkgname "nscd-$pkgver.c"
}

package() {
  install -D -m 755 unscd -t "$pkgdir/usr/bin/"
  install -D -m 644 unscd.conf -t "$pkgdir/etc/"
  install -D -m 644 unscd.8 -t "$pkgdir/usr/share/man/man8/"
  install -D -m 644 unscd.service -t "$pkgdir/usr/lib/systemd/system/"
}

# vim:set ts=2 sw=2 ft=sh et:
