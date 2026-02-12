# Maintainer: Elven Inquisition <no.one.expects@faerie.me>
# Contributor: Spider.007 <aur@spider007.net>
# Contributor: asukaminato
# Submitter:  Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=unscd
pkgver=0.54
pkgrel=2
pkgdesc='Drop-in replacement for glibc nscd which is designed for simplicity and stability'
arch=('i686' 'x86_64')
url='https://busybox.net/~vda/unscd'
license=('GPL-2.0-only')
depends=('glibc')
source=("${url}/nscd-${pkgver}.c"
        'nscd.service'
        'nscd.conf'
        'nscd.8'
        'handle_nscd_excision.patch')
b2sums=('5c35fec2f4f3447c5d6500a7fc50c97347923d62d084134ced5c412307e8db6079e01302b16ac3e1940ee9194a31ebec464e3bd838fd8b6a650b8c0bdc66349d'
        'a6fd4acb812c15b8077072a2f2ed2ad59866a7ba285f76d92c1443b82ff66f424844fcdef61a867c43cfb03d90a6b7ce8f3c538340ae3c75f5ed7fb4b133662e'
        '58263559ba18c61f1b7e19ce366cf3596506d9888126b74c931a2141b7c244de83804fe0a9e24006787476390d786108d0697c3a7966553a0b8d92d921208633'
        '821cebb620790b382fb36cb4e56b2a1eb41708c4636a831df6339d700d19f5e6afe58bc0a5a0cf013444930eb58b0ba8164243daa3e736a6ce091fe6c9e92046'
        '98397ff524a66713524dccbe897f4ab50f741e08984981e7ac97f7c3be227c661692f2f3c9b7c4c12eaaca359b2571543140918773b2fb5bbe078621cbc9553a')

prepare() {
  patch --follow-symlinks -N -i 'handle_nscd_excision.patch'
}

build() {
  gcc -Wall -Wunused-parameter -fomit-frame-pointer -Wl,--sort-section -Wl,alignment -Wl,--sort-common -Os $CFLAGS $LDFLAGS -o nscd "nscd-$pkgver.c"
}

package() {
  install -D -m 755 nscd -t "$pkgdir/usr/bin/"
  install -D -m 644 nscd.conf -t "$pkgdir/etc/"
  install -D -m 644 nscd.8 -t "$pkgdir/usr/share/man/man8/"
  install -D -m 644 nscd.service -t "$pkgdir/usr/lib/systemd/system/"
}
