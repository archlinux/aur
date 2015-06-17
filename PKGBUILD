# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=minijail
pkgdesc='Tool to run a process in jailed environment'
pkgver=R41.6680
_tag=release-${pkgver/\./-}.B
pkgrel=1
arch=(i686 x86_64)
url='https://chromium.googlesource.com/chromiumos/platform/minijail'
license=('custom:chromiumos')
depends=(libcap)
source=(https://chromium.googlesource.com/chromiumos/platform2/+archive/refs/heads/$_tag.tar.gz)
sha1sums=('SKIP')

prepare() {
  cd minijail
  sed 's/-Werror//' -i common.mk
}

build() {
  cd minijail
  CC=gcc make
}

check() {
  cd minijail
  CC=gcc make tests
  for t in `ls *_unittest`; do ./$t; done
}

package() {
  cd minijail
  install -m755 -D minijail0 "$pkgdir"/usr/bin/minijail0
  install -m755 -D libminijail.so "$pkgdir"/usr/lib/libminijail.so
  install -m755 -D libminijailpreload.so "$pkgdir"/usr/lib/libminijailpreload.so
  install -m644 -D libminijail.h "$pkgdir"/usr/include/libminijail.h
  install -m644 -D minijail0.1 "$pkgdir"/usr/share/man/man1/minijail0.1
  install -m644 -D minijail0.5 "$pkgdir"/usr/share/man/man5/minijail0.5
  install -m644 -D ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
