# $Id$
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

pkgname=runit
pkgver=2.1.2
pkgrel=0
pkgdesc='A replacement for sysvinit, and other init schemes, with service supervision'
url='http://smarden.org/runit/'
license=('custom')
arch=('i686' 'x86_64')
depends=('bash' 'util-linux-ng')
makedepends=('ed')
install='runit.install'
source=("http://smarden.org/runit/runit-$pkgver.tar.gz"
        '1'
        '2'
        '3')
sha256sums=('6fd0160cb0cf1207de4e66754b6d39750cff14bb0aa66ab49490992c0c47ba18'
            'd51e713c3b60149c82c897016a6c007065525dfe91384f9b140aec5280b05fd5'
            'd3ba839507835b70458cef1f33593bf65398d56cd12da43551d20b770b3d514a'
            '23e8557456a32c79c2688e656cfde0edde20d2103ba5cc519640cf0d479485ec')

backup=('etc/runit/1'
        'etc/runit/2'
        'etc/runit/3'
        'etc/runit/ctrlaltdel'
        'etc/runit/runsvdir/'
        'etc/runit/runsvdir/all'
        'etc/runit/runsvdir/all/getty-1/run'
        'etc/runit/runsvdir/all/getty-1/finish'
        'etc/runit/runsvdir/all/getty-2/run'
        'etc/runit/runsvdir/all/getty-2/finish'
        'etc/runit/runsvdir/all/getty-3/run'
        'etc/runit/runsvdir/all/getty-3/finish'
        'etc/runit/runsvdir/all/getty-4/run'
        'etc/runit/runsvdir/all/getty-4/finish')

prepare() {
  cd "admin/$pkgname-$pkgver"

  ## we build nothing static
  ed -s src/Makefile <<< $',s/ -static//g\nw'

  ## set default service path to /var/service
  ed -s src/sv.c <<< $',s/\\/service\\//\\/var&/g\nw'
}

build() {
  cd "admin/$pkgname-$pkgver"

  ## apply custom CFLAGS and LDFLAGS
  echo "${CC:-gcc} $CFLAGS" > src/conf-cc
  echo "${CC:-gcc -s} $LDFLAGS" > src/conf-ld

  ## compile
  make -C 'src'
}

check() {
  cd "admin/$pkgname-$pkgver"

  make -C 'src' check
}

package() {
  cd "admin/$pkgname-$pkgver"

  # default services
  install -dm0755 "$pkgdir/etc/runit/runsvdir/pkg-default"
  install -dm0755 "$pkgdir/etc/runit/runsvdir/all"
  install -dm0755 "$pkgdir/var"

  # set up runit-init
  install -m0755 $srcdir/{1,2,3} "$pkgdir/etc/runit/"
  install -m0755 etc/debian/ctrlaltdel "$pkgdir/etc/runit/"

  ln -s ../etc/runit/runsvdir/current "$pkgdir/var/service" #???

  # install binaries
  install -dm0755 "$pkgdir/usr/bin"
  for f in $(<package/commands); do
    install -sm0755 src/$f "$pkgdir/usr/bin"
  done

  # man-pages
  install -dm0755 "$pkgdir/usr/share/man/man8"
  install -m0644 man/* "$pkgdir/usr/share/man/man8"

  # doc
  install -dm0755 "$pkgdir/usr/share/doc/runit"
  install -m0644 doc/*.html "$pkgdir/usr/share/doc/runit"

  # add gettys for 1-4 terminals
  for i in {1..4}; do
    install -dm0755 "$pkgdir/etc/runit/runsvdir/all/getty-$i"
    ln -s ../all/getty-$i "$pkgdir/etc/runit/runsvdir/pkg-default/"
    for f in etc/debian/getty-tty5/*; do
      sed "s/tty5/tty$i/g;s/getty/a&/g;s/sbin/usr\/bin/g" < "$f" \
        > "$pkgdir/etc/runit/runsvdir/all/getty-$i/${f##*/}"
      chmod 0755 "$pkgdir/etc/runit/runsvdir/all/getty-$i/${f##*/}"
    done
  done

  install -Dm0644 package/COPYING "$pkgdir/usr/share/licenses/runit/LICENSE"
}

# vim: ft=sh syn=sh sw=2 ts=2 et
