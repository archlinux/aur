pkgname=sks
pkgver=1.1.5
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='Synchronizing OpenPGP Key Server'
makedepends=('ocaml' 'db')
url='https://bitbucket.org/skskeyserver/sks-keyserver/'
install='sks.install'
backup=('etc/sks/sksconf'
        'etc/sks/forward.exim'
        'etc/sks/forward.postfix'
        'etc/sks/mailsync'
        'etc/sks/membership'
        'etc/sks/procmail')
source=("https://bitbucket.org/skskeyserver/sks-keyserver/downloads/sks-${pkgver}.tgz"
        '500_debian_fhs.patch'
        'sks-db.service'
        'sks-recon.service')
md5sums=('60bb0ce429e5d223fd4662c286f46e7b'
         '9cf5495b95e84ed91788c04c9ce1b8c1'
         'e8c7dcbb7db3ad879d391a7c0127a068'
         'f28a2d0b151996a99bb006b8e1d29408')

build() {
  cd "$pkgname-$pkgver"

  # patch path
  patch -Np1 -i "$srcdir/500_debian_fhs.patch"

  cp Makefile.local.unused Makefile.local
  sed -i -e 's#LIBDB=-ldb-4.6#LIBDB=-ldb-5.3#g' Makefile.local
  sed -i -e "s#/usr/local#$pkgdir/usr#g" Makefile.local
  sed -i -e "s#/usr/share/man#$pkgdir/usr/share/man#g" Makefile.local

  unset MAKEFLAGS
  make dep
  make CFLAGS="$CFLAGS -I`ocamlc -where` -I ." all
}

package() {
  cd "$pkgname-$pkgver"

  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" install

  install -Dm644 "$srcdir/sks-db.service" "$pkgdir/usr/lib/systemd/system/sks-db.service"
  install -Dm644 "$srcdir/sks-recon.service" "$pkgdir/usr/lib/systemd/system/sks-recon.service"

  mkdir -p "$pkgdir/etc" "$pkgdir/var/lib/sks"

  cp -r sampleWeb/OpenPKG "$pkgdir/var/lib/sks"
  cp -r sampleConfig/debian "$pkgdir/etc/sks"

  sed -i -e 's#/usr/lib/sendmail#/usr/sbin/sendmail#g' "$pkgdir/etc/sks/sksconf"
}
