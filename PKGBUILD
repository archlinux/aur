# Maintainer: jason ryan <jasonwryan@gmail.com>

pkgname=v86d
pkgver=0.1.10
pkgrel=5
pkgdesc="userspace helper for uvesafb that runs x86 code in an emulated environment"
arch=('i686' 'x86_64')
url="https://github.com/mjanusz/v86d"
license=('GPL2')
depends=('glibc')
makedepends=('git')
options=('!makeflags')
source=("git://github.com/mjanusz/v86d.git#tag=$pkgname-$pkgver"
        v86d_install
        v86d_hook
        modprobe.uvesafb)
md5sums=(SKIP
         '66ab32602ab29cc5635eaac7f3e42283'
         '5f75b8bc4a7ddf595014591e5db263cb'
         '2d7cc8dc6a41916a13869212d0191147')

build() {
  cd "$pkgname"
  ./configure --with-x86emu
  # we only need /usr/include/video/uvesafb.h
  make KDIR=/usr
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

  install -D -m644 "$srcdir/v86d_install" "$pkgdir/usr/lib/initcpio/install/v86d"
  install -D -m644 "$srcdir/v86d_hook" "$pkgdir/usr/lib/initcpio/hooks/v86d"
  install -D -m644 "$srcdir/modprobe.uvesafb" "$pkgdir/usr/lib/modprobe.d/uvesafb.conf"

  # usrmove
  cd "$pkgdir"
  mv sbin usr/bin
}
