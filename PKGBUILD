# Maintainer: Elven Inquisition <no.one.expects@faerie.me>
# Contributor: Spider.007 <aur@spider007.net>
# Contributor: asukaminato
# Submitter:  Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=unscd
pkgver=0.54
pkgrel=1
pkgdesc='Drop-in replacement for glibc nscd which is designed for simplicity and stability'
arch=('i686' 'x86_64')
url='https://busybox.net/~vda/unscd/'
license=('GPL-2.0-only')
depends=('glibc')
source=("https://busybox.net/~vda/unscd/nscd-$pkgver.c"
        'unscd.service'
        'unscd.conf'
        'unscd.8')
b2sums=('5c35fec2f4f3447c5d6500a7fc50c97347923d62d084134ced5c412307e8db6079e01302b16ac3e1940ee9194a31ebec464e3bd838fd8b6a650b8c0bdc66349d'
        'a6fd4acb812c15b8077072a2f2ed2ad59866a7ba285f76d92c1443b82ff66f424844fcdef61a867c43cfb03d90a6b7ce8f3c538340ae3c75f5ed7fb4b133662e'
        'd9789f8bb06a0a247f4e09fb28d0049427a413652dab22d8b45e229b99225795bb74e8daa8d9d1adf33d234ca52955ffecb99062b5f12565aa62bdb46fc638f5'
        'b2bd0f67f18609c169ef0cb970a4d08ac669cbfa8b5618c23369a95fc53d198782c322d294a410b25d1ae5d039c7e118bbcfdc7067b124925cfbe39d249e2a81')

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
