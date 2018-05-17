# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=minijail
pkgdesc='Tool to run a process in jailed environment'
pkgver=55.8872
_tag=release-R${pkgver/\./-}.B
pkgrel=1
arch=(x86_64)
url='https://chromium.googlesource.com/aosp/platform/external/minijail'
license=('custom:chromiumos')
depends=(libcap)
source=(https://chromium.googlesource.com/aosp/platform/external/minijail/+archive/refs/heads/$_tag.tar.gz
        donotredefine_signals.patch)
sha1sums=('SKIP'
          '83115d9e67cfbf47c964b89c84381fab54689b37')

prepare() {
  patch -p1 < donotredefine_signals.patch
}

build() {
  CC=gcc make
}

check() {
  CC=gcc make tests
  for t in `ls *_unittest`; do ./$t; done
}

package() {
  install -m755 -D minijail0 "$pkgdir"/usr/bin/minijail0
  install -m755 -D libminijail.so "$pkgdir"/usr/lib/libminijail.so
  install -m755 -D libminijailpreload.so "$pkgdir"/usr/lib/libminijailpreload.so
  install -m644 -D libminijail.h "$pkgdir"/usr/include/libminijail.h
  install -m644 -D minijail0.1 "$pkgdir"/usr/share/man/man1/minijail0.1
  install -m644 -D minijail0.5 "$pkgdir"/usr/share/man/man5/minijail0.5
  install -m644 -D NOTICE "$pkgdir"/usr/share/licenses/$pkgname/NOTICE
}
