# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=kmod-git
pkgver=19.33
pkgrel=1
pkgdesc="interface to kernel module operations"
arch=('i686' 'x86_64')
url="http://git.kernel.org/?p=utils/kernel/kmod/kmod.git;a=summary"
license=('GPL2')
depends=('glibc' 'zlib')
makedepends=('git' 'gtk-doc')
conflicts=('kmod')
provides=("kmod=$pkgver")
source=('git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git'
        'depmod-search.conf')
md5sums=(SKIP
         '4b8cbcbc54b9029c99fd730e257d4436')

pkgver() {
  cd 'kmod'
  git describe | {
    IFS=- read M m _
    printf '%s.%s' "${M#v}" "${m:-0}"
  }
}

build() {
  cd kmod

  ./autogen.sh
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --libdir=/usr/lib \
      --disable-python \
      --with-zlib \
      --without-xz

  make
}

package() {
  make -C kmod DESTDIR="$pkgdir" install

  # config directories
  install -dm755 "$pkgdir"/{etc,usr/lib}/{depmod,modprobe}.d

  # add symlinks to kmod
  for tool in {ins,ls,rm}mod modinfo modprobe depmod; do
    ln -s kmod "$pkgdir/usr/bin/$tool"
  done

  # install depmod.d file for search/ dir
  install -m644 "$srcdir/depmod-search.conf" "$pkgdir/usr/lib/depmod.d/search.conf"
}

# vim: ft=sh syn=sh et
